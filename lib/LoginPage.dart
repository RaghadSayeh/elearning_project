import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String logintype;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  String _email;
  String _password;
  String _displayName;
  bool _obsecure = false;

  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obsecure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        textAlign: TextAlign.right,
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
            suffixIcon: Padding(
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

  void _loginUser() {
    _email = _usernameController.text;
    _password = _passwordController.text;
    _usernameController.clear();
    _passwordController.clear();
    //HomePageSeller
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => new HomePageSeller()));
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
          "تسجيل الدخول",
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
                        child: _input(Icon(Icons.person), "اسم المستخدم",
                            _usernameController, false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: _input(Icon(Icons.lock), "كلمة المرور",
                            _passwordController, true),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 60,
                          ),
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
                              items: <String>['أستاذ جامعة', 'طالب']
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
                          child: _button("دخول", Colors.white, primary, primary,
                              Colors.white, _loginUser),
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
