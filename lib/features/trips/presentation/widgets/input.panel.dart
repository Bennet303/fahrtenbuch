import 'package:fahrtenbuch/features/trips/presentation/bloc/bloc.dart';
import 'package:fahrtenbuch/core/widgets/draggable.indicator.dart';
import 'package:fahrtenbuch/features/trips/presentation/widgets/generation.option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputPanel extends StatelessWidget {
  const InputPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DraggableIndicator(),
        buildPanelBody(context),
      ],
    );
  }

  Widget buildPanelBody(BuildContext context) {
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
                GenerationOption(
                  Icons.camera_alt,
                  "Aufnehmen",
                  () => {
                    BlocProvider.of<PictureBloc>(context)
                        .add(GetTripFromCamera())
                  },
                ),
                GenerationOption(
                  Icons.photo_library,
                  "Auswählen",
                  () => {
                    BlocProvider.of<PictureBloc>(context)
                        .add(GetTripFromGallery())
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
