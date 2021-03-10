import 'package:flutter/material.dart';
import 'NotificationPage.dart';
import 'SettingsPage.dart';
import 'WelcomePage.dart';

class HomePageStudent extends StatefulWidget {
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
  List<String> doctorNames = [
    'Ashraf Armoush',
    'Alaa ElDin',
    'Samer Arandi',
    'Hanal AbuZant'
  ];
  List<String> emails = [
    'ashraf21@gmail.com',
    'alaa66@hotmail.com',
    'samer44@yahoo.com',
    'hanal77@gmail.com'
  ];
  List<String> phoneNos = [
    '0592123123',
    '0598567567',
    '0599890890',
    '0597323121'
  ];
  List<String> meetindsDate = [
    '20/3/2021',
    '23/3/2021',
    '28/3/2021',
    '30/3/2021'
  ];

  Widget _buildList() {
    var widthsize = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // image: DecorationImage(
                        //   image: NetworkImage(
                        //     "",
                        //   ),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: Text(
                                      "Doctor name: ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      //flex: 2,
                                      child: new Text(
                                    doctorNames[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child: Text(
                                        "Email: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      child: new Text(
                                    emails[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child: Text(
                                        "Contact no: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      child: new Text(
                                    phoneNos[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child: Text(
                                        "Meeting date: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      child: new Text(
                                    meetindsDate[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: const EdgeInsets.all(0),
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 10, bottom: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            print(
                                                "Join meeting feature will be implemented later");
                                          },
                                          child: new Text(
                                            "Join the meeting",
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  )),
              margin: EdgeInsets.only(top: 8, left: 10, right: 10),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              width: widthsize,
              height: 1.0,
              margin: EdgeInsets.only(left: 0.0),
            ),
          ])
              // : Visibility(
              //     visible: true,
              //     child: Container(),
              //   );
              ;
        });
    // : Center(
    //     child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Icon(Icons.camera, color: Colors.grey, size: 50),
    //       Text(
    //         "No Cameras to Show",
    //         style: TextStyle(fontSize: 35, color: Colors.grey),
    //       ),
    //     ],
    //   )
    //);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Colors.blue[300]
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        title: new Text(
          "Home Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildList(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[300],
        currentIndex: 0,
        onTap: (value) async {
          value == 1
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new NotificationPage()))
              : value == 2
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new SettingsPage()))
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
              icon: Icon(Icons.settings), title: Text('Settings')),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout), title: Text('Logout'))
        ],
      ),
    );
  }
}
