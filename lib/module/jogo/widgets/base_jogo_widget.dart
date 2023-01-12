// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogador_ganhador.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogo_entity.dart';
import 'package:jogo_velha/module/jogo/widgets/jogada_widget.dart';
import 'package:jogo_velha/module/jogo/widgets/paints/posicao_ganhadora_paint_widget.dart';

class BaseJogoWidget extends StatelessWidget {
  final void Function(
      {required BuildContext context,
      required int linha,
      required int coluna}) setJogada;
  final List<List<Jogador>> base;
  final bool jogoFinalizado;
  final JogadorGanhador? jogadorGanhador;

  const BaseJogoWidget({
    Key? key,
    required this.setJogada,
    required this.base,
    required this.jogoFinalizado,
    required this.jogadorGanhador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: MediaQuery.of(context).size.width - 16,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Material(
            color: Theme.of(context).colorScheme.primary,
            child: IgnorePointer(
              ignoring: jogoFinalizado,
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 3,
                ),
                children: [
                  ...List.generate(
                    3,
                    (index) => JogadaWidget(
                      onTap: () =>
                          setJogada(context: context, linha: 0, coluna: index),
                      jogador: base[0][index],
                    ),
                  ),
                  ...List.generate(
                    3,
                    (index) => JogadaWidget(
                      onTap: () =>
                          setJogada(context: context, linha: 1, coluna: index),
                      jogador: base[1][index],
                    ),
                  ),
                  ...List.generate(
                    3,
                    (index) => JogadaWidget(
                      onTap: () =>
                          setJogada(context: context, linha: 2, coluna: index),
                      jogador: base[2][index],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (jogadorGanhador != null)
            CustomPaint(
              painter: PosicaoGanhadoraPaintWidget(
                  jogadorGanhador: jogadorGanhador!),
            ),
        ],
      ),
    );
  }
}
