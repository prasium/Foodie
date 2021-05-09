import 'package:flutter/material.dart';

//call MyApp()
void main()=> runApp(MyApp());

// Stateless Widget Home Page rn
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foodie'),
      ),
      body:
          Center(
            child: Text('this is the home page'),
          )

    );
  }
}

