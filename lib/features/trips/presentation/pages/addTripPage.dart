import 'package:fahrtenbuch/core/dependency.injector.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:fahrtenbuch/features/trips/presentation/bloc/bloc.dart';
import 'package:fahrtenbuch/features/trips/presentation/widgets/date.input.dart';
import 'package:fahrtenbuch/features/trips/presentation/widgets/input.panel.dart';
import 'package:fahrtenbuch/features/trips/presentation/widgets/trip.input.field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddTripPage extends StatefulWidget {
  @override
  _AddTripPageState createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Fahrt hinzufügen", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: BlocProvider<PictureBloc>(
        create: (context) => injector.get<PictureBloc>(),
        child: SlidingUpPanel(
          minHeight: 40,
          maxHeight: 300,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          panel: InputPanel(),
          body: FahrtDialog(),
        ),
      ),
    );
  }
}

class FahrtDialog extends StatefulWidget {
  FahrtDialog({
    Key? key,
  }) : super(key: key);

  @override
  _FahrtDialogState createState() => _FahrtDialogState();
}

class _FahrtDialogState extends State<FahrtDialog> {
  final TextEditingController kmAbsoluteController = TextEditingController();

  final TextEditingController kmTripController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  TextEditingController dateController =
      TextEditingController(text: DateTime.now().toString());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PictureBloc, PictureState>(
      listener: (context, state) {
        if (state is TripFromPictureLoaded) {
          if (state.trip.kmAbsolute != null)
            kmAbsoluteController.text = NumberFormat.decimalPattern('de_DE')
                .format(state.trip.kmAbsolute);

          if (state.trip.kmTrip != null)
            kmTripController.text =
                NumberFormat.decimalPattern('de_DE').format(state.trip.kmTrip);

          if (state.trip.dateAndTime != null) {
            setState(() {
              this.dateController = TextEditingController(
                  text: state.trip.dateAndTime.toString());
            });
            //TODO: clean up
            // String newDateString = state.trip.dateAndTime.toString();
            // dateController.text = newDateString;
          }
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            vertical: 40, horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DateInput(
                controller: dateController,
              ),
              TripInputField(
                icon: Icons.location_on,
                hint: "Fahrtkilometer",
                postfix: 'km',
                controller: kmTripController,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return "Bitte einen Wert eintragen";
                  return null;
                },
              ),
              TripInputField(
                icon: Icons.directions_car,
                hint: "Kilometerstand",
                postfix: 'km',
                controller: kmAbsoluteController,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return "Bitte einen Wert eintragen";
                  return null;
                },
              ),
              TripInputField(
                icon: Icons.location_city,
                hint: "Ort",
                controller: locationController,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return "Bitte einen Wert eintragen";
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        submit(context);
                      },
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Trip trip = Trip(
        kmAbsolute: NumberFormat.decimalPattern('de_DE')
            .parse(kmAbsoluteController.value.text.trim())
            .toInt(),
        kmTrip: NumberFormat.decimalPattern('de_DE')
            .parse(kmTripController.value.text.trim())
            .toDouble(),
        dateAndTime: DateTime.tryParse(dateController.value.text),
        location: locationController.value.text.trim(),
      );
      BlocProvider.of<TripsBloc>(context).add(AddTrip(trip));
      Navigator.of(context).pop();
    }
  }
}
