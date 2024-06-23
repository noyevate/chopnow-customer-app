import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102.h,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, 102.h),
            painter: BottomNavBarPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              onPressed: () => onItemSelected(2),
              backgroundColor: Colors.blue,
              child: const Icon(Icons.shopping_cart),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.search, 1),
                const SizedBox(width: 60), // Space for the floating action button
                _buildNavItem(Icons.support, 3),
                _buildNavItem(Icons.person, 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      onPressed: () => onItemSelected(index),
      icon: Icon(
        icon,
        color: selectedIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // Drawing the custom curve shape
    final Path clipPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height - 20.h,
        0,
        size.height,
      )
      ..close();

    canvas.drawPath(path, paint);

    final Paint borderPaint = Paint()
      ..color = const Color(0xFFF4F4F6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(clipPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
