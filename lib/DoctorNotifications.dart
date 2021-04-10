import 'package:elearning_project/ChatPage.dart';
import 'package:elearning_project/MainHomePage.dart';
import 'package:flutter/material.dart';
import 'WelcomePage.dart';
import 'DoctorChatPage.dart';
import 'HomePageDoctor.dart';

class DoctorNotificationPage extends StatefulWidget {
  DoctorNotificationPageState createState() => DoctorNotificationPageState();
}

class DoctorNotificationPageState extends State<DoctorNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "Notification Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: new Text(
        "Not implemented yet",
        style: TextStyle(color: Colors.black),
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[300],
        currentIndex: 1,
        onTap: (value) async {
          value == 0
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePageDoctor()))
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
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Text('Chat')),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout), title: Text('Logout'))
        ],
      ),
    );
  }
}
