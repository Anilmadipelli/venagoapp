import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Firebase/Page1.dart';
import '../Firebase/Page2.dart';
import '../Firebase/ProfileScreen.dart';
import '../Firebase/page3.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key, required User user})
      : super(key: key);

  @override
  
  
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  int pageIndex = 0;

  final pages = [
      Page1(),
     Page2(),
    ListofData(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF262D40),
      appBar: AppBar(
        title: Text(
          "Welcome to Innovations",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstRoute()));
      },backgroundColor:Colors.green[400],
        child: const Icon(Icons.menu,size:30,),
      ),
      drawer: Drawer(
        backgroundColor:Color.alphaBlend(Colors.white30, Colors.white70),

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child:
              Container(
                margin: const EdgeInsets.only(left:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome to innovations",textAlign:TextAlign.center,style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize:25,color: Colors.white
                    ),
                    ),

                  ],
                ),
              ),

            ),
            ListTile(

              title: const Text('Work hard',style: TextStyle(fontSize:20)
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Think logically',style: TextStyle(fontSize:20)
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });

            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.work_rounded,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.work_outline_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.widgets_rounded,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.widgets_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(' get success'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Get Happy life!'),
        ),
      ),
    );
  }
}
