import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home1 extends StatelessWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: ElevatedButton(
      onPressed: () => {Navigator.pushNamed(context, '/home2')},
      child: Text('Home 1'),
    ),));
  }
}
