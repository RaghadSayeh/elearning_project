import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'WelcomePage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //   .then((_) {
  runApp(new MyApp());
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          hintColor: Colors.cyan[200],
          primaryColor: Colors.cyan[300],
          canvasColor: Colors.transparent),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => new WelcomePage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[300],
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 180,
              child: Image.asset(
                "assets/3.png",
                //  fit: Box,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              child: new Text("Learno",
                  style: GoogleFonts.pacifico(
                    fontSize: 50,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 150.0,
                        color: Colors.white,
                        // offset: Offset(5.0, 5.0),
                      ),
                    ],
                  )
                  // TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 40,

                  //   //fontStyle: FontStyle.italic
                  // ),
                  ),
            )
          ],
        )),
      ),
    );
  }
}
