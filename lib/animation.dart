import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rmsproject/screens.dart';

class animation extends StatefulWidget
{
  @override
  State<animation> createState() => _animationState();
}
class _animationState extends State<animation> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      print(_controller.value);
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (_controller.value > 1.5) {
// When it gets there hold it there.
        _controller.value = 1.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Lottie.asset('images/shop.json',
          fit: BoxFit.cover,
          reverse: false,
          repeat: false,
          animate: true,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),

                  ));
          },
        ),
      ),
    );
  }
}