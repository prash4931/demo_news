import 'package:demo_news/core/constants/color_constants.dart';
import 'package:demo_news/core/constants/textstyle_constants.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isImageTitle;
  final bool? isLeadingRequired;

  final String? image;
  final List<Widget>? actions;
  final VoidCallback? leadingCallback;
  final bool? centerTitle;
  final IconData? leadingIcon;
  final bool isFromNoti;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpaceWidget;

  final double? height;

  const CommonAppBar({
    Key? key,
    this.title,
    this.isImageTitle,
    this.isLeadingRequired = true,
    this.image,
    this.actions,
    this.leadingCallback,
    this.centerTitle,
    this.leadingIcon,
    this.isFromNoti = false,
    this.bottom,
    this.height,
    this.flexibleSpaceWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themeViewModel = context.watch<ThemeViewModel>();
    // final baseTextTheme = themeViewModel.baseTextTheme;
    // final baseColorTheme = themeViewModel.colors;

    return AppBar(
        elevation: 0,
        backgroundColor: ColorConstants().primaryColor,
        foregroundColor: Colors.white,
        centerTitle: centerTitle ?? true,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: isImageTitle == true
            ? Image.asset(
                image ?? '',
                height: 50,
                width: 100,
              )
            : Text(title ?? '',
                style: TextStyleConstants().appBarHeadingTextStyle),
        leading: isLeadingRequired == true
            ? InkWell(
                onTap: () {
                  if (leadingCallback == null) {
                    if (isFromNoti) {
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, Routes.homeScreen, (route) => false);
                    } else {
                      Navigator.pop(context);
                    }
                  } else {
                    leadingCallback!();
                  }
                },
                child: Icon(
                  leadingIcon ?? Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              )
            : null,
        automaticallyImplyLeading: false,
        flexibleSpace: flexibleSpaceWidget,
        actions: actions,
        // actions: [
        //   if (actions != null) ...actions!,

        // ],
        bottom: bottom);
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50);
}
