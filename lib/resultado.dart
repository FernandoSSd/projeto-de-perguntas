import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 25) {
      return 'Parabésn!';
    } else if (pontuacao < 35) {
      return 'Você é bom!';
    } else if (pontuacao < 50) {
      return 'Impressionante';
    } else {
      return 'Vaginal!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          fraseResultado,
          style: const TextStyle(fontSize: 28),
        )),
        TextButton(
            onPressed: reiniciarQuestionario,
            child: const Text(
              'Reiniciar?',
              style: TextStyle(
                fontSize: 18,
              ),
            ))
      ],
    );
  }
}
