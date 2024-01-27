import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyAppExt());
  }
}

class MyAppExt extends StatefulWidget {
  const MyAppExt({super.key});

  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {
  String buttonName = 'Click';
  int currentIndex = 0;
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(child: Text('App Test')),
      ),
      body: Center(
        child: (currentIndex == 0)
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Color.fromARGB(255, 205, 12, 57),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 246, 246, 246),
                        backgroundColor: Color.fromARGB(255, 86, 224, 234),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const NextPage(),
                            ),
                          );
                        });
                      },
                      child: const Text('Following Page'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 246, 246, 246),
                        backgroundColor: Color.fromARGB(255, 11, 7, 2),
                      ),
                      onPressed: () {
                        setState(() {
                          buttonName = 'LOL';
                        });
                      },
                      child: Text(buttonName),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: (){
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                },
                child: _isClicked ? Image.asset('images/ferrariTestImage.jpg'): Image.network('https://i.pinimg.com/736x/22/6e/55/226e552f4c084b9891d986231f39baec.jpg'),
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
              icon:
                  Icon(Icons.settings /*, size: 30, color: Colors.lightBlue*/))
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

