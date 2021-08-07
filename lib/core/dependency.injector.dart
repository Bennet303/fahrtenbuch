import 'package:fahrtenbuch/features/export/export.feature.init.dart';
import 'package:fahrtenbuch/features/trips/trips.feature.init.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
Future<void> init() async {
  exportFeatureInit();
  tripsFeatureInit();
}
