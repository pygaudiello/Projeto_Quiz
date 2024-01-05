import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  // ignore: use_key_in_widget_constructors
  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao == 5) {
      return 'Você sabe mesmo hein?\nAcertou todas';
    } else if (pontuacao == 4) {
      return 'Chegou muito perto!\nVocê acertou 4/5';
    } else if (pontuacao == 3) {
      return 'Você até sabe alguma coisa!\nVocê acertou 3/5';
    } else if (pontuacao == 2) {
      return 'Você tentou!\nVocê acertou 2/5';
    } else if (pontuacao == 1) {
      return 'Poxaa!\nVocê acertou 1/5';
    } else {
      return 'Você errou todas\n:(';
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
            style: const TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20.0),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 255, 255, 255)),
          ),
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 207, 176, 0),
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
