import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_delight/app/routes/app_routes.dart';
import 'package:nusantara_delight/app/modules/login/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDIlVutcyTlpCxJqYby-dCh23MMghgx2Pg", // API Key
      appId: "1:186318079556:android:4ce5e17f9ce36221551e11", // App ID
      messagingSenderId: "186318079556", // Sender ID
      projectId: "nusantaradelight-8712b", // Project ID
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplikasi Profile Diri",
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData && snapshot.data!.emailVerified) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Aplikasi Profile Diri",
                initialRoute: Routes.HOME,
                getPages: AppPages.pages,
                theme: ThemeData(
                  primarySwatch: Colors.indigo,
                ),
              );
            } else {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Aplikasi Profile Diri",
                initialRoute: Routes.LOGIN,
                getPages: AppPages.pages,
                theme: ThemeData(
                  primarySwatch: Colors.indigo,
                ),
              );
            }
          } else {
            return Center(child: Text('Error loading authentication status'));
          }
        },
      ),
    );
  }
}
