import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_navigation/main.dart';

class Profile1 extends StatelessWidget {
  const Profile1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppState.isFirstScreenInTab = true;
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(body: Center(child: ElevatedButton(
        onPressed: () => {Navigator.pushNamed(context, '/profile2')},
        child: Text('Profile1'),
      ),)),
    );
  }
}
