import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:fahrtenbuch/features/trips/presentation/bloc/bloc.dart';
import 'package:fahrtenbuch/widgets/trip.list.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DismissibleTripListItem extends StatelessWidget {
  const DismissibleTripListItem({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(trip.id),
      child: TripListItem(trip),
      onDismissed: (_) {
        BlocProvider.of<TripsBloc>(context).add(DeleteTrip(trip));
      },
      background: Container(
        color: Colors.red,
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ),
          alignment: Alignment.centerRight,
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Bestätigen"),
              content: const Text("Möchtest du die Fahrt wirklich löschen?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      "LÖSCHEN",
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("ABBRECHEN"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
