import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TripListItem extends StatelessWidget {
  final Trip trip;

  const TripListItem(this.trip);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd.MM.yyyy').format(trip.dateAndTime!),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 2,
          ),
          Text(DateFormat('HH:mm').format(trip.dateAndTime!)),
          Text("Fahrt: ${trip.kmTrip} km"),
          Text("Kilometerstand: ${trip.kmAbsolute} km")
        ],
      ),
    );
  }
}
