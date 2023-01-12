import 'package:flutter_test/flutter_test.dart';
import 'package:jogo_velha/core/results/resultado_duplo.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogador_ganhador.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogo_entity.dart';
import 'package:jogo_velha/module/jogo/domain/use_cases/verifica_se_ganhou_use_case.dart';

void main() {
  late VerificaSeGanhouUseCase useCase;
  late List<List<Jogador>> base;
  setUp(() {
    useCase = VerificaSeGanhouUseCase();
    base = List.generate(
        3, (index) => [Jogador.vazio, Jogador.vazio, Jogador.vazio]);
  });
  group('verifica se ganhou use case - ganhou', () {
    group('horizontal -', () {
      test('Linha 0', () async {
        base[0][0] = Jogador.x;
        base[0][1] = Jogador.x;
        base[0][2] = Jogador.x;

        final result = useCase(base: base, jogador: Jogador.x);

        expect(
          result,
          JogadorGanhador(
              jogador: Jogador.x,
              posicao1: ResultadoDuplo(0, 0),
              posicao2: ResultadoDuplo(0, 1),
              posicao3: ResultadoDuplo(0, 2)),
        );
      });

      test('Linha 1', () async {
        base[1][0] = Jogador.x;
        base[1][1] = Jogador.x;
        base[1][2] = Jogador.x;

        final result = useCase(base: base, jogador: Jogador.x);

        expect(
          result,
          JogadorGanhador(
              jogador: Jogador.x,
              posicao1: ResultadoDuplo(1, 0),
              posicao2: ResultadoDuplo(1, 1),
              posicao3: ResultadoDuplo(1, 2)),
        );
      });

      test('Linha 2', () async {
        base[2][0] = Jogador.x;
        base[2][1] = Jogador.x;
        base[2][2] = Jogador.x;

        final result = useCase(base: base, jogador: Jogador.x);

        expect(
          result,
          JogadorGanhador(
              jogador: Jogador.x,
              posicao1: ResultadoDuplo(2, 0),
              posicao2: ResultadoDuplo(2, 1),
              posicao3: ResultadoDuplo(2, 2)),
        );
      });
    });

    group('vertical -', () {
      test('coluna 0', () async {
        base[0][0] = Jogador.x;
        base[1][0] = Jogador.x;
        base[2][0] = Jogador.x;

        final result = useCase(base: base, jogador: Jogador.x);

        expect(
          result,
          JogadorGanhador(
              jogador: Jogador.x,
              posicao1: ResultadoDuplo(0, 0),
              posicao2: ResultadoDuplo(1, 0),
              posicao3: ResultadoDuplo(2, 0)),
        );
      });

      test('coluna 1', () async {
        base[0][1] = Jogador.x;
        base[1][1] = Jogador.x;
        base[2][1] = Jogador.x;

        final result = useCase(base: base, jogador: Jogador.x);

        expect(
          result,
          JogadorGanhador(
              jogador: Jogador.x,
              posicao1: ResultadoDuplo(0, 1),
              posicao2: ResultadoDuplo(1, 1),
              posicao3: ResultadoDuplo(2, 1)),
        );
      });

      test('coluna 2', () async {
        base[0][2] = Jogador.x;
        base[1][2] = Jogador.x;
        base[2][2] = Jogador.x;

        final result = useCase(base: base, jogador: Jogador.x);

        expect(
          result,
          JogadorGanhador(
              jogador: Jogador.x,
              posicao1: ResultadoDuplo(0, 2),
              posicao2: ResultadoDuplo(1, 2),
              posicao3: ResultadoDuplo(2, 2)),
        );
      });
    });
    group('diagonal', () {
      test('principal', () async {
        base[0][0] = Jogador.x;
        base[1][1] = Jogador.x;
        base[2][2] = Jogador.x;

        final result = useCase(base: base, jogador: Jogador.x);

        expect(
          result,
          JogadorGanhador(
              jogador: Jogador.x,
              posicao1: ResultadoDuplo(0, 0),
              posicao2: ResultadoDuplo(1, 1),
              posicao3: ResultadoDuplo(2, 2)),
        );
      });

      test('secundaria', () async {
        base[2][0] = Jogador.x;
        base[1][1] = Jogador.x;
        base[0][2] = Jogador.x;

        final result = useCase(base: base, jogador: Jogador.x);

        expect(
          result,
          JogadorGanhador(
              jogador: Jogador.x,
              posicao1: ResultadoDuplo(2, 0),
              posicao2: ResultadoDuplo(1, 1),
              posicao3: ResultadoDuplo(0, 2)),
        );
      });
    });
  });

  test('verifica se ganhou use case - deu velha', () async {
    final result = useCase(base: [
      [Jogador.o, Jogador.x, Jogador.o],
      [Jogador.x, Jogador.o, Jogador.x],
      [Jogador.o, Jogador.x, Jogador.o],
    ], jogador: Jogador.x);

    expect(result, null);
  });

  test('verifica se ganhou use case - base vazia', () async {
    final result = useCase(base: base, jogador: Jogador.x);
    expect(result, null);
    final result2 = useCase(base: base, jogador: Jogador.o);
    expect(result2, null);
  });
}
