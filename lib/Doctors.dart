import 'package:elearning_project/MeetingDetail.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'DoctorList.dart';
import 'DoctorData.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'ScheduleMeeting.dart';
import 'MeetingData.dart';

class Doctors extends StatefulWidget {
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  //final PermissionHandler _permissionHandler = PermissionHandler();

  @override
  void initState() {
    super.initState();
    //_askPermissions();
    getData();
  }

  Future<void> _askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus != PermissionStatus.granted) {
      // _handleInvalidPermissions(permissionStatus);
      //await PermissionH
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    } else {
      // await request
      //  Map<PermissionG
    }
  }

  void makeCall(String telno) async {
//"tel:$telephoneNumber"
    String url = ("tel:" + telno).trim();
    print("the url is:");
    print(url);
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  void addToContact(Contact c) {
    try {
      ContactsService.addContact(c);
    } catch (e) {
      print("catch inside addtocontact");
      print(e.toString());
    }
  }

  void scheduleNewMeeting() {}

  //Failed to get Doctors
  Future getData() async {
    DoctorList.doclist = new List();
    var url = 'https://crenelate-intervals.000webhostapp.com/getDoctors.php';
    print("the data is");

    var response = await http.get(url);

    print("status code is");
    print(response.statusCode);
    print(json.decode(response.body));

    final res = json.decode(response.body);

    if (res == 'Failed to get Doctors') {
      print("Failed to get Doctors");
    } else {
      print("get Doctors successfully");

      List<dynamic> jsonObj = res;
      for (int i = 0; i < jsonObj.length; i++) {
        Map<String, dynamic> doclist = jsonObj[i];
        String username = doclist['username'];
        String email = doclist['email'];
        String phoneno = doclist['phoneno'];

        print(username);
        print(email);
        print(phoneno);

        DoctorData sd = new DoctorData();
        sd.email = email;
        sd.username = username;
        sd.phoneNo = phoneno;

        DoctorList.doclist.add(sd);
      }
      setState(() {});
    }
  }

  Widget _buildList() {
    var widthsize = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: DoctorList.doclist.length,
        itemBuilder: (context, index) {
          return Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: 140,
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/33.png"))),
              child: new Text(""),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 0, bottom: 0),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //  image: DecorationImage(
                        //    image: AssetImage('assets/33.png'))
                        //border:
                        //  Border.all(color: Theme.of(context).primaryColor),
                        // image: DecorationImage(
                        //   image: NetworkImage(
                        //     "",
                        //   ),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child:
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //     children: [
                            Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  // Container(
                                  //   width:
                                  //       MediaQuery.of(context).size.width * .3,
                                  //   child: Container(
                                  //     //  width: 160,
                                  //     //height: 150,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Theme.of(context).primaryColor,
                                  //       ),
                                  //       //borderRadius: BorderRadius.all(Radius.circular(50))
                                  //     ),
                                  //     margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                                  //     //  padding: EdgeInsets.all(2),
                                  //     child: Image(
                                  //       image: AssetImage('assets/33.png'),
                                  //       fit: BoxFit.fill,
                                  //     ),
                                  //   ),
                                  // ),
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
                                        "Username: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      child: new Text(
                                    DoctorList.doclist[index].username,
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
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: Text(
                                      "Email: ",
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
                                    DoctorList.doclist[index].email,
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
                                        "Contact no.: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                      child: new Text(
                                    DoctorList.doclist[index].phoneNo,
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
                                  color: Theme.of(context).primaryColor,
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
                                            print("add to contacts");
                                            // Contact con = new Contact(
                                            //     phones: [
                                            //       Item(
                                            //           label: "mobile",
                                            //           value: DoctorList
                                            //               .doclist[index]
                                            //               .phoneNo)
                                            //     ],
                                            //     givenName: DoctorList
                                            //         .doclist[index].username);
                                            // ContactsService.addContact(con);
                                          },
                                          child: Icon(Icons.person_add),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 10, bottom: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            print("call the doctor");
                                            // canLaunch(DoctorList
                                            //   .doclist[index].phoneNo);
                                            makeCall(DoctorList
                                                .doclist[index].phoneNo);
                                          },
                                          child: Icon(Icons.call),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 10, bottom: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            print("schedule new meeting");
                                            MeetingDetail.drname = DoctorList
                                                .doclist[index].username;
                                            MeetingDetail.email =
                                                DoctorList.doclist[index].email;
                                            MeetingDetail.phoneno = DoctorList
                                                .doclist[index].phoneNo;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        new ScheduleMeeting()));
                                          },
                                          child: Icon(Icons.add_box),
                                        )),
                                  ],
                                )),
                          ],
                        ),

                        //       ]
                        //         )
                      ),
                    ),
                  )),
              margin: EdgeInsets.only(top: 8, left: 10, right: 10),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                // border: Border.all(color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey,
              width: widthsize,
              height: 1.0,
              margin: EdgeInsets.only(left: 0.0),
            ),
          ]);
        });
  }

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
            "Doctors",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: DoctorList.doclist.length == 0
            ? Center(
                child: new Text(
                "Wait to load data...",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ))
            : _buildList());
  }
}
