import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RingingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.redAccent,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Alarm Rining",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),
          ),
          SizedBox(height: 30,),
          Icon(Icons.alarm,size: 100,color: Colors.white,),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () {} ,
          child: Text("Start Challenge"),)
        ],
      ),
    ),
  );
  }
}