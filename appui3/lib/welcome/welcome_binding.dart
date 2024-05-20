import 'package:appui3/welcome/welcome_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroductionScreen(
        scrollPhysics: BouncingScrollPhysics(),
        onDone: WelcomeController().onIntroDone(),
        onSkip: WelcomeController().onIntroDone(),
        dotsDecorator: DotsDecorator(),
      ),
    );
  }
}
