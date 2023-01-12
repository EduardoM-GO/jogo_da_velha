// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jogo_velha/core/results/resultado_duplo.dart';
import 'package:jogo_velha/module/jogo/domain/entities/jogo_entity.dart';

class JogadorGanhador {
  final Jogador jogador;
  final ResultadoDuplo<int, int> posicao1;
  final ResultadoDuplo<int, int> posicao2;
  final ResultadoDuplo<int, int> posicao3;

  JogadorGanhador({
    required this.jogador,
    required this.posicao1,
    required this.posicao2,
    required this.posicao3,
  });

  JogadorGanhador.deuVelha()
      : jogador = Jogador.vazio,
        posicao1 = ResultadoDuplo(-1, -1),
        posicao2 = ResultadoDuplo(-1, -1),
        posicao3 = ResultadoDuplo(-1, -1);

  @override
  bool operator ==(covariant JogadorGanhador other) {
    if (identical(this, other)) return true;

    return other.jogador == jogador &&
        other.posicao1 == posicao1 &&
        other.posicao2 == posicao2 &&
        other.posicao3 == posicao3;
  }

  @override
  int get hashCode {
    return jogador.hashCode ^
        posicao1.hashCode ^
        posicao2.hashCode ^
        posicao3.hashCode;
  }

  @override
  String toString() {
    return 'JogadorGanhador(jogador: $jogador, posicao1: $posicao1, posicao2: $posicao2, posicao3: $posicao3)';
  }
}
