import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krishna_ornaments/app/app.dart';

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
                icon: SvgPicture.asset(
                  AssetConstants.ic_repair,
                  colorFilter: ColorFilter.mode(
                    ColorsValue.grey9DB2CE,
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  AssetConstants.ic_repair,
                  colorFilter: const ColorFilter.mode(
                    ColorsValue.appColor,
                    BlendMode.srcIn,
                  ),
                ),
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
            children: const [
              HomeScreen(),
              CategoryScreen(),
              ShoppingCartScreen(),
              RepairScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
