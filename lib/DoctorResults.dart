import 'package:flutter/material.dart';

class DoctorResults extends StatefulWidget {
  DoctorResultsState createState() => DoctorResultsState();
}

class DoctorResultsState extends State<DoctorResults> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: new Text("Doctor results"),
      ),
    );
  }
}
