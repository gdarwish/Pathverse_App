import 'package:flutter/material.dart';
import 'package:pathverse_app/helper/app_colors.dart';
import 'package:pathverse_app/screens/login_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:get/get.dart';

class CustomAppSideBar extends StatelessWidget {
  final SidebarXController controller = SidebarXController(selectedIndex: 0);

  CustomAppSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      headerDivider: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Image.asset('assets/images/logo2.png'),
      ),
      extendedTheme: const SidebarXTheme(
        width: 150,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      controller: controller,
      theme: const SidebarXTheme(
        iconTheme: IconThemeData(color: Colors.white),
        textStyle: TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
        ),
      ],
      footerItems: [
        SidebarXItem(
            icon: Icons.output_rounded,
            label: 'Sign Out',
            onTap: () {
              Get.toNamed(LoginScreen.route);
            }),
      ],
    );
  }
}
