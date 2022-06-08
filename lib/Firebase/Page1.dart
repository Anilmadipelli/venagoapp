import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var roomController =TextEditingController();
  var switchnameController =TextEditingController();
  var statusController =new TextEditingController();


  void Data(String room,String switchname ,String status )
  {
    database.child('Room').push().set({
      'room':room,
      'switchname':switchname,
      'status':status,

    });
    roomController.clear();
    switchnameController.clear();
    statusController.clear();
  }
  final  database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF262D40),
      body:
      Container(padding:
      const EdgeInsets.all(12.0),
        child: Column(

          children: [
            const Text('Insert Data',style:TextStyle(fontSize:30),),
            SizedBox(height: 20,),
            TextFormField(
              controller: roomController,
              decoration:InputDecoration(
                  labelText:'Room',border:OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              controller: switchnameController,
              decoration:const InputDecoration(
                  labelText:'Switchname',border:OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              controller: statusController,
              decoration:const InputDecoration(
                  labelText:'status',border:OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              if(roomController.text.isNotEmpty){
                if(switchnameController.text.isNotEmpty){
                  if(statusController.text.isNotEmpty){
                    Data(roomController.text, switchnameController.text, statusController.text);
                  }else{
                    showTopSnackBar(context,
                        const CustomSnackBar.info(backgroundColor: Colors.redAccent,
                          message:
                          "status  is Empty, try to insert",

                        )
                    );

                  }
                }else{
                  showTopSnackBar(context,
                      const CustomSnackBar.info(backgroundColor: Colors.redAccent,
                        message:
                        "switchname  is Empty, try to insert",
                      )
                  );
                }
              }else{
                showTopSnackBar(context,
                    const CustomSnackBar.info(backgroundColor: Colors.redAccent,
                      message:
                      "Room  is Empty, try to insert",
                    )
                );
                // Room is empty
              }


            }, child:const Text('Submit',style: TextStyle(fontWeight:FontWeight.bold),)),

          ],
        ),
      ),
    );
  }
}