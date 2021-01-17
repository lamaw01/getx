import 'dart:async';
import 'dart:io';
import 'package:getx/models/user.dart';
import 'package:http/http.dart' as http;

class ServicesApi {
  static var client = http.Client();
  static String urlUsers = 'https://jsonplaceholder.typicode.com/users';
  bool timeout = false;

  // ignore: missing_return
  static Future<List<User>> fetchUsers() async {
    try {
      var response = await client.get(urlUsers).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          throw TimeoutException("connection timeout.");
        },
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return userFromJson(jsonString);
      } else {
        print('user error');
      }
    } on TimeoutException catch (_) {
      // Get.dialog(Text('connection timeout'));
      print('response timeout');
    } on SocketException catch (_) {
      print('socket error');
    } catch (e) {
      print('err $e');
    }
  }
}
