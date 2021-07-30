import 'package:fahrtenbuch/core/dependency.injector.dart';
import 'package:fahrtenbuch/features/export/data/datasources/csv.export.datasource.dart';
import 'package:fahrtenbuch/features/export/data/repositories/export.repository.impl.dart';
import 'package:fahrtenbuch/features/export/domain/usecases/export.month.usecase.dart';
import 'package:fahrtenbuch/features/export/presentation/bloc/export_bloc.dart';

import 'data/datasources/export.datasource.dart';
import 'domain/repositories/export.repository.dart';

exportFeatureInit() {
  //* Bloc
  injector.registerFactory<ExportBloc>(() => ExportBloc(injector()));

  //* Usecases
  injector.registerLazySingleton<ExportMonthUsecase>(
      () => ExportMonthUsecase(injector()));

  //* Repositories
  injector.registerLazySingleton<ExportRepository>(
      () => ExportRepositoryImpl(injector(), injector()));

  //* Data Sources
  injector.registerLazySingleton<ExportDataSource>(() => CsvExportDataSource());
}
