import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadyPhotoScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Photo Challenge")),
    body:  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt,size: 100),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text("Open Camera"))
        ],
      ),
    ),
  );
}
}