import 'package:flutter/material.dart';

class SelfieVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selfie Verification"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.face,
              size: 100,
            ),
            SizedBox(height: 20),
            Text("Look at camera"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Capture Selfie"),
            ),
          ],
        ),
      ),
    );
  }
}