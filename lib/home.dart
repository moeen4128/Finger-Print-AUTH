import 'package:flutter/material.dart';
class FingerHome extends StatefulWidget {
  const FingerHome({Key? key}) : super(key: key);

  @override
  State<FingerHome> createState() => _FingerHomeState();
}

class _FingerHomeState extends State<FingerHome> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
          ),
          Padding(padding: EdgeInsets.only(left: 50, top: 8, right: 0, bottom: 0),child: Text(
            "Successfully authenticated using fingerprint in application",
          ),)
        ],
      ),
    );
  }
}
