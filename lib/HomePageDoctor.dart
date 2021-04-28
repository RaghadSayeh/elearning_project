import 'package:elearning_project/DoctorMeetingsWithStu.dart';
import 'package:elearning_project/DoctorSchedule.dart';
import 'package:elearning_project/DoctorSlides.dart';
import 'package:flutter/material.dart';
import 'WelcomePage.dart';
import 'UserDta.dart';
import 'MeetingData.dart';
import 'MeetingList.dart';
import 'WelcomePage.dart';
import 'DoctorChatPage.dart';
import 'DoctorCoursesStud.dart';
import 'DoctorNotifications.dart';
import 'ContactadmDoctor.dart';
import 'DoctorLeavesVaca.dart';
import 'CoursesRegDoc.dart';
import 'DoctorResults.dart';
import 'DoctorProfile.dart';
import 'hotel_home_screen.dart';
import 'DoctorExams.dart';

class HomePageDoctor extends StatefulWidget {
  _HomePageDoctorState createState() => _HomePageDoctorState();
}

class _HomePageDoctorState extends State<HomePageDoctor> {
  List<String> images = [
    'schedule.png',
    'meetings.jpg',
    'registration.png',
    '24.png',
    'doctorresults.png',
    '27.jpg',
    '31.png',
    '16.jpg',
    '20.png',
    '23.jpg'
  ];

  List<String> names = [
    'Schedule',
    'Student mettings',
    'Courses registration',
    'Courses documents',
    'Student results',
    'Exams',
    'Vacations',
    'Courses',
    'Profile',
    'Contact admin'
  ];

  @override
  void initState() {
    super.initState();
    print("Main doctorhomepage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  resizeToAvoidBottomPadding: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Text(
                "Home Page",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              new Text(
                UserDta.username.toString(),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          )),
      body: Container(
          padding: EdgeInsets.only(top: 10),
          color: Colors.white,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(10, (index) {
              return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new DoctorSchedule()));
                    } else if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  new DoctorMeetingWithStu()));
                    } else if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  new DocCoursesRegistration()));
                    } else if (index == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new DoctorSlides()));
                    } else if (index == 4) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new DoctorResults()));
                    } else if (index == 5) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              //DoctorLeavesVaca
                              builder: (context) => new DoctorExams()));
                    } else if (index == 6) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              //Vacations
                              builder: (context) => new DoctorLeavesVaca()));
                    } else if (index == 7) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              //DoctorCoursesStud
                              builder: (context) => new HotelHomeScreen()));
                    } else if (index == 8) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new DoctorProfile()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new ContactAdminDoctor()));
                    }
                  },
                  child: Column(
                    children: [
                      new Container(
                          width: 160.0,
                          height: 160.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(
                                      'assets/' + images[index])))),
                      // Container(
                      //   width: 160,
                      //   height: 150,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: Theme.of(context).primaryColor,
                      //     ),
                      //     //borderRadius: BorderRadius.all(Radius.circular(50))
                      //   ),
                      //   margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                      //   //  padding: EdgeInsets.all(2),
                      //   child: Image(
                      //     image: AssetImage('assets/' + images[index]),
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      Container(
                        child: new Text(
                          names[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      )
                    ],
                  ));
            }),
          )),
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
          value == 1
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
      // )
    );
  }
}
