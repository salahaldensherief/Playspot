import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_colors.dart';
import '../utils/assets_data.dart';
import '../utils/textStyles.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;
  final bool centerTitle;
  final bool showCart;
  final bool showElevation;
  final Color? BackgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.onBack,
    this.centerTitle = true,
    this.showCart = false,
    this.showElevation = true,
    this.BackgroundColor,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 20.h, left: 12.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: widget.BackgroundColor,
            elevation: 0,
            leading: widget.showBack
                ? GestureDetector(
                    onTapDown: (_) {
                      setState(() => _isPressed = true);
                    },
                    onTapUp: (_) {
                      setState(() => _isPressed = false);
                      (widget.onBack ?? () => Navigator.of(context).pop())();
                    },
                    onTapCancel: () {
                      setState(() => _isPressed = false);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: _isPressed ? 4.h : 2.h,
                        horizontal: _isPressed ? 4.w : 2.w,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SvgPicture.asset(
                        AssetsData.arrow,
                        width: 10.w,
                        height: 10.h,
                      ),
                    ),
                  )
                : null,
            centerTitle: widget.centerTitle,
            title: Text(
              widget.title,
              style: TextStyles.regular11.copyWith(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
          ),
          widget.showElevation
              ? Container(
                  height: 1,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26.withOpacity(.2),
                        spreadRadius: .1,
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
