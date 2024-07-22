import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:nusantara_delight/app/modules/profile/views/edit_profile_view.dart';
import 'package:nusantara_delight/app/modules/profile/views/riwayat_transaksi.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.blue[900],
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: _image != null ? FileImage(_image!) : null,
                          child: _image == null ? Icon(Icons.add_a_photo, size: 40, color: Colors.white) : null,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username',
                                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'email@example.com',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            Get.to(() => EditProfileView(
                                  image: _image,
                                  username: 'Username',
                                  email: 'email@example.com',
                                  phoneNumber: '1234567890',
                                  birthDate: '01-01-1990',
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.receipt, color: Colors.white),
                    ),
                    title: Text('Riwayat Transaksi'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Get.to(() => RiwayatTransaksiView());
                    },
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.favorite, color: Colors.white),
                    ),
                    title: Text('Menu Favorit'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Logic for navigating to favorite menu
                    },
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.logout, color: Colors.white),
                    ),
                    title: Text('Logout'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Logic for logout
                    },
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
