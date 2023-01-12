import 'package:flutter/material.dart';

enum Jogador { x, o, vazio }

class JogoEntity extends ChangeNotifier {
  final List<List<Jogador>> base = List.generate(
      3, (index) => [Jogador.vazio, Jogador.vazio, Jogador.vazio]);
  Jogador jogadorAtual = Jogador.x;
  int placarJogadorX = 0;
  int placarJogadorO = 0;
  bool jogoFinalizado = false;

  void addPontoJogador({required Jogador jogador}) {
    if (jogador == Jogador.x) {
      placarJogadorX += 1;
    } else if (jogador == Jogador.o) {
      placarJogadorO += 1;
    }
    jogoFinalizado = true;
    notifyListeners();
  }

  String? setJogada({required int linha, required int coluna}) {
    if (base[linha][coluna] != Jogador.vazio) {
      return 'Posição já escolhida pelo jogador: ${base[linha][coluna].name.toUpperCase()}';
    }
    base[linha][coluna] = jogadorAtual;
    _alteraJogadorAtual();
    return null;
  }

  void _alteraJogadorAtual() {
    if (jogadorAtual == Jogador.x) {
      jogadorAtual = Jogador.o;
    } else {
      jogadorAtual = Jogador.x;
    }
    notifyListeners();
  }

  void zerarJogo() {
    placarJogadorO = 0;
    placarJogadorX = 0;
    resetJogo();
  }

  void resetJogo() {
    base.clear();

    base.addAll(List.generate(
        3, (index) => [Jogador.vazio, Jogador.vazio, Jogador.vazio]));
    jogoFinalizado = false;
    _alteraJogadorAtual();
    notifyListeners();
  }
}
