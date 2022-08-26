import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';

void main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Roxo', 'pontuacao': 10},
        {'texto': 'Amarelo', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Lobo', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Águia', 'pontuacao': 10},
        {'texto': 'Tigre', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual seu desenho favorito?',
      'respostas': [
        {'texto': 'Hora de Áventura', 'pontuacao': 10},
        {'texto': 'Rick and Morty', 'pontuacao': 10},
        {'texto': 'South Park', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual sua comida favorita?',
      'respostas': [
        {'texto': 'Hamburguer', 'pontuacao': 10},
        {'texto': 'Pizza', 'pontuacao': 5},
        {'texto': 'Lasanha', 'pontuacao': 10},
        {'texto': 'Cachorro Quente', 'pontuacao': 8},
      ],
    },
    {
      'texto': 'Qual seu jogo favorito?',
      'respostas': [
        {'texto': 'Zelda', 'pontuacao': 7},
        {'texto': 'The Last of Us', 'pontuacao': 10},
        {'texto': 'GTA', 'pontuacao': 8},
        {'texto': 'FIFA', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
