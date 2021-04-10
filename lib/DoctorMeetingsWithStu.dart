import 'package:flutter/material.dart';
import 'DoctorNotifications.dart';
import 'DoctorChatPage.dart';
import 'WelcomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePageDoctor.dart';

class DoctorMeetingWithStu extends StatefulWidget {
  _DoctorMeetingWithStuState createState() => _DoctorMeetingWithStuState();
}

class _DoctorMeetingWithStuState extends State<DoctorMeetingWithStu> {
  @override
  void initState() {
    super.initState();
  }

  List<String> students = [
    'Raghad Abd',
    'Amani Ali',
    'Noor Omar',
    'Malak Ahmad',
    'Zain Kareem'
  ];

  List<String> courses = [
    'Communications',
    'Network Lab',
    'Communications Lab',
    'C++',
    'Java'
  ];
  List<String> days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'];
  List<String> relatedto = [
    'Misunderstanding issues',
    'Exams issues',
    'Assignment details',
    'Due date for projects',
    'Quiz data'
  ];
  List<String> dates = [
    '2-5-2021',
    '3-5-2021',
    '4-5-2021',
    '5-5-2021',
    '6-5-2021'
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _registerSheet(
      String course, String day, String relatedto, String datess) {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      return DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10,
                        top: 10,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 30.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  height: 50,
                  width: 50,
                ),
                SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 40),
                          height: 140,
                          child: Container(
                            child: new Text("Learno",
                                style: GoogleFonts.pacifico(
                                  fontSize: 50,
                                  color: Colors.indigo[800],
                                  shadows: [
                                    Shadow(
                                      blurRadius: 150.0,
                                      color: Colors.white,
                                      // offset: Offset(5.0, 5.0),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 20, top: 60, left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text("Course name : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              new Text(course,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 20, top: 20, left: 30, right: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Text("Meeting date : ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                new Text(datess,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: 20, top: 20, left: 30, right: 30),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  new Text("Meeting day : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  new Text(day,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))
                                ])),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: 20, top: 20, left: 30, right: 30),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  new Text("Related to : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  new Text(relatedto,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))
                                ])),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 20, top: 20, left: 20, right: 20),
                          child: RaisedButton(
                            highlightElevation: 0.0,
                            splashColor: Colors.white,
                            highlightColor: Colors.black,
                            elevation: 0.0,
                            color: Colors.indigo[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              "Join meeting",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            onPressed: () {
                              print("join the meeting in the future");
                              // function();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //  resizeToAvoidBottomPadding: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
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
                "Meetings with my students",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          )),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(12),
              width: 200,
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.indigo[800],
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      contentPadding: EdgeInsets.all(15),
                      leading: Icon(
                        Icons.video_call,
                        size: 60,
                        color: Colors.white,
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          _registerSheet(courses[index], days[index],
                              relatedto[index], dates[index]);
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(students[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            );
          }),
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
