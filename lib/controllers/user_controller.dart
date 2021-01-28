import 'package:get/get.dart';
import 'package:getx/models/user.dart';
import 'package:getx/services/services_api.dart';

import '../views/userdetails_page.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var timeout = false.obs;
  var userList = List<User>().obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      var users = await ServicesApi.fetchUsers();
      if (users != null) {
        userList.assignAll(users);
        isLoading(false);
      } else {
        timeout(true);
      }
    } catch (e) {
      print('err $e');
    }
  }

  void navigatetoDetails(index) {
    Get.to(UserDetails(
      id: index,
    ));
  }
}
