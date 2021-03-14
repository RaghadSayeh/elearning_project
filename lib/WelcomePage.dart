import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bezierContainer.dart';
import 'bezierContainer1.dart';
import 'LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'MainHomePage.dart';
import 'HomePageTeacher.dart';
import 'UserDta.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController useridContr = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("welcome page");
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "OK",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Wrong information!!",
        // textAlign: TextAlign.justify,
        // textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("Kindly verify the information that you entered."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future getData(String username, String password) async {
    var url = 'https://crenelate-intervals.000webhostapp.com/login.php';
    print("the data is");

    print(username);
    print(password);

    var response = await http.post(url, body: {
      "userid": username,
      "password": password,
      // "logintype": logintype,
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);
    if (res == 'Try Again') {
      print("login failed");
      showAlertDialog(context);
    } else {
      print("from static dta");
      print(res[0]['username']);
      print(res[0]['logintype']);
      UserDta.username = res[0]['username'];
      UserDta.logintype = res[0]['logintype'];

      if (UserDta.logintype == 'Student') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new MainHomePage()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new HomePageTeacher()));
      }
    }
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        getData(useridContr.text.trim(), passController.text.trim());
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
        //   width: MediaQuery.of(context).size.width * 0.7,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Theme.of(context).primaryColor,
                  offset: Offset(2, 4),
                  blurRadius: 6,
                  spreadRadius: 1)
            ],
            color: Theme.of(context).primaryColor),
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _submitButton1() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
        //  width: MediaQuery.of(context).size.width * 0.7,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Theme.of(context).primaryColor,
                  offset: Offset(2, 4),
                  blurRadius: 6,
                  spreadRadius: 1)
            ],
            color: Colors.white),
        child: Text(
          'Register',
          style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'l',
          style: GoogleFonts.pacifico(
            fontSize: 100,
            color: Theme.of(context).primaryColor,
            shadows: [
              Shadow(
                blurRadius: 150.0,
                color: Theme.of(context).primaryColor,
                // offset: Offset(5.0, 5.0),
              ),
            ],
          ),
          children: [
            TextSpan(
              text: 'ea',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'rno',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 30),
            ),
          ]),
    );
  }

  void rememberMe() async {}

  int state = 1;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                _title(),
                Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(13, 5, 15, 5),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: new Text(
                      "Welcome again!!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Theme.of(context).primaryColor),
                    )),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: new Text(
                    "Your user_id",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  //     width: MediaQuery.of(context).size.width * 0.7,
                  child: new TextFormField(
                    controller: useridContr,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue[300]),
                        // hintText: hint,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Padding(
                          child: IconTheme(
                            data: IconThemeData(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(Icons.person),
                          ),
                          padding: EdgeInsets.only(left: 10, right: 30),
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: new Text(
                    "Your password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  //  width: MediaQuery.of(context).size.width * 0.7,
                  child: new TextFormField(
                    obscureText: true,
                    controller: passController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue[300]),
                        // hintText: hint,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Padding(
                          child: IconTheme(
                            data: IconThemeData(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(Icons.lock),
                          ),
                          padding: EdgeInsets.only(left: 10, right: 30),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Row(
                    children: [
                      Checkbox(
                          value: remember,
                          onChanged: (value) {
                            setState(() {
                              remember = !remember;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      new Text(
                        "Remember me",
                        style: new TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                _submitButton(),
                _submitButton1(),
              ],
            ),
          ),
        ));
  }
}
