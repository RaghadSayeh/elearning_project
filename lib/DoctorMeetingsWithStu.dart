import 'package:flutter/material.dart';
import 'DoctorNotifications.dart';
import 'DoctorChatPage.dart';
import 'WelcomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePageDoctor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'UserDta.dart';
import 'DoctorStuMeeting.dart';

class DoctorMeetingWithStu extends StatefulWidget {
  _DoctorMeetingWithStuState createState() => _DoctorMeetingWithStuState();
}

class _DoctorMeetingWithStuState extends State<DoctorMeetingWithStu> {
  @override
  void initState() {
    super.initState();
    print("DoctorMeetingWithStu is called");
    getDoctorTable();
  }

  Future getDoctorTable() async {
    DoctorStuMeetinglist.li = new List();
    var url =
        'https://crenelate-intervals.000webhostapp.com/getDoctorStuMeetings.php';
    print("user id is:");
    print(UserDta.userid);

    var response = await http.post(url,
        body: {"doctorid": UserDta.userid}); //must pass here doctor name

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Failed to get doctor meetings') {
      print("Failed to get doctor meetings");
    } else {
      print("get doctor meetings successfully");

      List<dynamic> jsonObj = res;
      for (int i = 0; i < jsonObj.length; i++) {
        Map<String, dynamic> doclist = jsonObj[i];
        String studentname = doclist['studentname'];
        String coursename = doclist['coursename'];
        String about = doclist['about'];
        String meetingdate = doclist['meetingdate'];
        String studentid = doclist['studentid'];

        DoctorStuMeeting cd = new DoctorStuMeeting();

        cd.studentname = studentname;
        cd.coursename = coursename;
        cd.about = about;
        cd.meetingdate = meetingdate;
        cd.studentid = studentid;

        DoctorStuMeetinglist.li.add(cd);
      }
      setState(() {});
    }
  }

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
                              course.length > 17
                                  ? new Text(course.substring(0, 17),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))
                                  : new Text(course,
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
                                new Text("Meeting dt :",
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
                                  new Text("Student id : ",
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
      body: DoctorStuMeetinglist.li.length == 0
          ? Center(
              child: new Text("Waiting to load data..."),
            )
          : ListView.builder(
              itemCount: DoctorStuMeetinglist.li.length,
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
                              _registerSheet(
                                  DoctorStuMeetinglist.li[index].coursename,
                                  DoctorStuMeetinglist.li[index].studentid,
                                  DoctorStuMeetinglist.li[index].about,
                                  DoctorStuMeetinglist.li[index].meetingdate);
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                              DoctorStuMeetinglist.li[index].studentname,
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
