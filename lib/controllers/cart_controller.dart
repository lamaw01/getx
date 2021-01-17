import 'package:get/get.dart';
import 'package:getx/models/product.dart';

class CartController extends GetxController {
  //getx
  var cartItems = List<Product>().obs;
  int get countCart => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
  }

  removeToCart(Product product) {
    cartItems.remove(product);
  }

  //getbuilder
  // var totalAmount = 0.0;

  // addToCart(Product product) {
  //   cartItems.add(product);
  //   totalAmount = totalPrice;
  //   update();
  // }

  // removeToCart(Product product) {
  //   cartItems.remove(product);
  //   totalAmount = totalPrice;
  //   update();
  // }
}
