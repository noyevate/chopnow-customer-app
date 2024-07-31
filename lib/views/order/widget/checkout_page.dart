import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_button.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/controllers/checkout_controller.dart';
import 'package:chopnow_new_customer_app/views/controllers/food_controller.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:chopnow_new_customer_app/views/order/subwidget/note_to_rider.dart';
import 'package:chopnow_new_customer_app/views/order/subwidget/note_to_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

import '../subwidget/add_pack.dart';
import '../subwidget/delivery_information_widget.dart';
import '../subwidget/icon_name_icon.dart';
import '../subwidget/items_and_price.dart';
import '../subwidget/restaurant_logo_name.dart';
import '../subwidget/checkout_row.dart';
import '../subwidget/tezt_widget.dart';

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

class CheckoutPage extends HookWidget {
  const CheckoutPage({super.key, this.food, required this.selectedItems});
  final FoodModel? food;
  final List<SelectedItem> selectedItems;

  @override
  Widget build(BuildContext context) {
    // final List<SelectedItem> selectedItems = Get.arguments;
    final CheckoutController controller = Get.put(CheckoutController());
    final packs = useState<List<int>>([1]);

    int _calculateTotalPrice() {
      int total = 0;

      for (var item in selectedItems) {
        total += item.price * item.quantity;
      }

      if (selectedItems.isNotEmpty) {
        total += selectedItems[0].foodCount * selectedItems[0].foodPrice;
      }

      return total;
    }

    void _addPack() {
      int nextPackNumber = packs.value.isNotEmpty ? packs.value.last + 1 : 1;
      packs.value = [...packs.value, nextPackNumber];
    }

    void _removePack(int packNumber) {
      packs.value = packs.value.where((pack) => pack != packNumber).toList();
      if (packs.value.isEmpty) {
        packs.value = [1];
      }
    }

    final box = GetStorage();
    final first_name = box.read("first_name");
    final last_name = box.read("first_name");
    final phone = box.read("phone");

    return Scaffold(
      backgroundColor: Tcolor.BACKGROUND_Regaular,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Container(
          color: Tcolor.White,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        color: Tcolor.White,
        child: Column(
          children: [
            Container(
              height: 100.h,
              color: Tcolor.White,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        color: Tcolor.BACKGROUND_Dark,
                        borderRadius: BorderRadius.circular(60.r),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            HeroiconsOutline.arrowLeft,
                            color: Tcolor.Text,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: ReuseableText(
                      title: "Checkout",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36.sp,
                        color: Tcolor.Text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 30.w),
                  const CheckoutRow(),
                  SizedBox(height: 30.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: RestaurantLogo_name(food: food),
                  ),
                  SizedBox(height: 20.h),
                  for (int packNumber in packs.value)
                    Padding(
                      key: ValueKey(packNumber),
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReuseableText(
                                title: "Pack $packNumber",
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Tcolor.TEXT_Body,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    HeroiconsMini.plus,
                                    size: 32.sp,
                                    color: Tcolor.PRIMARY_S4,
                                  ),
                                  SizedBox(width: 10.w),
                                  GestureDetector(
                                    child: ReuseableText(
                                      title: "Add Items",
                                      style: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Tcolor.PRIMARY_S4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  GestureDetector(
                                    onTap: () => _removePack(packNumber),
                                    child: Container(
                                      height: 60.h,
                                      width: 60.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        color: Tcolor.ERROR_Light_1,
                                      ),
                                      child: Icon(
                                        HeroiconsOutline.trash,
                                        size: 32.sp,
                                        color: Tcolor.ERROR_Reg,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReuseableText(
                                title: selectedItems[0].foodTitle,
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Tcolor.TEXT_Body,
                                ),
                              ),
                              ReuseableText(
                                title: "x${selectedItems[0].foodCount}",
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Tcolor.TEXT_Body,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          ReuseableText(
                            title: "${selectedItems[0].foodPrice}",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: Tcolor.TEXT_Label,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          ItemsAndPrice(selectedItems: selectedItems),
                          SizedBox(height: 20.h),
                          ReuseableText(
                            title: 'Total: ${_calculateTotalPrice()}',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: Tcolor.Text,
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: Tcolor.BACKGROUND_Regaular,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: _addPack,
                        child: Container(
                          width: 400.w,
                          child: const AddPack(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Divider(
                    thickness: 20.h,
                    color: Tcolor.BACKGROUND_Regaular,
                  ),
                  SizedBox(height: 30.h),
                  DeliveryInformationWidget(
                      firstName: first_name, lastName: last_name, phone: phone),
                  SizedBox(height: 30.h),
                  Divider(
                    thickness: 20.h,
                    color: Tcolor.BACKGROUND_Regaular,
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReuseableText(
                          title: "Instructions",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                            color: Tcolor.Text,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        GestureDetector(
                          onTap: () {
                            showCustomBottomSheet(
                              context,
                              const NoteToStore(),
                              1400.h, // Set the height for this bottom sheet
                            );
                          },
                          child: IconNameIcon(
                            name: "Note to store",
                            icon: HeroiconsOutline.buildingStorefront,
                            icon2: HeroiconsOutline.chevronRight,
                            color: Tcolor.TEXT_Placeholder,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        GestureDetector(
                          onTap: () {
                            showCustomBottomSheet(
                              context,
                              const NoteToRider(),
                              1400.h, // Set the height for this bottom sheet
                            );
                          },
                          child: IconNameIcon(
                            name: "Note to rider",
                            icon: Icons.delivery_dining_outlined,
                            icon2: HeroiconsOutline.chevronRight,
                            color: Tcolor.TEXT_Placeholder,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200.h),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
              decoration: BoxDecoration(
                color: Tcolor.White,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 90.h,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      gradient: Tcolor.Primary_button,
                      boxShadow: [
                        BoxShadow(
                            color: Tcolor.PRIMARY_Button_Inner_Shadow,
                            offset: const Offset(0, -1),
                            blurRadius: 1.r,
                            spreadRadius: 0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReuseableText(
                          title: "Place order ",
                          style: TextStyle(
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w500,
                            fontSize: 28.sp,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        ReuseableText(
                          title: "\u20A6 ${_calculateTotalPrice()} ",
                          style: TextStyle(
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w500,
                            fontSize: 28.sp,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
