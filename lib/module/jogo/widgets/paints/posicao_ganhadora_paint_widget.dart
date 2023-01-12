import 'package:flutter/material.dart';
import 'package:jogo_velha/core/results/resultado_duplo.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogador_ganhador.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogo_entity.dart';

class PosicaoGanhadoraPaintWidget extends CustomPainter {
  final JogadorGanhador jogadorGanhador;
  PosicaoGanhadoraPaintWidget({required this.jogadorGanhador});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    if (jogadorGanhador.jogador == Jogador.vazio) {
      return deuVelha(canvas, paint, size);
    }
    if (jogadorGanhador.posicao1.valor1 == jogadorGanhador.posicao2.valor1) {
      return ganhadorLinha(
          canvas, paint, size, jogadorGanhador.posicao1.valor1);
    }
    if (jogadorGanhador.posicao1.valor2 == jogadorGanhador.posicao2.valor2) {
      return ganhadorColuna(
          canvas, paint, size, jogadorGanhador.posicao1.valor2);
    }
    final bool diagonalPrincipal =
        jogadorGanhador.posicao1 == ResultadoDuplo(0, 0);
    ganhadorDiagonal(canvas, paint, size, diagonalPrincipal);
  }

  //?Gera o risco na Vertical mostrando a linha ganhadora
  void ganhadorColuna(Canvas canvas, Paint paint, Size size, int coluna) {
    late final double valorDivisao;
    if (coluna == 0) {
      valorDivisao = 6;
    } else if (coluna == 1) {
      valorDivisao = 2;
    } else {
      valorDivisao = 1.2;
    }

    Offset startingPoint = Offset(size.width / valorDivisao, 0);
    Offset endingPoint = Offset(size.width / valorDivisao, size.height);
    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  //?Gera o risco na horizontal mostrando a linha ganhadora
  void ganhadorLinha(Canvas canvas, Paint paint, Size size, int linha) {
    late final double valorDivisao;
    if (linha == 0) {
      valorDivisao = 6;
    } else if (linha == 1) {
      valorDivisao = 2;
    } else {
      valorDivisao = 1.2;
    }

    Offset startingPoint = Offset(0, size.height / valorDivisao);
    Offset endingPoint = Offset(size.width, size.height / valorDivisao);
    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  //? Gera o risco na diagonal mostrando a linha ganhadora
  void ganhadorDiagonal(Canvas canvas, Paint paint, Size size, bool principal) {
    const double diferenciaAltura = 30;
    const double diferenciaLargura = 30;
    late final Offset startingPoint;
    late final Offset endingPoint;
    if (principal) {
      startingPoint = const Offset(diferenciaLargura, diferenciaAltura);
      endingPoint = Offset(
          size.width - diferenciaLargura, size.height - diferenciaAltura);
    } else {
      startingPoint = Offset(diferenciaLargura, size.height - diferenciaAltura);
      endingPoint = Offset(size.width - diferenciaLargura, diferenciaAltura);
    }
    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  void deuVelha(Canvas canvas, Paint paint, Size size) {
    const double diferenciaAltura = 30;
    const double diferenciaLargura = 30;
    Offset startingPoint =
        Offset(diferenciaLargura, size.height - diferenciaAltura);
    Offset endingPoint =
        Offset(size.width - diferenciaLargura, diferenciaAltura);

    canvas.drawLine(startingPoint, endingPoint, paint);
    startingPoint = const Offset(diferenciaLargura, diferenciaAltura);
    endingPoint =
        Offset(size.width - diferenciaLargura, size.height - diferenciaAltura);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
