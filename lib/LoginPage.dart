import 'package:elearning_project/HomePageStudent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'HomePageTeacher.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String logintype;

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obsecure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue[300]),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.blue[300],
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.blue[300],
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(
                  color: Colors.blue[300],
                ),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 10, right: 30),
            )),
      ),
    );
  }

  //button widget
  Widget _button(String text, Color splashColor, Color highlightColor,
      Color fillColor, Color textColor, void function()) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: () {
        function();
      },
    );
  }

  Future getData(String username, String password, String logintype) async {
    var url = 'https://crenelate-intervals.000webhostapp.com/login.php';
    print("the data is");

    print(username);
    print(password);
    print(logintype);

    var response = await http.post(url, body: {
      "userid": username,
      "password": password,
      "logintype": logintype,
    });

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);
    if (res == 'Login Successfully') {
      print("from static dta");
      if (logintype == 'Student') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new HomePageStudent()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new HomePageTeacher()));
      }
    } else {
      print("must go to Home page");
      showAlertDialog(context);
    }
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

  showAlertDialog1(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
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
        "Missing information!!",
        //  textAlign: TextAlign.justify,
        //textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("Kindly check that you fill all the required information."),
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

  void _loginUser() {
//    _usernameController.clear();
    //  _passwordController.clear();

    if (_usernameController.text == '' ||
        _passwordController.text == '' ||
        logintype == '') {
      showAlertDialog1(context);
    } else {
      getData(_usernameController.text.trim(), _passwordController.text.trim(),
          logintype);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Colors.blue[300];
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue[300],
        title: new Text(
          "Login page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: new DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue[300],
        ),
        child: ClipRRect(
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          child: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                child: new Text("Learno",
                                    style: GoogleFonts.pacifico(
                                      fontSize: 50,
                                      color: Colors.blue[300],
                                      shadows: [
                                        Shadow(
                                          blurRadius: 150.0,
                                          color: Colors.blue[300],
                                          // offset: Offset(5.0, 5.0),
                                        ),
                                      ],
                                    )),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15, top: 40),
                        child: _input(Icon(Icons.person), "UserId",
                            _usernameController, false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: _input(Icon(Icons.lock), "Password",
                            _passwordController, true),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: Container(
                          // padding: EdgeInsets.only(
                          //   left: 60,
                          // ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2.0,
                                style: BorderStyle.solid,
                                color: Colors.blue[300],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              value: logintype,
                              dropdownColor: Colors.white,
                              //         isExpanded: true,
                              items: <String>['Student', 'Teacher']
                                  .map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.blue[300],
                                        fontSize: 20.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (valueType) {
                                setState(() {
                                  logintype = valueType;
                                });
                                print("drop down list changed");
                                print(valueType);
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          child: _button("Login", Colors.white, primary,
                              primary, Colors.white, _loginUser),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
