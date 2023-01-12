import 'package:flutter/material.dart';

//enum DialogLoading { close }

class DialogsWidget {
  DialogsWidget._();

  ///Diálogo de alerta interrompem os usuários com informações.
  static Future<void> alert({
    required BuildContext context,
    String? title,
    required String message,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: SingleChildScrollView(
          child: Text(
            message,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
