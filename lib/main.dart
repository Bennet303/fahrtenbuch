import 'package:fahrtenbuch/features/trips/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/dependency.injector.dart';
import 'features/trips/data/models/trip.model.dart';
import 'features/trips/presentation/pages/homePage.dart';

void main() async {
  init();
  await Hive.initFlutter();
  Hive.registerAdapter(TripHiveModelAdapter());
  await Hive.openBox<TripHiveModel>('trips');
  runApp(Application());
}

class Application extends StatelessWidget {
  final _tripsBloc = injector.get<TripsBloc>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TripsBloc>(
      create: (context) => _tripsBloc..add(GetTrips()),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('de', 'DE'),
        ],
        title: 'Fahrtenbuch',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage(title: 'Fahrtenbuch'),
      ),
    );
  }
}
