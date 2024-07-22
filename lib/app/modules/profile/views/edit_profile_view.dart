import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatefulWidget {
  final File? image;
  final String username;
  final String email;
  final String phoneNumber;
  final String birthDate;

  EditProfileView({
    required this.image,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
  });

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  File? _image;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _birthDateController;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
    _usernameController = TextEditingController(text: widget.username);
    _emailController = TextEditingController(text: widget.email);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _birthDateController = TextEditingController(text: widget.birthDate);
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _updateProfile() {
    // Logic to update profile here
    Get.back();
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                ),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null ? Icon(Icons.add_a_photo, size: 50, color: Colors.white) : null,
                  ),
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _usernameController,
                  icon: Icons.person,
                  label: 'Username',
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  icon: Icons.email,
                  label: 'Email',
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _phoneNumberController,
                  icon: Icons.phone,
                  label: 'Phone Number',
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _birthDateController,
                  icon: Icons.calendar_today,
                  label: 'Birth Date',
                ),
                SizedBox(height: 20),
                Card(
                  color: Colors.blue[900],
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'Update Profile',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: _updateProfile,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required IconData icon, required String label}) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
