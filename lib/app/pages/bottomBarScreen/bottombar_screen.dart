import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (controller) => DefaultTabController(
        length: controller.tabController?.length ?? 0,
        initialIndex: 0,
        child: Scaffold(
          bottomNavigationBar: ConvexAppBar(
            controller: controller.tabController,
            onTap: (index) {
              controller.tabController?.index = index;
              controller.update();
            },
            height: 60,
            items: [
              TabItem(
                icon: SvgPicture.asset("assets/icons/home.svg"),
                activeIcon: SvgPicture.asset("assets/icons/selected Home.svg"),
              ),
              TabItem(
                icon: SvgPicture.asset("assets/icons/Category.svg"),
                activeIcon:
                    SvgPicture.asset("assets/icons/Selected Category.svg"),
              ),
              TabItem(
                icon: CircleAvatar(
                  backgroundColor: ColorsValue.appColor,
                  child: SvgPicture.asset(
                    'assets/icons/shoping.svg',
                  ),
                ),
              ),
              TabItem(
                icon: SvgPicture.asset("assets/icons/Coupen.svg"),
              ),
              TabItem(
                icon: SvgPicture.asset("assets/icons/profile.svg"),
                activeIcon:
                    SvgPicture.asset("assets/icons/selected Profile.svg"),
              ),
            ],
            backgroundColor: const Color(0xffFFFFFF),
            style: TabStyle.fixedCircle,
          ),
          body: TabBarView(
            controller: controller.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeScreen(),
              const CategoryScreen(),
              const ShoppingCartScreen(),
              const RepairScreen(),
              const ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
