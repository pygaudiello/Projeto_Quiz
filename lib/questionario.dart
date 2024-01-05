import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoresponder;

  // ignore: use_key_in_widget_constructors
  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoresponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 0,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white), // Alterado para branco
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: respostas.map((resp) {
              return Resposta(
                resp['texto'] as String,
                () => quandoresponder(int.parse(resp['pontuacao'].toString())),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
