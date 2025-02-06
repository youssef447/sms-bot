import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool? value;
  const AppCheckbox({super.key, this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
    );
  }
}
