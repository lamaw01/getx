import 'package:get/get.dart';
import 'package:getx/models/user.dart';
import 'package:getx/services/services_api.dart';

import '../views/userdetails_page.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = List<User>().obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    var users = await ServicesApi.fetchUsers();
    try {
      isLoading(true);
      print(isLoading.value.toString());
      if (users != null) {
        userList.assignAll(users);
      }
    } catch (e) {
      print('err ${e.toString()}');
    } finally {
      isLoading(false);
      print(isLoading.value.toString());
    }
  }

  void navigatetoDetails(index) {
    Get.to(UserDetails(
      id: index,
    ));
  }
}
