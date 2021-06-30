import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/counterController.dart';

class Other extends StatelessWidget {

  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("${c.count}")
      ),
    );
  }
}
