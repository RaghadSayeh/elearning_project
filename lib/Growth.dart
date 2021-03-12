import 'package:flutter/material.dart';

class Growth extends StatefulWidget {
  _GrowthState createState() => _GrowthState();
}

class _GrowthState extends State<Growth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text(
          "Growth",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: new Text(
        "Not implemented yet",
        style: TextStyle(color: Colors.black),
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.blue[300],
      //   currentIndex: 1,
      //   onTap: (value) async {
      //     value == 0
      //         ? Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => new MainHomePage()))
      //         : value == 2
      //             ? Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => new SettingsPage()))
      //             : Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => new WelcomePage()));
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.home),
      //       title: new Text('Home'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.notifications),
      //       title: new Text('Notifications'),
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), title: Text('Settings')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.logout), title: Text('Logout'))
      //   ],
      // ),
    );
  }
}
