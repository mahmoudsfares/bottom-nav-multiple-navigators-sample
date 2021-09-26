import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_navigation/main.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: ElevatedButton(
      onPressed: () {
        AppState.isFirstScreenInTab = false;
        Navigator.pushNamed(context, '/profile1');
      },
      child: Text('Profile'),
    ),));
  }
}
