import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isUserMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isUserMessage ? Colors.green : Colors.grey[200];
    final textColor = isUserMessage ? Colors.white : Colors.black87;
    final alignment = isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final margin = isUserMessage
        ? const EdgeInsets.only(left: 50, right: 8, top: 4, bottom: 4)
        : const EdgeInsets.only(right: 50, left: 8, top: 4, bottom: 4);

    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7, // Limit width to 70% of screen width
        ),
        margin: margin,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
