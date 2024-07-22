import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_delight/app/modules/profile/controllers/profile_controller.dart';

class RiwayatTransaksiView extends StatelessWidget {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Transaksi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            if (controller.orderHistory.isEmpty) {
              return Center(child: Text('No order history available.'));
            }
            return ListView.builder(
              itemCount: controller.orderHistory.length,
              itemBuilder: (context, index) {
                final order = controller.orderHistory[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Order ID: ${order['id_transaksi']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal: ${order['tanggal']}'),
                        Text('Nama Menu: ${order['nama_menu']}'),
                        Text('Jumlah: ${order['jumlah']}'),
                        Text('Harga: \$${order['harga']}'),
                        Text('Total Harga: \$${order['total_harga']}'),
                        Text('Status: ${order['status']}'),
                        Text('Metode Pembayaran: ${order['metode_pembayaran']}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteConfirmation(context, order['id_transaksi']);
                      },
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus transaksi ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _deleteTransaction(id);
                Get.back();
              },
              child: Text('Hapus'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTransaction(String id) async {
    final profileController = Get.find<ProfileController>();
    final url = 'https://669b4a87276e45187d350953.mockapi.io/nusantara_delight/transaksi/$id';
    
    try {
      final response = await profileController.deleteTransaction(id, url);
      if (response.statusCode == 200) {
        Get.snackbar('Berhasil', 'Transaksi berhasil dihapus.');
        // Refresh order history
        profileController.fetchOrderHistory();
      } else {
        Get.snackbar('Gagal', 'Gagal menghapus transaksi.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan saat menghapus transaksi.');
    }
  }
}
