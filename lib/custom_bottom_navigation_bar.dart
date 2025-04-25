import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lunabelle_app/setting_screen.dart';
import 'package:lunabelle_app/web_to_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final RxInt currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() => ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.px),
          bottom: Radius.circular(0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex.value,
          backgroundColor: Colors.blue,
          selectedItemColor: const Color(0xFF0EB9EF),
          unselectedItemColor: Colors.black,
          //selectedLabelStyle: AppTextStyles.bodyRegular.copyWith(color: AppColors.blue),
          //unselectedLabelStyle: AppTextStyles.bodyRegular.copyWith(color: const Color(0xff6f6f6f)),
          onTap: (value) {
            currentIndex.value = value;
          },
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: _buildNavItem(
                icon: SvgPicture.asset("assets/svg/home_grey_icon.svg"),
                selectedIcon: SvgPicture.asset("assets/svg/home_white_icon.svg"),
                label: "Home",
                isSelected: currentIndex.value == 0,
              ),
            ),
            // BottomNavigationBarItem(
            //   label: "",
            //   icon: _buildNavItem(
            //     icon: SvgPicture.asset("assets/svgs/maintained_grey_icon.svg"),
            //     selectedIcon: SvgPicture.asset("assets/svgs/maintained_white_icon.svg"),
            //     label: "Maintained",
            //     isSelected: currentIndex.value == 1,
            //   ),
            // ),
            BottomNavigationBarItem(
              label: "",
              icon: _buildNavItem(
                icon: SvgPicture.asset("assets/svg/settings_grey_icon.svg"),
                selectedIcon: SvgPicture.asset("assets/svg/settings_white_icon.svg"),
                label: "Setting",
                isSelected: currentIndex.value == 3,
              ),
            ),
          ],
        ),
      ),
      ),
      body: Obx(() {
        switch (currentIndex.value) {
          case 0:
            return const WebsiteConvertApp();
          case 1:
            return const SettingScreen();
        // case 2:
        // // return const SettingScreen();
          default:
            return const SizedBox();
        }
      }),
    );
  }
}

Widget _buildNavItem({
  required Widget icon,
  required Widget selectedIcon,
  required String label,
  required bool isSelected,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        child: isSelected ? selectedIcon : icon,
      ),
      //SizedBox(height: 5.px),
      Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xffD0D5DD),
          fontSize: 12.px,
        ),
      ),
    ],
  );
}