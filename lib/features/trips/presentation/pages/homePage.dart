import 'package:fahrtenbuch/features/export/presentation/widgets/export.button.dart';
import 'package:fahrtenbuch/features/trips/presentation/bloc/bloc.dart';
import 'package:fahrtenbuch/features/trips/presentation/widgets/dismissible.trip.list.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'addTripPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key) {
    // injector.get<TripsBloc>().add(GetTrips());
  }
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildHeader(context),
          Expanded(
            child: _buildBody(),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildAddFahrtButton(context),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<TripsBloc, TripsState>(
      builder: (context, state) {
        if (state is GettingTripsCompletedState) {
          return _buildBodyLoaded(state);
        }

        if (state is GettingTripsLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        return Container();
      },
    );
  }

  Widget _buildBodyLoaded(GettingTripsCompletedState state) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final trip = state.trips[index];
        return DismissibleTripListItem(trip: trip);
      },
      separatorBuilder: (context, index) => Container(
        color: Colors.grey,
        height: 1.5,
      ),
      itemCount: state.trips.length,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color.fromARGB(255, 68, 180, 109),
      child: Text(
        'Fahrten',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(widget.title, style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      actions: [ExportButton()],
    );
  }

  FloatingActionButton _buildAddFahrtButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 68, 180, 109),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTripPage(),
          ),
        );
      },
      tooltip: 'Fahrt hinzufügen',
      child: Icon(Icons.add),
    );
  }
}
