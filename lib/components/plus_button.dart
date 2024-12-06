import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class PlusButton extends StatelessWidget {
  final function;
  PlusButton({required this.function, super.key});
  final SpeechToText _speechToText = SpeechToText();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: function,
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                  _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                  color: Colors.white,
                ),
                ),
              ),
            );
  }
}