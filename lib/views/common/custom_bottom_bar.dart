import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum IconType { svg, image }

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    this.color,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final Color? color;
  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Tcolor.BACKGROUND_Dark,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically
          children: [
            _buildNavItem(
              context,
              iconData: Icons.home_outlined,
              label: 'Home',
              index: 0,
              onPressed: () => onItemTapped(0),
            ),
            _buildNavItem(
              context,
              iconData: Icons.search_outlined,
              label: 'Search',
              index: 1,
              onPressed: () => onItemTapped(1),
            ),
            SizedBox(width: 30.w), // Space for FloatingActionButton
            _buildNavItem(
              context,
              iconData: Icons.support_agent,
              label: 'Support',
              index: 3,
              onPressed: () => onItemTapped(3),
            ),
            _buildNavItem(
              context,
              iconPath: "assets/img/bottombar_profile.png",
              iconType: IconType.image,
              label: 'Profile',
              index: 4,
              onPressed: () => onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    String? iconPath,
    IconData? iconData,
    required String label,
    IconType? iconType,
    required int index,
    required VoidCallback onPressed,
  }) {
    assert(iconPath != null || iconData != null,
        'Either iconPath or iconData must be provided');
    assert(iconType != null || iconData != null,
        'iconType must be provided if using iconPath');

    bool isSelected = selectedIndex == index;
    Color itemColor = isSelected ? Tcolor.Primary : Tcolor.TEXT_Label;

    Widget iconWidget;
    if (iconPath != null && iconType != null) {
      switch (iconType) {
        case IconType.svg:
          iconWidget = SvgPicture.asset(
            iconPath,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
          );
          break;
        case IconType.image:
          iconWidget = Image.asset(
            iconPath,
            width: 40.w,
            height: 40.h,
          );
          break;
      }
    } else {
      iconWidget = Icon(
        iconData,
        color: itemColor,
        size: 40.sp,
      );
    }

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(height: 4),
          ReuseableText(
            title: label,
            style: TextStyle(
              fontSize: 24.sp,
              color: itemColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}