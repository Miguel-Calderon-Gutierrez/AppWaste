import 'package:appwasteio/domain/entities/message.dart';
import 'package:appwasteio/presentation/providers/chat_provider.dart';
import 'package:appwasteio/presentation/widgets/chat/her_message_bubble.dart';
import 'package:appwasteio/presentation/widgets/chat/my_message_bubble.dart';
import 'package:appwasteio/presentation/widgets/images/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmTg0McqdjewsAh3SGDaNE_S3e56OCjj6Qmw&s"),
            ),
          ),
          title: const Text(
            "google-vit-base-patch16-224-Waste-O-I-classification",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          titleTextStyle:
              const TextStyle(fontSize: 12, fontStyle: FontStyle.normal)),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollContoller,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),

            //caja de texto de mensajes
            const SizedBox(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child:// MessageFieldBox( onValue: chatProvider.sendMessage,),
                   ImageSelectorScreen()
                ))
          ],
        ),
      ),
    );
  }
}
