import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final IconData icon;

  final TextFormField textField;
  InputWidget(this.icon, this.textField);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            widget.icon,
            color: Color.fromARGB(255, 68, 180, 109),
          ),
          SizedBox(width: 15),
          Flexible(child: widget.textField)
        ],
      ),
    );
  }
}
