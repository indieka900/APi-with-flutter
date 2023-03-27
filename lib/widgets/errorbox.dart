import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Animate(
        effects: const [
          // BlurEffect(
          //   //duration: Duration(seconds: 1),
          //   curve: Curves.easeIn,
          // ),
        ],
        child: Container(
          height: 165,
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
            child: SelectableText(
              message,
              style: const TextStyle(
                color: Color.fromARGB(255, 3, 54, 18),
                fontSize: 22,
              ),
            ),
          ),
        ),
      )
          .animate(
            onPlay: (controller) => controller.loop(count: 3, reverse: true),
          )
          .fadeIn(
            duration: const Duration(seconds: 2),
          )
          //.slideY(begin: -1.5)
          .then()
          .shake(
            //hz: 4,
            duration: const Duration(milliseconds: 400),
          )
          .then()
          .shimmer(duration: const Duration(seconds: 1)),
    );
  }
}
