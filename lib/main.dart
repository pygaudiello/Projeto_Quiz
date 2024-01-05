import 'package:flutter/material.dart';

import './resultado.dart';
import 'questionario.dart';

void main() {
  runApp(const PerguntaAPP());
}

class _PerguntaAppState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Onde se passa o jogo do FNAF?', //0
      'respostas': [
        {'texto': 'Hamburgueria', 'pontuacao': 0},
        {'texto': 'Shopping', 'pontuacao': 0},
        {'texto': 'Vendinha de Hot Dog', 'pontuacao': 0},
        {'texto': 'Pizzaria', 'pontuacao': 1},
        {'texto': 'Loja de Roupas', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual o nome do Animatronic de Raposa?',
      'respostas': [
        {'texto': 'Chica', 'pontuacao': 0},
        {'texto': 'Foxy', 'pontuacao': 1},
        {'texto': 'Bonnie', 'pontuacao': 0},
        {'texto': 'Fred', 'pontuacao': 0},
        {'texto': 'Balloon Boy', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'No jogo qual é a profissao do jogador?',
      'respostas': [
        {'texto': 'Pizzaiolo', 'pontuacao': 0},
        {'texto': 'Garçom', 'pontuacao': 0},
        {'texto': 'Guarda Noturno', 'pontuacao': 1},
        {'texto': 'Zelador', 'pontuacao': 0},
        {'texto': 'Bombeiro', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual foi a primeira vítima de William Afton?',
      'respostas': [
        {'texto': 'Charlote', 'pontuacao': 1},
        {'texto': 'Suzie', 'pontuacao': 0},
        {'texto': 'Maddie', 'pontuacao': 0},
        {'texto': 'Cassidy', 'pontuacao': 0},
        {'texto': 'Criança Chorona', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual alma está no Golden Fredddy',
      'respostas': [
        {'texto': 'Charlote', 'pontuacao': 0},
        {'texto': 'Criança Chorona', 'pontuacao': 0},
        {'texto': 'Anna', 'pontuacao': 0},
        {'texto': 'Suzie', 'pontuacao': 0},
        {'texto': 'Cassidy', 'pontuacao': 1},
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Quiz de Five Nights At Freddy's")),
          backgroundColor:
              const Color.fromARGB(255, 207, 176, 0), // Cor da AppBar
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoresponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  const PerguntaAPP({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
