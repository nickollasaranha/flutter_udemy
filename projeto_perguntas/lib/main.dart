import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {"texto": "Preto", "pontuacao": 10},
        {"texto": "Vermelho", "pontuacao": 5},
        {"texto": "Verde", "pontuacao": 3},
        {"texto": "Branco", "pontuacao": 1},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {"texto": "Coelho", "pontuacao": 10},
        {"texto": "Cobra", "pontuacao": 5},
        {"texto": "Elefante", "pontuacao": 3},
        {"texto": "Leão", "pontuacao": 1},
      ],
    },
    {
      'texto': "Qual é o seu instrutor favorito?",
      'respostas': [
        {"texto": "Maria", "pontuacao": 10},
        {"texto": "João", "pontuacao": 5},
        {"texto": "Leo", "pontuacao": 3},
        {"texto": "Pedro", "pontuacao": 1},
      ],
    }
  ];

  bool get hasQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (hasQuestion) {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasQuestion
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                onResp: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
