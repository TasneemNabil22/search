import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 24),
              width: 120,
              height: 120,
              child: Image.asset(
                'assets/images/internet.png',width: 120,height: 120
              ),
            ),
            Text(
              'No internet Connection',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: Color(0xff000000),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24, 16, 24, 60),
              child: Text(
                'Your internet connection is currently\nnot available Please check or try again.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xff000000),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(1);
              },
              child: Text(
                'Try again',
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 21.34,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: Color(0xfff6f6f9),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
