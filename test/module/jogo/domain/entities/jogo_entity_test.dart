import 'package:flutter_test/flutter_test.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogo_entity.dart';

void main() {
  late JogoEntity jogo;

  setUp(() {
    jogo = JogoEntity();
  });

  test('jogo entity - init', () async {
    expect(
        jogo.base,
        List.generate(
            3, (index) => [Jogador.vazio, Jogador.vazio, Jogador.vazio]));
    expect(jogo.jogadorAtual, Jogador.x);
  });

  test('jogo entity - setJogada', () async {
    expect(
        jogo.base,
        List.generate(
            3, (index) => [Jogador.vazio, Jogador.vazio, Jogador.vazio]));
    expect(jogo.jogadorAtual, Jogador.x);
    final result = jogo.setJogada(linha: 0, coluna: 0);
    expect(result, null);
    expect(jogo.jogadorAtual, Jogador.o);
  });

  test('jogo entity - setJogada - duplicada', () async {
    expect(
        jogo.base,
        List.generate(
            3, (index) => [Jogador.vazio, Jogador.vazio, Jogador.vazio]));
    expect(jogo.jogadorAtual, Jogador.x);
    final result = jogo.setJogada(linha: 0, coluna: 0);
    expect(result, null);
    expect(jogo.jogadorAtual, Jogador.o);
    final resultDupla = jogo.setJogada(linha: 0, coluna: 0);
    expect(resultDupla, isA<String>());
  });

  test('jogo entity - resetJogo', () async {
    expect(
        jogo.base,
        List.generate(
            3, (index) => [Jogador.vazio, Jogador.vazio, Jogador.vazio]));
    expect(jogo.jogadorAtual, Jogador.x);
    final result = jogo.setJogada(linha: 0, coluna: 0);
    expect(result, null);
    expect(jogo.jogadorAtual, Jogador.o);
    jogo.resetJogo();
    expect(
        jogo.base,
        List.generate(
            3, (index) => [Jogador.vazio, Jogador.vazio, Jogador.vazio]));
    expect(jogo.jogadorAtual, Jogador.x);
  });
}
