import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:hexcolor/hexcolor.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  final String imageLogoName = 'asset/icons/loading.svg';

  //var screenHeight = MediaQuery.of(context).size.height;
  //var screenWidth = MediaQuery.of(context).size.width;


  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
          () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('asset/loading.svg'), fit: BoxFit.contain),
      // ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 300.0,
            left: 75.0,
            child: Container(
              width: width,
              height: height,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: EdgeInsets.all(100.0),
                  child:  SvgPicture.asset(
                  imageLogoName,
                  width: 100,
                  height: 100,
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(


        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/images/1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
                child: Column( children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                        ),
                        ElevatedButton(
                            onPressed: () {
                            // 두 번째 화면으로 이동
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondScreen()),
                            );
                            },
                            child: Text('두 번째 화면으로 이동'),
                        ),
                ],
              ),
          )
      )
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage('asset/images/2.jpg'),
                  fit: BoxFit.cover,
                  ),
              ),
        child:  Center(
            child: Column( children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              ElevatedButton(
                onPressed: () {
                  // 두 번째 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstScreen()),
                  );
                },
                child: Text('첫 번째 화면으로 이동'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 두 번째 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                  );
                },
                child: Text('세 번째 화면으로 이동'),
              ),
            ],
            ),
      ),
    )
    );
  }
}

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage('asset/images/3.png'),
                  fit: BoxFit.cover,
                  ),
              ),
        child:  Center(
            child: Column( children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              ElevatedButton(
                onPressed: () {
                  // 두 번째 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                child: Text('이전화면'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 두 번째 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstScreen()),
                  );
                },
                child: Text('처음으로 돌아가기'),
              ),
              ElevatedButton(
                    onPressed: ()=> contactUs(context),
              child: Text('Contact Us')
              )
            ]
            ),
          ),
        )
    );
  }
}

void contactUs(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
          title: Text('Contact Us'),
          content: Text('Mail us at khm9191@gmail.com'),
          actions : <Widget>[
            TextButton(
              child : Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ]
      );
    },
  );
}