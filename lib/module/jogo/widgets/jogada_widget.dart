import 'package:flutter/material.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogo_entity.dart';
import 'package:jogo_velha/module/jogo/widgets/paints/bolinha_paint_widget.dart';
import 'package:jogo_velha/module/jogo/widgets/paints/x_paint_widget.dart';

class JogadaWidget extends StatelessWidget {
  final void Function() onTap;
  final Jogador jogador;
  const JogadaWidget({Key? key, required this.onTap, required this.jogador})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: jogador == Jogador.vazio ? onTap : null,
      child: ColoredBox(
        color: Theme.of(context).colorScheme.onPrimary,
        child: jogador == Jogador.vazio
            ? null
            : CustomPaint(
                painter: Jogador.x == jogador
                    ? XPaintWidget()
                    : BolinhaPaintWidget(),
              ),
      ),
    );
  }
}
