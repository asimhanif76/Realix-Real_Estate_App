import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/views/My%20Home/my_home_empty.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: MyHomeEmpty(),
    );
  }
}
