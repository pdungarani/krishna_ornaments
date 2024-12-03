import 'package:flutter/material.dart';
import 'package:krishna_ornaments/app/app.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    required this.onTapBack,
    required this.title,
    this.isTitle = true,
    this.isVisible = true,
  });

  void Function()? onTapBack;
  String title;
  bool isTitle;
  bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsValue.appBg,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Visibility(
        visible: isVisible,
        child: const SizedBox(),
      ),
      title: Visibility(
        visible: isTitle,
        child: Text(
          title,
          style: Styles.color212121W80018,
        ),
      ),
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
