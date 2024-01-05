import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:
              const Color.fromARGB(255, 207, 176, 0), // Cor de fundo do botão
          onPrimary: Colors.white, // Cor do texto do botão
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
