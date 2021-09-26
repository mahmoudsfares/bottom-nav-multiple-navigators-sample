import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_navigation/main.dart';

class Profile2 extends StatelessWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
          body: Center(
        child: ElevatedButton(
          onPressed: () {
            AppState.isFirstScreenInTab = true;
            Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
          child: Text('pop all'),
        ),
      )),
    );
  }
}
