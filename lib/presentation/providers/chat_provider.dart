import 'dart:convert'; // Importa para Base64
import 'dart:io'; // Importa para manejar archivos
import 'package:appwasteio/config/helpers/get_api_answer.dart';
import 'package:appwasteio/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importa shared_preferences

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollContoller = ScrollController();
  final getApiAnswer = GetApiAnswer();

  List<Message> messageList = [];
  List<String> imagePaths = []; // Lista para almacenar las rutas de las imágenes

  // Inicializa las imágenes guardadas al iniciar la app
  Future<void> initImages() async {
    final prefs = await SharedPreferences.getInstance();
    imagePaths = prefs.getStringList('images') ?? [];
    notifyListeners();
  }

  // Convertir la imagen a base64
  Future<String> _imageToBase64(File image) async {
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  }

  // Guardar las rutas de las imágenes en shared_preferences
  Future<void> saveImage(File image) async {
    final prefs = await SharedPreferences.getInstance();

    // Agregar la nueva imagen a la lista
    imagePaths.add(image.path);

    // Limitar la lista a las últimas 10 imágenes
    if (imagePaths.length > 10) {
      imagePaths.removeRange(0, imagePaths.length - 10);
    }

    // Guardar la lista actualizada en shared_preferences
    await prefs.setStringList('images', imagePaths);

    notifyListeners();
  }

  // Enviar imagen a la API y guardar su ruta
  Future<void> sendImage(File image) async {
    // Convertir la imagen a base64
    final base64Image = await _imageToBase64(image);

    // Obtener la hora y fecha actual
    final now = DateTime.now();
    final formattedDate = "${now.hour}:${now.minute} del ${now.day}/${now.month}/${now.year}";

    // Mostrar la imagen como un MyMessageBubble con la fecha y hora
    final myImageMessage = Message(
      text: "Imagen enviada a las $formattedDate",
      imageUrl: base64Image,  // Guardar la imagen en formato base64
      fromWho: FromWho.me,
    );
    _addMessage(myImageMessage);

    // Enviar la imagen a la API
    final herMessage = await getApiAnswer.getAnswerClasification(image);

    // Solo mostrar el texto de la clasificación (Orgánico/Inorgánico) en HerMessageBubble
    final classificationMessage = Message(
      text: herMessage.text,  // Asumimos que herMessage.text contiene el tipo de residuo
      fromWho: FromWho.hers,
    );
    _addMessage(classificationMessage);

    // Guardar la imagen localmente
    await saveImage(image);
  }

  void _addMessage(Message message) {
    messageList.add(message);

    // Mantener solo las últimas 10 respuestas y las últimas 10 imágenes
    final messagesFromHer = messageList.where((msg) => msg.fromWho == FromWho.hers).toList();
    final messagesFromMe = messageList.where((msg) => msg.fromWho == FromWho.me && msg.imageUrl != null).toList();

    if (messagesFromHer.length > 10) {
      messageList.removeWhere((msg) => msg.fromWho == FromWho.hers && messagesFromHer.indexOf(msg) < messagesFromHer.length - 10);
    }

    if (messagesFromMe.length > 10) {
      messageList.removeWhere((msg) => msg.fromWho == FromWho.me && msg.imageUrl != null && messagesFromMe.indexOf(msg) < messagesFromMe.length - 10);
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollContoller.animateTo(chatScrollContoller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.easeInCirc);
  }
}
