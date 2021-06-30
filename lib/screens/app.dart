import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/counterController.dart';
import 'package:untitled/screens/other.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(context) {

    // Get.put()을 사용하여 클래스를 인스턴스화하여 모든 "child'에서 사용가능하게 합니다.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // count가 변경 될 때마다 Obx(()=> 를 사용하여 Text()에 업데이트합니다.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // 8줄의 Navigator.push를 간단한 Get.to()로 변경합니다. context는 필요없습니다.
        body: Center(child: ElevatedButton(
            child: Text("Go to Other"), onPressed: () => Get.offAll(Other()))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

