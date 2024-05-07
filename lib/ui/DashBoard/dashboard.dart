import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dashboard_controller.dart';
import '../widgets/drawer.dart';
import '../widgets/nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Builder(builder: (context) {
            if (controller.pageIndex.value == 0) {
              return IconButton(
                icon: const Icon(Icons.sort_rounded),
                color: Colors.black87,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black87,
                onPressed: () {
                  controller.pageIndex.value = 0;
                },
              );
            }
          }),
        ),
        body: Obx(() => controller.pageOptions[controller.pageIndex.value]),
        drawer: const CustomDrawer(),
        bottomNavigationBar: CustomNavigationBar(
          pageIndex: controller.pageIndex.value,
          onTabSelected: (index) {
            controller.pageIndex.value = index;
          },
        ),
      ),
    );
  }
}
