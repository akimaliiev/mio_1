import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mio_1/components/message_bublle.dart';
import 'package:mio_1/components/my_drawer.dart';
import 'package:mio_1/components/plus_button.dart';
import 'package:mio_1/service/openai_service.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SpeechToText _speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  final List<Map<String, dynamic>> _messages = [];

  bool _speechEnabled = false;
  String _wordSpoken = "";
  double _confidenceLevel = 0;
  final OpenaiService openAIService = OpenaiService();
  String? generatedContent;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  void initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
  }

  void initSpeechToText() async {
    _speechEnabled = await _speechToText.initialize(
      onError: (val) => print('Error: $val'),
      onStatus: (val) => print('Status: $val'),
    );
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordSpoken = result.recognizedWords;
      _confidenceLevel = result.confidence;
    });

    // Add the user's spoken text as a message
    _addMessage(_wordSpoken, isUserMessage: true);
  }

  void _addMessage(String message, {required bool isUserMessage}) {
    setState(() {
      _messages.add({
        'message': message,
        'isUserMessage': isUserMessage,
      });
    });
  }

  Future<void> _processSpeech() async {
    if (_wordSpoken.isNotEmpty) {
      try {
        final response = await openAIService.isArtPromptAPI(_wordSpoken);
        generatedContent = response;

        // Add the ChatGPT response as a message
        _addMessage(response, isUserMessage: false);

        _systemSpeak(response);
      } catch (e) {
        print("Error in OpenAI API call: $e");
      }
    }
  }

  void _systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    _speechToText.stop();
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: const Text('M I O'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false, // Display new messages at the bottom
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(
                  message: message['message'],
                  isUserMessage: message['isUserMessage'],
                );
              },
            ),
          ),
          if (_speechToText.isNotListening && _confidenceLevel > 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Confidence rate: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          PlusButton(
            function: () async {
              if (!_speechEnabled) {
                initSpeechToText();
              } else if (_speechToText.isNotListening) {
                _startListening();
              } else {
                _stopListening();
                await _processSpeech();
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
