import 'package:flutter/material.dart';
import 'package:projeto_perguntas/perguntas.dart';

import 'core/images_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((_) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PerguntaApp())));

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: 900,
          height: 900,
          child: Image.asset(
            AppImages.logo1,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
