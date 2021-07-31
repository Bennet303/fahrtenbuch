import 'package:fahrtenbuch/widgets/inputWidget.dart';
import 'package:flutter/material.dart';

class TripInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? postfix; // e.g. "km"

  const TripInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.controller,
    required this.validator,
    this.postfix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 15,
            child: InputWidget(
              this.icon,
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: this.hint),
                validator: validator,
                controller: controller,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 2,
            child: Text(
              this.postfix ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
