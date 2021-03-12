import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'DoctorList.dart';
import 'DoctorData.dart';

class Doctors extends StatefulWidget {
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  void initState() {
    super.initState();
    getData();
  }

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
                                            print(
                                                "Join meeting feature will be implemented later");
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
                                            print(
                                                "Join meeting feature will be implemented later");
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
                                            print(
                                                "Join meeting feature will be implemented later");
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
