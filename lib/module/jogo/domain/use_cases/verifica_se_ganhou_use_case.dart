import 'package:jogo_velha/core/results/resultado_duplo.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogador_ganhador.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogo_entity.dart';

class VerificaSeGanhouUseCase {
  JogadorGanhador? call(
      {required List<List<Jogador>> base, required Jogador jogador}) {
    bool existePosicaoVazia = false;
    for (int i = 0; i < 3; i++) {
      //?Verifica se ganhou na horizontal
      if (base[i][0] == jogador &&
          base[i][0] == base[i][1] &&
          base[i][1] == base[i][2]) {
        return JogadorGanhador(
          jogador: jogador,
          posicao1: ResultadoDuplo(i, 0),
          posicao2: ResultadoDuplo(i, 1),
          posicao3: ResultadoDuplo(i, 2),
        );
      }

      //?Verifica se ganhou na vertical
      if (base[0][i] == jogador &&
          base[0][i] == base[1][i] &&
          base[1][i] == base[2][i]) {
        return JogadorGanhador(
          jogador: jogador,
          posicao1: ResultadoDuplo(0, i),
          posicao2: ResultadoDuplo(1, i),
          posicao3: ResultadoDuplo(2, i),
        );
      }
      if (base[0][i] == Jogador.vazio ||
          base[1][i] == Jogador.vazio ||
          base[2][i] == Jogador.vazio) {
        existePosicaoVazia = true;
      }
    }

    if (!existePosicaoVazia) {
      return JogadorGanhador.deuVelha();
    }

    //?Verifica se ganhou na diagonal principal
    if (base[0][0] == jogador &&
        base[0][0] == base[1][1] &&
        base[1][1] == base[2][2]) {
      return JogadorGanhador(
        jogador: jogador,
        posicao1: ResultadoDuplo(0, 0),
        posicao2: ResultadoDuplo(1, 1),
        posicao3: ResultadoDuplo(2, 2),
      );
    }

    //?Verifica se ganhou na diagonal secundaria
    if (base[2][0] == jogador &&
        base[2][0] == base[1][1] &&
        base[1][1] == base[0][2]) {
      return JogadorGanhador(
        jogador: jogador,
        posicao1: ResultadoDuplo(2, 0),
        posicao2: ResultadoDuplo(1, 1),
        posicao3: ResultadoDuplo(0, 2),
      );
    }

    return null;
  }
}
