import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../GoogleService/SignInScreen.dart';
import '../Home/HomePage.dart';
import '../utils/Authentication.dart';

class ProfileScreen extends StatelessWidget {
  @override
Widget build(BuildContext context) {
  // TODO: implement build
  User? user = FirebaseAuth.instance.currentUser;
  String username = user!.displayName.toString();
  String profilePic = user.photoURL.toString();
  String email = user.email.toString();

  return Scaffold(
    backgroundColor: Color(0xFF262D40),
    body: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Color(0xFF262D40),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 50, 0, 0),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.grey,
                                          backgroundImage:
                                          NetworkImage(user.photoURL!),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                username,
                                style: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                email,
                                style: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFFFE951C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                      child: Text(
                        'Account ',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF898C91),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Column(

                  mainAxisSize: MainAxisSize.max,
                  children: [

                    ListTile(
                      onTap: (() {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => HomePage(user: user)),
                        );
                      }),
                      leading: const Icon(
                        Icons.home,
                        color: Color(0xFFD0D4D8),
                        size: 25,
                      ),
                      title: const Text(
                        'Home Management',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color(0xFFD0D4D8),
                        ),
                      ),
                      tileColor: Color(0xFF262D34),
                      dense: false,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                indent: 15,
                endIndent: 15,
                color: Colors.white,
              ),
              Column(

                mainAxisSize: MainAxisSize.max,
                children: const [
                  ListTile(
                    leading: Icon(
                      Icons.record_voice_over_sharp,
                      color: Color(0xFFD0D4D8),
                      size: 30,
                    ),
                    title: Text(
                      'Link with Alexa',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color(0xFFD0D4D8),
                      ),
                    ),
                    tileColor: Color(0xFF262D34),
                    dense: false,
                  ),
                ],
              ),
              const Divider(
                height: 0,
                indent: 15,
                endIndent: 15,
                color: Colors.white,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.keyboard_voice,
                      color: Color(0xFFD0D4D8),
                      size: 30,
                    ),
                    title: Text(
                      'Link with Google Assistant',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color(0xFFD0D4D8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    tileColor: Color(0xFF262D34),
                    dense: false,
                  ),
                  const Divider(
                    height: 0,
                    indent: 15,
                    endIndent: 15,
                    color: Colors.white,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await Authentication.signOut(context: context);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                                    (route) => false);
                          },
                          child: Text('Logout'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
        //   child: Image.asset(
        //     'images/',
        //     width: 120,
        //     height: 60,
        //     fit: BoxFit.scaleDown,
        //   ),
        // ),
        const Text(
          'Version v1.0.1',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF898C91),
          ),
        ),
      ],
    ),
  );
}

}
