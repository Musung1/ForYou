
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app_color_style.dart';
import 'package:untitled/controllers/buttonController.dart';

void main()async{
  Get.put(ButtonController());
  runApp(
    MainPage()
  );
}

class MainPage extends StatelessWidget {
  ButtonController buttonController = ButtonController.instance;

  Widget ActivatedChips(text,id) {
    return GetBuilder<ButtonController>(
      id: id,
      builder: (controller) {
        return ElevatedButton(
            onPressed: () {
              buttonController.change(id);
              buttonController.count();
            },
            child: Text(text,
            style: TextStyle(
              color: buttonController.k,
            ),)
        );
      }
    );
  }

  //주석

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body:Column(
          children: [
            GetBuilder<ButtonController>(
              builder:(controller)=> Text("${controller.a}")
            ),
            ActivatedChips("button",1),
            ActivatedChips("button",2),
            ActivatedChips("button",3),
          ],
        ),
      ),
    );
  }
}


