import 'package:chopnow_new_customer_app/views/common/capitalized_text.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/controllers/checkout_controller.dart';
import 'package:chopnow_new_customer_app/views/order/subwidget/contact_information.dart';
import 'package:chopnow_new_customer_app/views/order/subwidget/icon_name_icon.dart';
import 'package:chopnow_new_customer_app/views/order/subwidget/icon_name_icon_address.dart';
import 'package:chopnow_new_customer_app/views/order/subwidget/tezt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

void showCustomBottomSheet(
    BuildContext context, Widget content, double height) {
  showModalBottomSheet(
    backgroundColor: Tcolor.White,
    context: context,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
    ),
    builder: (context) => Container(
      constraints: BoxConstraints(
        maxHeight: height,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: content,
      ),
    ),
  );
  // Pass the arguments to Get
}

class DeliveryInformationWidget extends StatelessWidget {
  const DeliveryInformationWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  final String firstName;
  final String lastName;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReuseableText(
            title: "Delivery information",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w500,
              color: Tcolor.Text,
            ),
          ),
          SizedBox(height: 50.h),
          Obx(
            () => GestureDetector(
              onTap: () {
                showCustomBottomSheet(
                  context,
                  const ContactInformation(),
                  1400.h, // Set the height for this bottom sheet
                );
              },
              child: IconNameIcon(
                name: controller.fullnameNote.value.isNotEmpty
                    ? controller.fullnameNote.value
                    : "${capitalizeFirstLetter(firstName)} ${capitalizeFirstLetter(lastName)}",
                icon: HeroiconsOutline.userCircle,
                icon2: HeroiconsOutline.pencil,
              ),
            ),

            

          ),
          Obx(
            () => TeztWidget(
                text: controller.phoneNote.value.isNotEmpty
                    ? controller.phoneNote.value
                    : phone),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            child: const IconNameIconAddress(
              name: "23, Fate Rd",
              icon: HeroiconsOutline.mapPin,
              icon2: HeroiconsOutline.pencil,
            ),
          ),
          const TeztWidget(text: "No 10 20033, Fate Road Ilorin, Kwara State"),
        ],
      ),
    );
  }
}
