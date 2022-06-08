import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final database = FirebaseDatabase.instance.ref();
  late DatabaseReference databaseReference;

  String room = '';
  String switcname = '';
  String status = '';



  @override
  Widget build(BuildContext context) {

    getDataFromFirebase();

    return Scaffold(
      backgroundColor: Color(0xFF262D40),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("room"),
            Text("-------"),
            Text(room),
            Text("------------------"),
            Text(""),
            Text("switchaname"),
            Text("-------"),
            Text(switcname),
            Text("------------------"),
            Text(""),
            Text("status"),
            Text("-------"),
            Text(status)

          ],
        ),
      ),
    );
  }

  Future<void> getDataFromFirebase() async {
    DatabaseReference deviceRef =
    FirebaseDatabase.instance.ref().child('Room');
    DatabaseEvent userdata = await deviceRef.once();
    String room = userdata.snapshot.child("room").value.toString();
    String switchname = userdata.snapshot.child("switchname").value.toString();
    String status = userdata.snapshot.child("status").value.toString();
    try {
      setState((){
            room = room;
            switchname = switchname;
            status = status;
          });
    } catch (e) {
      print(e);
    }
  }
}