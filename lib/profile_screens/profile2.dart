import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile2 extends StatelessWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () => {Navigator.popUntil(context, (route) => route.isFirst)},
        child: Text('pop all'),
      ),
    ));
  }
}
