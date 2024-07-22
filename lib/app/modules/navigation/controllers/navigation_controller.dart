    import 'package:flutter/material.dart';
    import 'package:get/get.dart';
    import 'package:nusantara_delight/app/modules/home/views/home_view.dart';
    import 'package:nusantara_delight/app/modules/menu/views/menu_view.dart';
    import 'package:nusantara_delight/app/modules/profile/views/profile_view.dart';

    class NavigationController extends GetxController {
      var currentIndex = 0.obs;

      List<Widget> pages = [
        HomeView(),
        MenuView(),
        ProfileView(),
      ];

      void changePage(int index) {
        currentIndex.value = index;
      }

      Widget buildPage(RouteSettings settings) {
        final page = pages.firstWhere((element) => element.runtimeType.toString() == settings.name);
        return page;
      }
    }
