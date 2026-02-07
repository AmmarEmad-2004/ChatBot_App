import 'package:chatbot_app/modules/home/data/models/massage_model.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/ai_typing.dart';
import 'package:chatbot_app/modules/home/presentation/screens/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreenMassages extends StatefulWidget {
  const ChatScreenMassages({
    required this.messages,
    super.key,
    required this.isTyping,
  });

  final List<MassageModel> messages;
  final bool isTyping;

  @override
  State<ChatScreenMassages> createState() => _ChatScreenMassagesState();
}

class _ChatScreenMassagesState extends State<ChatScreenMassages> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant ChatScreenMassages oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.messages.length != oldWidget.messages.length) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: ListView.builder(
        controller: _scrollController, 
        padding: const EdgeInsets.all(8),
        itemCount: widget.messages.length + (widget.isTyping ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < widget.messages.length) {
            return ChatBubble(message: widget.messages[index]);
          } else {
            return const AiTyping();
          }
        },
      ),
    );
  }
}
