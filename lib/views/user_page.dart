import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/user_controller.dart';

// ignore: must_be_immutable
class UserPage extends StatelessWidget {
  final userController = Get.put(UserController());
  var getArgument = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getArgument[1],
      appBar: AppBar(
        title: Text('${getArgument[0]}'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => userController.isLoading.value
                    ? Center(
                        child: userController.timeout.value
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Server Timeout'),
                                  FlatButton(
                                    color: Colors.orange,
                                    onPressed: () {
                                      userController.fetchUsers();
                                    },
                                    child: Text('refresh'),
                                  )
                                ],
                              )
                            : CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: userController.userList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print('click');
                              userController.navigatetoDetails(index);
                            },
                            child: Card(
                              margin:
                                  EdgeInsets.only(top: 12, left: 12, right: 12),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${userController.userList[index].id}',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              '${userController.userList[index].email}',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${userController.userList[index].username}',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              '${userController.userList[index].name}',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
