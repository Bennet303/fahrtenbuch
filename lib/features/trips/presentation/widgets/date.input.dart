import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  final TextEditingController controller;

  const DateInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: DateTimePicker(
        type: DateTimePickerType.dateTimeSeparate,
        icon: Icon(
          Icons.event,
          color: Colors.green,
        ),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        // initialDate: DateTime.now(),
        // initialTime: TimeOfDay.now(),
        dateLabelText: 'Datum',
        timeLabelText: "Uhrzeit",
        controller: controller,
      ),
    );
  }
}
