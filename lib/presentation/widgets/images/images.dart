import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:appwasteio/presentation/providers/chat_provider.dart';

class ImageSelectorScreen extends StatefulWidget {
  const ImageSelectorScreen({super.key});

  @override
  _ImageSelectorScreenState createState() => _ImageSelectorScreenState();
}

class _ImageSelectorScreenState extends State<ImageSelectorScreen> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Enviar imagen seleccionada al ChatProvider
      context.read<ChatProvider>().sendImage(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image != null
            ? const Text('')
            : const Text('No has seleccionado una imagen'),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: const Text('Tomar Foto'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: const Text('Abrir Galería'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
