import 'dart:math';

import 'package:flutter/material.dart';

class SpeakerCard extends StatefulWidget {
  const SpeakerCard({
    required this.size,
    super.key,
  });

  final double size;

  @override
  State<SpeakerCard> createState() => _SpeakerCardState();
}

class _SpeakerCardState extends State<SpeakerCard>
    with SingleTickerProviderStateMixin {
  //
  // Controllers
  //
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _rotationCurve;

  //
  // Flags
  //
  bool showFront = true;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _rotationCurve = CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      _rotationCurve,
    );
  }

  void _rotateWidget() {
    if (_rotationController.isAnimating) {
      return;
    }
    if (showFront) {
      _rotationController.forward();
    } else {
      _rotationController.reverse();
    }

    showFront = !showFront;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: AnimatedBuilder(
          animation: _rotationController,
          builder: (context, child) {
            final value = _rotationAnimation.value;
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(showFront ? value * -pi : value * pi),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  _rotateWidget();
                },
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ]),
                  child: (value < 0.5)
                      ? Image.asset('assets/images/test_speaker_template.png')
                      : Transform.scale(
                          scaleX: -1,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec scelerisque, turpis lacinia dictum varius, sapien libero rutrum nulla, ac tristique nisl sapien eget tellus. Etiam at quam nec mi posuere elementum. Cras vehicula metus vel felis faucibus, id facilisis purus ornare. Quisque sed euismod magna. Phasellus sit amet erat eu ligula tristique congue. Nunc ex dolor, varius ac venenatis vel, condimentum tincidunt est. Ut pellentesque vulputate felis vel convallis. Quisque a efficitur odio.',
                            ),
                          ),
                        ),
                ),
              ),
            );
          }),
    );
  }
}
