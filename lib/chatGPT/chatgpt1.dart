//import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  //late Animation _widthAnimation;
  late Animation _heightAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    // _widthAnimation =
    //     Tween<double>(begin: 100, end: 700).animate(_animationController);
    _heightAnimation =
        Tween<double>(begin: 300, end: 200).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _heightAnimation,
          builder: (context, child) {
            return Container(
              width: 200,
              height: _heightAnimation.value,
              color: Colors.blue,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
