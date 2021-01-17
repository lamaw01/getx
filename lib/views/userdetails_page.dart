import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/user_controller.dart';

class UserDetails extends StatelessWidget {
  final userController = Get.put(UserController());
  UserDetails({Key key, this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Obx(() => Text(userController.userList[id].name)),
          ],
        ),
      ),
    );
  }
}
