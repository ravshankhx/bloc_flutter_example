import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => ColorBLoc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBLoc _bloc = BlocProvider.of<ColorBLoc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc with flutter_bloc"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBLoc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            height: 100,
            width: 100,
            color: currentColor,
            duration: Duration(
              seconds: 1,
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_red);
            },
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_green);
            },
            backgroundColor: Colors.green,
          )
        ],
      ),
    );
  }
}
