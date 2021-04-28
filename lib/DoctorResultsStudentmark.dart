import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'DoctorChatPage.dart';
import 'DoctorNotifications.dart';
import 'WelcomePage.dart';
import 'HomePageDoctor.dart';

class DoctorResultsStudentmark extends StatefulWidget {
  DoctorResultsStudentmarkState createState() =>
      DoctorResultsStudentmarkState();
}

class DoctorResultsStudentmarkState extends State<DoctorResultsStudentmark> {
  @override
  void initState() {
    super.initState();
  }

  List<String> courses = [
    'Communications',
    'Network Lab',
    'Communications Lab',
    'C++',
    'Java'
  ];

  List<String> students = [
    'Amani Ali',
    'Raghad Abd',
    'Sara Ahmad',
    'Kareem Mahdi',
    'Kareem Fahmi',
    'Fares Akram',
    'Ansam Fathi',
    'Aya Saeed',
    'Reem Saleh',
    'Hadeel Ashraf',
    'Leena Khaled',
    'Noor Nadi',
    'Cerine Hadi',
    'Omar Rami',
    'Loai Mohammad'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                "Doctor results",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          )),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Search for student and assign its marks",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.search),
                    onPressed: () {},
                  ),
                  //  SvgPicture.asset("assets/icons/search.svg"),
                  SizedBox(width: 16),
                  Text(
                    "Search for student",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
                child: new ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return new ExpansionTile(
                          trailing: Icon(
                            Icons.arrow_drop_down,
                            size: 32,
                            color: Colors.indigo[800],
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "First",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "Enter first mark",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Second",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Enter second mark",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Final",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Enter final mark",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ])
                          ],
                          onExpansionChanged: (value) {},
                          title: Container(
                            margin: EdgeInsets.all(6.0),
                            padding: EdgeInsets.all(16.0),

                            //  color: Colors.red,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: new BorderRadius.circular(15.0),
                                border: Border.all(color: Colors.indigo[800])),
                            child: Text(
                              students[Index],
                              style: TextStyle(fontSize: 18),
                            ),
                          ));
                    })),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
