import 'dart:convert';
import 'dart:io';

import 'package:fahrtenbuch/models/tripModel.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';

class InputWidget extends StatefulWidget {
  final IconData icon;

  final TextField textField;
  InputWidget(this.icon, this.textField);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              widget.icon,
              color: Color.fromARGB(255, 68, 180, 109),
            ),
          ),
          SizedBox(width: 15),
          Flexible(child: widget.textField)
        ],
      ),
    );
  }
}
