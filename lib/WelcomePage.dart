import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bezierContainer.dart';
import 'bezierContainer1.dart';
import 'LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    print("welcome page");
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.white.withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'دخول',
          style: TextStyle(
              fontSize: 25,
              color: Colors.blue[300],
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 90, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'l',
          style: GoogleFonts.pacifico(
            fontSize: 100,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 150.0,
                color: Colors.white,
                // offset: Offset(5.0, 5.0),
              ),
            ],
          ),
          // TextStyle(
          //   //    textStyle: Theme.of(context).textTheme.display1,
          //   fontSize: 30,
          //   fontWeight: FontWeight.w700,
          //   color: Colors.white,
          // ),
          children: [
            TextSpan(
              text: 'ea',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'rno',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  int state = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          color: Colors.blue[300],
          height: height,
          child: Stack(children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Container(
              // color: Colors.blue[300],
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(height: 70),
                    _submitButton(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              //  left: 0,
              //  right: 100,
              child: ClipPath(
                clipper: MyWaveClipper(), //applying our custom clipper
                child: Container(
                  color: Colors.white,
                  width: 800,
                  height: 200,
                ),
                //),
              ),
            ),

            //     new BezierContainer1(state)),
          ])),
    );
  }
}
