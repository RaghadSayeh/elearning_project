import 'package:flutter/material.dart';
import 'NotificationPage.dart';
import 'WelcomePage.dart';
import 'MainHomePage.dart';
import 'DoctorNotifications.dart';
import 'HomePageDoctor.dart';

class DoctorChatPage extends StatefulWidget {
  _DoctorChatPageState createState() => _DoctorChatPageState();
}

class _DoctorChatPageState extends State<DoctorChatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "Chat Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
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
                      ? null
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
