import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MathChallengeScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("math Challenge"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SLove this ",
              style: TextStyle(
                  fontSize: 24
              )
          ),
          SizedBox(height: 20),
          Text("12+8 =?",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              )
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text("Check "))
        ],
      ),
    );
  }
}