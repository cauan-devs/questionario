import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(
    int pontuacaoTotal, {
    super.key,
    required this.pontuacao,
    required this.quandoReiniciarQuest,
  });

  final int pontuacao;
  final void Function() quandoReiniciarQuest;

  Resultado.name(this.pontuacao, this.quandoReiniciarQuest, {super.key});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'impressionante!!';
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 30))),
        TextButton(
          onPressed: quandoReiniciarQuest,
          child: Text("reiniciar?", style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
