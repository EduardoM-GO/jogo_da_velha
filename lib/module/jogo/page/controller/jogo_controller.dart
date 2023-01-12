import 'package:flutter/material.dart';
import 'package:jogo_velha/core/utils/dialogs_widget.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogador_ganhador.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogo_entity.dart';
import 'package:jogo_velha/module/jogo/domain/use_cases/verifica_se_ganhou_use_case.dart';

class JogoController {
  final JogoEntity jogo;
  final VerificaSeGanhouUseCase useCase;

  JogoController()
      : jogo = JogoEntity(),
        useCase = VerificaSeGanhouUseCase();

  String getJogadorAtual() => jogo.jogadorAtual.name.toUpperCase();

  List<List<Jogador>> getBase() => jogo.base;

  int placarX() => jogo.placarJogadorX;
  int placarO() => jogo.placarJogadorO;

  bool jogoFinalizado() => jogo.jogoFinalizado;

  JogadorGanhador? jogadorGanhador;

  void setJogada(
      {required BuildContext context,
      required int linha,
      required int coluna}) {
    final Jogador jogador = jogo.jogadorAtual;
    final result = jogo.setJogada(linha: linha, coluna: coluna);
    if (result != null) {
      DialogsWidget.alert(context: context, message: result);
      return;
    }
    final resultGanhador = useCase(base: jogo.base, jogador: jogador);
    if (resultGanhador != null) {
      jogo.addPontoJogador(jogador: resultGanhador.jogador);
      jogadorGanhador = resultGanhador;
      DialogsWidget.alert(
          context: context,
          message: resultGanhador.jogador == Jogador.vazio
              ? 'Deu velha !!!'
              : 'O Jogador ${resultGanhador.jogador.name.toUpperCase()} Ganhou!!!');
      return;
    }
    jogadorGanhador = null;
  }

  void resetaJogo() {
    jogadorGanhador = null;

    jogo.resetJogo();
  }

  void zerarJogo() {
    jogadorGanhador = null;
    jogo.zerarJogo();
  }

  void dispose() {
    jogo.dispose();
  }
}
