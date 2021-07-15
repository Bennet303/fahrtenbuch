import 'package:fahrtenbuch/widgets/draggable.indicator.dart';
import 'package:fahrtenbuch/widgets/generation.option.dart';
import 'package:flutter/material.dart';

class InputPanel extends StatelessWidget {
  const InputPanel({
    Key? key,
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
