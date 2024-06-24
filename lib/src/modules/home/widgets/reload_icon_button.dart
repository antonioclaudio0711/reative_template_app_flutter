import 'package:flutter/material.dart';

class ReloadIconButton extends StatelessWidget {
  const ReloadIconButton({
    super.key,
    required this.onTapReloadFunction,
  });

  final void Function() onTapReloadFunction;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTapReloadFunction,
      icon: const Icon(Icons.restart_alt),
    );
  }
}
