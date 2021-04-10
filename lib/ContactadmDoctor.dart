import 'package:flutter/material.dart';
import 'background.dart';
import 'rounded_button.dart';
import 'rounded_input_field.dart';
import 'rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'DoctorChatPage.dart';
import 'DoctorNotifications.dart';
import 'WelcomePage.dart';
import 'HomePageDoctor.dart';

class ContactAdminDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Contact admin",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.indigo[800]),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                hintText: "Related to",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "Send",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          //  ClipRRect(
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(30.0),
          //     topRight: Radius.circular(30.0),
          //   ),
          //   child:
          BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (value) async {
          value == 0
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePageDoctor()))
              : value == 1
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new DoctorNotificationPage()))
                  : value == 2
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new DoctorChatPage()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new WelcomePage()));
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.notifications),
            title: new Text('Notifications'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chat')),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout), title: Text('Logout'))
        ],
      ),
    );
  }
}
