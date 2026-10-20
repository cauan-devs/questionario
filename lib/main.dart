import 'package:flutter/material.dart';
import 'package:projeto_ws/resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'qual sua comida favorita?',
      'respostas': [
        {'texto': 'Pizza', 'pontuação': 4},
        {'texto': 'Abacaxi', 'pontuação': 6},
        {'texto': 'Morango', 'pontuação': 3},
        {'texto': 'Hambúrguer', 'pontuação': 10},
      ],
    },
    {
      'texto': 'qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuação': 5},
        {'texto': 'Cobra', 'pontuação': 8},
        {'texto': 'Elefante', 'pontuação': 4},
        {'texto': 'Leão', 'pontuação': 7},
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
    debugPrint(_pontuacaoTotal as String?);
  }

  void _reiniciarPerguntas() {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('perguntas'), centerTitle: true),
        body: temPerguntaSelecionada
            ? Questionario.name(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado.name(_pontuacaoTotal, _reiniciarPerguntas),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
