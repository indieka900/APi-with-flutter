import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        height: 125,
        padding: const EdgeInsets.only(right: 10, top: 12, left: 18),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          color: Color.fromARGB(255, 230, 129, 92),
        ),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 54, 18),
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}