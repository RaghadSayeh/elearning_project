import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController typeCont = TextEditingController();
  TextEditingController cityCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController otherCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("the dateTime is");
    print(DateTime.now());
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                  child: Image.asset(
                    'assets/33.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor
                  ])),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: cityCont,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white)),
                        //  hintText:
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phoneCont,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white)),
                        //  hintText:
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: otherCont,
                        decoration: InputDecoration(
                            hintText: 'Other detail',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white)),
                        //  hintText:
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Align(
                      child: Text(
                        'Update',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    );
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
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: profileView());
  }
}
