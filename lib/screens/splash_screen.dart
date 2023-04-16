import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/homescreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff081735),
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: Center(
              child: Image.asset(
                'assets/images/splash_image.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
         
            
             const Expanded(
              flex: 1,
               child: Center(
                child: SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20,
                ),
                         ),
             ),
          
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                'Developer: owaisamin862@gmail.com',
                style: TextStyle(color: Colors.white),
                // textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
