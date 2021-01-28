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
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SafeArea(
        child: Obx(
          () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Id: ${userController.userList[id].id}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Name: ${userController.userList[id].name}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Username: ${userController.userList[id].username}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Email: ${userController.userList[id].email}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Street: ${userController.userList[id].address.street}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Suite: ${userController.userList[id].address.suite}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'City: ${userController.userList[id].address.city}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Zipcode: ${userController.userList[id].address.zipcode}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Lat: ${userController.userList[id].address.geo.lat}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Long: ${userController.userList[id].address.geo.lng}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
