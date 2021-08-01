import 'package:flutter/material.dart';

class GenerationOption extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onClick;
  GenerationOption(this.iconData, this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Column(
        children: [
          Icon(
            this.iconData,
            color: Color.fromARGB(255, 68, 180, 109),
            size: 60,
          ),
          Text(
            this.text,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
