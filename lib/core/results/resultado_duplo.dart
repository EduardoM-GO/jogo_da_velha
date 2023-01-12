// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultadoDuplo<T1, T2> {
  final T1 valor1;
  final T2 valor2;
  ResultadoDuplo(
    this.valor1,
    this.valor2,
  );

  @override
  bool operator ==(covariant ResultadoDuplo<T1, T2> other) {
    if (identical(this, other)) return true;

    return other.valor1 == valor1 && other.valor2 == valor2;
  }

  @override
  int get hashCode => valor1.hashCode ^ valor2.hashCode;

  @override
  String toString() => 'ResultadoDuplo(valor1: $valor1, valor2: $valor2)';
}
