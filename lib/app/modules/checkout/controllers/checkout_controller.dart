import 'package:get/get.dart';

class CartItem {
  final String name;
  final double price;
  final String image;
  int quantity;
  bool isSelected;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    this.isSelected = false,
  });

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      name: map['name'],
      price: map['price'],
      image: map['image'],
      quantity: map['quantity'],
      isSelected: map['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
      'isSelected': isSelected,
    };
  }
}

class CheckoutController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var selectedPickupMethod = ''.obs; // Properti untuk metode pickup yang dipilih

  // Metode untuk menambahkan item ke keranjang
  void addItemToCart(CartItem item) {
    cartItems.add(item);
  }

  // Metode untuk menghapus item dari keranjang
  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
  }

  // Metode untuk mengubah kuantitas item
  void incrementQuantity(int index) {
    cartItems[index].quantity++;
    updateTotalPrice();
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    } else {
      removeItemFromCart(index);
    }
    updateTotalPrice();
  }

  // Metode untuk toggle seleksi item
  void toggleItemSelection(int index) {
    cartItems[index].isSelected = !cartItems[index].isSelected;
    updateTotalPrice();
  }

  // Metode untuk menghitung harga total
  var totalPrice = 0.0.obs;

  void updateTotalPrice() {
    totalPrice.value = cartItems.fold(
      0.0, 
      (sum, item) => sum + (item.isSelected ? item.price * item.quantity : 0.0),
    );
  }
}
