import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ListofData extends StatefulWidget {
  const ListofData({Key? key}) : super(key: key);

  @override
  State<ListofData> createState() => _ListofDataState();
}

class _ListofDataState extends State<ListofData> {
  final database = FirebaseDatabase.instance.ref().child('House').orderByChild('Room2');
  List<Data> list = [];

  @override
  void initState()  {
    super.initState();
    asyncmethod();
  }
  asyncmethod() async{
    DatabaseReference homeDetailRef =
    FirebaseDatabase.instance.ref().child("Room");
    DatabaseEvent event = await homeDetailRef.once();
    Map data = event.snapshot.value as Map;
    for (final key in data.keys) {

      String room = event.snapshot.child(key).child("room").value.toString();
      String status = event.snapshot.child(key).child("status").value.toString();
      String switchname = event.snapshot.child(key).child("switchname").value.toString();



      setState(() {
        Data dta = new Data(
          room: room,
          status: status,
          switchname: switchname,
          key: key.toString(),
        );
        list.add(dta);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget UI(String room, String switchname, String status, String key) {
      return GestureDetector(

        onLongPress: () {},
        onTap: () {},
        child: Card(
          color: Color(0xFF595956) ,
          borderOnForeground: true,
          child: Column(
            textDirection: TextDirection.ltr,
            children: <Widget>[Icon(Icons.home),
              Text('Room Name :'+room,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                    , fontStyle: FontStyle.normal
                ),),
              Text('Switch Name :'+ switchname,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                    , fontStyle: FontStyle.normal
                ),),
              Text('Status :'+status,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                    , fontStyle: FontStyle.normal
                ),)
            ],
          ),
          shadowColor:  Color(56565759),
        ),
      );
    }
    return Scaffold(
      backgroundColor:Color(0xFF262D40),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List',
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
        backgroundColor: Color(0xFF262D40),
      ),
      body: Container(
        child: list.length == 0 ? Text('Data is Null') : new ListView.builder(
            itemCount: list.length
            , itemBuilder: (_, index) {
          return UI(
              list[index].room, list[index].switchname, list[index].status,
              list[index].key);
        }
        ),
      ),
    );
  }
}


class Data {
  String room, switchname, status,key;

  Data({required this.room, required this.switchname, required this.status, required this.key});
}