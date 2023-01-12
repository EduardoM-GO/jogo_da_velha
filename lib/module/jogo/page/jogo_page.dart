import 'package:flutter/material.dart';
import 'package:jogo_velha/module/jogo/page/controller/jogo_controller.dart';
import 'package:jogo_velha/module/jogo/widgets/base_jogo_widget.dart';
import 'package:jogo_velha/module/jogo/widgets/placar_widget.dart';

class JogoPage extends StatefulWidget {
  const JogoPage({Key? key}) : super(key: key);

  @override
  State<JogoPage> createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  late final JogoController _controller;

  @override
  void initState() {
    super.initState();
    _controller = JogoController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
            animation: _controller.jogo,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlacarWidget(
                      reiniciarJogo: _controller.resetaJogo,
                      zeraJogo: _controller.zerarJogo,
                      placarX: _controller.placarX(),
                      placarO: _controller.placarO(),
                    ),
                    Text(
                      'Vez do Jogador: ${_controller.getJogadorAtual()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    BaseJogoWidget(
                      setJogada: _controller.setJogada,
                      base: _controller.getBase(),
                      jogoFinalizado: _controller.jogoFinalizado(),
                      jogadorGanhador: _controller.jogadorGanhador,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
