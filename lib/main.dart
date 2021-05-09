import 'package:fahrtenbuch/pages/addFahrt.dart';
import 'package:fahrtenbuch/widgets/fahrtWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fahrtenbuch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fahrtenbuch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color.fromARGB(255, 68, 180, 109),
            child: Text('Fahrten',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => FahrtWidget(),
              separatorBuilder: (context, index) => Container(
                    color: Colors.grey,
                    height: 1.5,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                  ),
              itemCount: 10),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 68, 180, 109),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddFahrt()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
