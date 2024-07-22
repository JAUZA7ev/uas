import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_delight/app/modules/menu/controllers/menu_controller.dart' as custom;

class MenuView extends GetView<custom.MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button if needed
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Get.toNamed('/checkout'); // Navigasi ke halaman checkout
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.menuItems.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return _buildMenuList();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: controller.menuItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigasi ke halaman detail dengan parameter item menu yang dipilih
            Get.toNamed('/menu/detail', arguments: controller.menuItems[index]);
          },
          child: _buildMenuItem(controller.menuItems[index]),
        );
      },
    );
  }

  Widget _buildMenuItem(Map<String, String> menuItem) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              menuItem['image']!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuItem['name']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
