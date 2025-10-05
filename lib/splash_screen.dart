import 'dart:async';

import 'package:flutter/material.dart';
import 'package:running_tracker/pages/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState(){
  super.initState();
  Timer(const Duration(seconds: 3), (){
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context) => HomePage()),
    );
  });
}

 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/run.png",width: 120, height: 120,),
            const SizedBox(height: 30,),

            const Text("Running Tracker",
            style: TextStyle(
              color: Colors.white,fontSize: 28, fontWeight: FontWeight.bold
            )
            ),
                        SizedBox(height: 20,),
            const CircularProgressIndicator(
              color: Colors.lightBlue,
            ),

          ],
        ),
      ),
    );
  }
}