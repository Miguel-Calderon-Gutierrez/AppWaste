import 'package:appwasteio/config/theme/app_theme.dart';
import 'package:appwasteio/presentation/providers/chat_provider.dart';
import 'package:appwasteio/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ]
      ,
      child: MaterialApp(
        title: 'Waste Clasification',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen()
      ),
    );
  }
}
