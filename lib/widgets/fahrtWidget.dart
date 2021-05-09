import 'package:flutter/cupertino.dart';

class FahrtWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "02.12.2019",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 2,
          ),
          Text("19:38"),
          Text("Fahrt: 556,3 km"),
          Text("Kilometerstand: 10035,5 km")
        ],
      ),
    );
  }
}
