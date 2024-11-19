import 'package:appwasteio/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; // Importa para Base64

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Mostrar el texto del mensaje (hora y fecha de envío)
        Container(
          decoration: BoxDecoration(
            color: colors.primary, 
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, 
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        
        const SizedBox(height: 5), // Espacio entre texto e imagen

        // Mostrar la imagen con bordes redondeados
        if (message.imageUrl != null) 
          ClipRRect(
            borderRadius: BorderRadius.circular(7), // Bordes redondeados
            child: Image.memory(
              base64Decode(message.imageUrl!), // Decodificar base64 y mostrar la imagen
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),

        const SizedBox(height: 10),
      ],
    );
  }
}
