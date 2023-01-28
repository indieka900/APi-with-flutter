import 'package:flutter/material.dart';
import 'package:home_app/chatGPT/addform.dart';
import 'package:home_app/chatGPT/chatgpt1.dart';
import 'package:home_app/chatGPT/chatgpt2.dart';
import 'package:home_app/chatGPT/whatsaapclone.dart';
import 'package:home_app/widgets/kcb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Kcbdraft(),
        '/api': (context) => const MyVerticalContainer(),
        '/create': (context) => const PersonAdd(),
        '/animate': (context) => const MyAnimatedContainer(),
        '/whatsApp': (context) => const ChatList(),
      },
    );
  }
}
