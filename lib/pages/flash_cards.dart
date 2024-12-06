import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mio_1/components/flashcard_view.dart';
import 'package:mio_1/components/my_flashcard.dart';

class FlashCardsPage extends StatelessWidget {
  FlashCardsPage({Key? key}) : super(key: key);

  final List<Flashcard> _flashcards = [
    Flashcard(
        question: "What programming language does Flutter use?",
        answer: "Dart"),
    Flashcard(question: "Who you gonna call?", answer: "Ghostbusters!"),
    Flashcard(
        question: "Who teaches you how to write sexy code?",
        answer: "Sultan Akimaliyev 100%!")
  ];

  // Use a ValueNotifier to track the current index
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  void showNextCard() {
    _currentIndex.value =
        (_currentIndex.value + 1 < _flashcards.length) ? _currentIndex.value + 1 : 0;
  }

  void showPreviousCard() {
    _currentIndex.value =
        (_currentIndex.value - 1 >= 0) ? _currentIndex.value - 1 : _flashcards.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("F L A S H  C A R D S"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30), // Adds spacing to push FlipCard container higher
              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white, // Light green background color
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(16),
                child: ValueListenableBuilder<int>(
                  valueListenable: _currentIndex,
                  builder: (context, index, child) {
                    return FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: Container(
                        color: Colors.transparent, // Green background for the front
                        child: FlashcardView(
                          text: _flashcards[index].question,
                        ),
                      ),
                      back: Container(
                        color: Colors.green.shade400, // Darker green background for the back
                        child: FlashcardView(
                          text: _flashcards[index].answer,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                  ),
                ],
              ),
              SizedBox(height: 30), // Adds spacing below the buttons
            ],
          ),
        ),
      ),
    );
  }
}
