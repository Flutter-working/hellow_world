import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './button.dart';

void main(){

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  int age;
  var selectedDate;

  void showDate(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime(1900) ,
        lastDate: DateTime.now()).then(( date){
          setState(() {
            selectedDate =date.year;
            calculateAge();
          });

    });
  }

  void calculateAge(){
      age= 2019 - selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlineButton(onPressed: showDate,
            child: Text("button"),
            borderSide: BorderSide(color: Colors.amberAccent),),
          SizedBox(height: 10,),
          Text("your age is $age"),
        ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
