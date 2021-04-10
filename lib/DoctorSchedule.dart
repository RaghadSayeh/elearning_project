import 'package:flutter/material.dart';
import 'doctorScheduleBody.dart';
import 'HomePageDoctor.dart';
import 'DoctorChatPage.dart';
import 'WelcomePage.dart';
import 'DoctorNotifications.dart';

class DoctorSchedule extends StatefulWidget {
  _DoctorScheduleState createState() => _DoctorScheduleState();
}

class _DoctorScheduleState extends State<DoctorSchedule> {
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
  List<String> days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'];
  List<String> dates = [
    '2-5-2021',
    '3-5-2021',
    '4-5-2021',
    '5-5-2021',
    '6-5-2021'
  ];
  List<String> coursetime = [
    '8 - 9',
    '9.30 - 11',
    '1 - 2',
    '1.30 - 3',
    '10 - 11'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Text(
                "My schedule",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          )),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: new Container(
              color: Colors.white,
              child: new CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                slivers: <Widget>[
                  new SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    sliver: new SliverList(
                      delegate: new SliverChildBuilderDelegate(
                        (context, index) => new DoctorScheduleBody(
                            courses[index],
                            coursetime[index],
                            dates[index],
                            days[index]),
                        childCount: courses.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
