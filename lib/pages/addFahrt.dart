import 'package:date_time_picker/date_time_picker.dart';
import 'package:fahrtenbuch/painters/drawHorizontalLine.dart';
import 'package:fahrtenbuch/widgets/inputWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddFahrt extends StatefulWidget {
  @override
  _AddFahrtState createState() => _AddFahrtState();
}

class _AddFahrtState extends State<AddFahrt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Fahrt hinzufügen", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SlidingUpPanel(
        minHeight: 40,
        maxHeight: 300,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        panel: InputPanel(),
        body: FahrtDialog(),
      ),
    );
  }
}

class InputPanel extends StatelessWidget {
  const InputPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DraggableIndicator(),
        buildPanelBody(),
      ],
    );
  }

  Widget buildPanelBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Text(
            "Fahrtdetails aus Foto generieren",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenerationOption(Icons.camera_alt, "Aufnehmen", () => {}),
                GenerationOption(Icons.photo_library, "Auswählen", () => {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GenerationOption extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onClick;
  GenerationOption(this.iconData, this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class DraggableIndicator extends StatelessWidget {
  const DraggableIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Center(
        child: CustomPaint(
          painter: DrawHorizontalLine(
            context,
            strokeWidth: 4,
            strokeCap: StrokeCap.round,
            color: Colors.grey[700],
            length: 80,
          ),
        ),
      ),
    );
  }
}

class FahrtDialog extends StatelessWidget {
  const FahrtDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DateInput(),
          FahrkilometerInput(),
          KilometerstandInput(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Bestätigen",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Abbrechen",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: DateTimePicker(
        type: DateTimePickerType.dateTimeSeparate,
        icon: Icon(Icons.event),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now(),
        initialTime: TimeOfDay.now(),
        dateLabelText: 'Datum',
        timeLabelText: "Uhrzeit",
      ),
    );
  }
}

class FahrkilometerInput extends StatelessWidget {
  const FahrkilometerInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 15,
          child: Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.5,
            ),
            height: 50,
            child: InputWidget(
              Icons.location_on,
              TextField(
                decoration: InputDecoration(hintText: "Fahrtkilometer"),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 2,
          child: Text(
            "km",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class KilometerstandInput extends StatelessWidget {
  const KilometerstandInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 15,
          child: InputWidget(
            Icons.directions_car,
            TextField(
              decoration: InputDecoration(hintText: "Kilometerstand"),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 2,
          child: Text(
            "km",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
