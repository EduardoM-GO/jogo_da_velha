// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PlacarWidget extends StatelessWidget {
  final int placarX;
  final int placarO;
  final void Function() reiniciarJogo;
  final void Function() zeraJogo;
  const PlacarWidget({
    Key? key,
    required this.placarX,
    required this.placarO,
    required this.reiniciarJogo,
    required this.zeraJogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Placar X',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              '$placarX',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: reiniciarJogo,
              child: const Text('Reiniciar jogo'),
            ),
            TextButton(
              onPressed: zeraJogo,
              child: const Text('Zerar jogo'),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Placar O',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              '$placarO',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}
