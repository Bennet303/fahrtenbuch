import 'package:fahrtenbuch/core/dependency.injector.dart';
import 'package:fahrtenbuch/features/export/presentation/bloc/export_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ExportButton extends StatelessWidget {
  late final ExportBloc _exportBloc;

  ExportButton() {
    _exportBloc = injector<ExportBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExportBloc, ExportState>(
      bloc: _exportBloc,
      listener: (context, state) {
        if (state is ExportCompleted) {
          _showInfoDialog(context, Text("Export erfolgreich"));
        }

        if (state is ExportFailed) {
          _showInfoDialog(context, Text("Export fehlgeschlagen"));
        }
      },
      child: IconButton(
        onPressed: () async {
          final month = await showMonthPicker(
            context: context,
            initialDate: DateTime.now(),
          );

          if (month != null) {
            _exportBloc.add(StartExport(month));
          }
        },
        icon: Icon(
          Icons.file_download,
          color: Colors.green,
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context, Widget content) {
    showDialog(
        context: context, builder: (context) => AlertDialog(content: content));
  }
}
