import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName = 'Click';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Center(child: Text('App Test')),
        ),
        body: Center(
          
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    buttonName = 'You have Clicked';
                  });
                },
                
                child: Text(buttonName),
                
                
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    buttonName = 'LOL';
                  });
                },
                child: Text(buttonName),
              ),
            ],
          ),

          
        ),

        
        
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home /*, size: 30, color: Colors.lightBlue*/),
            ),
            BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(
                    Icons.settings /*, size: 30, color: Colors.lightBlue*/))
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
