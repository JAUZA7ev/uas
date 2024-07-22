import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_delight/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:nusantara_delight/app/modules/menu/controllers/menu_controller.dart' as custom;

class MenuDetailView extends StatelessWidget {
  final custom.MenuController menuController = Get.find();
  final CheckoutController checkoutController = Get.find();

  @override
  Widget build(BuildContext context) {
    final Map<String, String> menuItem = Get.arguments ?? {};

    return Scaffold(
     appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.blue,
          onPressed: () => Get.back(),
        ),
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Submenu Items',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: menuController.subMenus[menuItem['name']]?.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final nestedItems = menuController.subMenus[menuItem['name']];
                  final nestedItem = nestedItems?[index];
                  if (nestedItem == null) return SizedBox.shrink();

                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(nestedItem['name']!),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(nestedItem['image']!),
                                SizedBox(height: 10),
                                Text('Price: Rp${nestedItem['price']}'),
                                SizedBox(height: 10),
                                Text('Description: ${nestedItem['description']}'),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                nestedItem['image']!,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nestedItem['name']!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Rp${nestedItem['price']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Obx(() {
                                    bool isFavorite = menuController.isFavorite(nestedItem['name']!);
                                    return Icon(
                                      isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: isFavorite ? Colors.red : Colors.grey,
                                    );
                                  }),
                                  onPressed: () {
                                    menuController.toggleFavorite(nestedItem['name']!);
                                  },
                                ),
                                SizedBox(width: 8),
                                IconButton(
                                  icon: Icon(Icons.add_shopping_cart, color: Colors.green),
                                  onPressed: () {
                                    checkoutController.addItemToCart(
                                      CartItem(
                                        name: nestedItem['name']!,
                                        image: nestedItem['image']!,
                                        price: double.parse(nestedItem['price']!),
                                        quantity: 1,
                                      ),
                                    );

                                    Get.snackbar(
                                      'Item Added',
                                      '${nestedItem['name']} has been added to your cart.',
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
