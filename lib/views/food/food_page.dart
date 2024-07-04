import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_button.dart';
import 'package:chopnow_new_customer_app/views/common/custom_circular_checkbox.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/row_icon.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/controllers/food_controller.dart';
import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, this.food});

  final FoodModel? food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // Track the checked state for each additive
  final Map<String, bool> _isChecked = {};

  @override
  void initState() {
    super.initState();
    // Initialize the checked state map with default values
    widget.food?.additive.forEach((additive) {
      _isChecked[additive.title] = false; // Default to false
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController()); 
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.r),
            topRight: Radius.circular(60.r),
          ),
          color: Tcolor.White,
        ),
        child: Column(
          children: [
            // Image section
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.r),
                topRight: Radius.circular(60.r),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: 400.h,
                    width: double.infinity,
                    child: PageView.builder(
                      itemCount: widget.food!.imageUrl.length,
                      itemBuilder: (context, i) {
                        return Container(
                          color: Tcolor.White,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.food!.imageUrl[i],
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: SvgPicture.asset(
                        "assets/img/cancle.svg",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            // Scrollable section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseableText(
                        title: widget.food!.title,
                        style: TextStyle(
                          color: Tcolor.Text,
                          fontWeight: FontWeight.w500,
                          fontSize: 36.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      ReuseableText(
                        title: "\u20A6 ${widget.food!.price.toString()}",
                        style: TextStyle(
                          color: Tcolor.Text,
                          fontWeight: FontWeight.w400,
                          fontSize: 28.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      ReuseableText(
                        title: widget.food!.description,
                        style: TextStyle(
                          color: Tcolor.TEXT_Label,
                          fontWeight: FontWeight.w400,
                          fontSize: 28.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Divider(
                        thickness: 2.w,
                        color: Tcolor.BORDER_Light,
                      ),
                      SizedBox(height: 10.h),
                      ReuseableText(
                        title: "MAIN",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: Tcolor.TEXT_Label,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReuseableText(
                            title: "Required",
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                              color: Tcolor.ERROR_Reg,
                            ),
                          ),
                          ReuseableText(
                            title: "Add up to 5",
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                              color: Tcolor.TEXT_Label,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowIcon(
                            title: widget.food!.title,
                            style: TextStyle(
                              fontSize: 34.sp,
                              fontWeight: FontWeight.w400,
                              color: Tcolor.Text,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.decrement();
                                },
                                child: Icon(
                                  AntDesign.minuscircleo,
                                  size: 36.sp,
                                  color: Tcolor.TEXT_Placeholder,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Obx(() => ReuseableText(
                                  title: "${controller.count.value}",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Tcolor.TEXT_Body,
                                  ),
                                ),)
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.increment();
                                },
                                child: Icon(
                                  AntDesign.pluscircleo,
                                  size: 36.sp,
                                  color: Tcolor.TEXT_Body,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 80.w),
                                child: ReuseableText(
                                  title:
                                      "\u20A6 ${widget.food!.price.toString()}",
                                  style: TextStyle(
                                    color: Tcolor.TEXT_Label,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28.sp,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Divider(
                        thickness: 2.w,
                        color: Tcolor.BORDER_Light,
                      ),
                      SizedBox(height: 10.h),
                      ReuseableText(
                        title: "Additives And Toppings",
                        style: TextStyle(
                          color: Tcolor.TEXT_Label,
                          fontWeight: FontWeight.w400,
                          fontSize: 32.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Column(
                        children: List.generate(
                          widget.food!.additive.length,
                          (index) {
                            final additive = widget.food!.additive[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h), // Adjust vertical spacing
                              child: ListTile(
                                minTileHeight: 10.h, // Minimal vertical padding
                                dense: true, // Reduce vertical size
                                contentPadding:
                                    EdgeInsets.zero, // No internal padding
                                visualDensity:
                                    VisualDensity.compact, // Compact density
                                leading: CustomCircularCheckbox(
                                  value: _isChecked[additive.title] ?? false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked[additive.title] =
                                          value ?? false;
                                    });
                                  },
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ReuseableText(
                                      title: additive.title,
                                      style: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Tcolor.Text,
                                      ),
                                    ),
                                    ReuseableText(
                                      title:
                                          "\u20A6 1200 ", // {additive.price.toString()}
                                      style: TextStyle(
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 28.sp,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 2.w,
                        color: Tcolor.BORDER_Light,
                      ),
                      SizedBox(height: 10.h),
                      ReuseableText(
                        title: "Additives And Toppings",
                        style: TextStyle(
                          color: Tcolor.TEXT_Label,
                          fontWeight: FontWeight.w400,
                          fontSize: 32.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Column(
                        children: List.generate(
                          widget.food!.additive.length,
                          (index) {
                            final additive = widget.food!.additive[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h), // Adjust vertical spacing
                              child: ListTile(
                                minTileHeight: 10.h, // Minimal vertical padding
                                dense: true, // Reduce vertical size
                                contentPadding:
                                    EdgeInsets.zero, // No internal padding
                                visualDensity:
                                    VisualDensity.compact, // Compact density
                                leading: CustomCircularCheckbox(
                                  value: _isChecked[additive.title] ?? false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked[additive.title] =
                                          value ?? false;
                                    });
                                  },
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ReuseableText(
                                      title: additive.title,
                                      style: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Tcolor.Text,
                                      ),
                                    ),
                                    ReuseableText(
                                      title:
                                          "\u20A6 \u20A6 1200 ", //${additive.price.toString()}
                                      style: TextStyle(
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 28.sp,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Divider(
                        thickness: 2.w,
                        color: Tcolor.BORDER_Light,
                      ),
                      SizedBox(height: 10.h),
                      ReuseableText(
                        title: "Additives And Toppings",
                        style: TextStyle(
                          color: Tcolor.TEXT_Label,
                          fontWeight: FontWeight.w400,
                          fontSize: 32.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Column(
                        children: List.generate(
                          widget.food!.additive.length,
                          (index) {
                            final additive = widget.food!.additive[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h), // Adjust vertical spacing
                              child: ListTile(
                                minTileHeight: 10.h, // Minimal vertical padding
                                dense: true, // Reduce vertical size
                                contentPadding:
                                    EdgeInsets.zero, // No internal padding
                                visualDensity:
                                    VisualDensity.compact, // Compact density
                                leading: CustomCircularCheckbox(
                                  value: _isChecked[additive.title] ?? false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked[additive.title] =
                                          value ?? false;
                                    });
                                  },
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ReuseableText(
                                      title: additive.title,
                                      style: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Tcolor.Text,
                                      ),
                                    ),
                                    ReuseableText(
                                      title:
                                          "\u20A6 12000", //${additive.price.toString()}
                                      style: TextStyle(
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 28.sp,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 2.w,
                        color: Tcolor.BORDER_Light,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              border: Border.all(color: Tcolor.BORDER_Light),
                              color: Tcolor.White,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.sp),
                              child: Center(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print(" -1");
                                      },
                                      child: Icon(
                                        AntDesign.minuscircleo,
                                        size: 36.sp,
                                        color: Tcolor.TEXT_Placeholder,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      child: ReuseableText(
                                        title: "1",
                                        style: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Tcolor.TEXT_Body,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print(" +1");
                                      },
                                      child: Icon(
                                        AntDesign.pluscircleo,
                                        size: 36.sp,
                                        color: Tcolor.TEXT_Body,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CustomButton(
                            title: "₦10,000 | Add to cart",
                            showArrow: false,
                            btnHeight: 80.h,
                            btnWidth: width/ 1.8,
                            raduis: 100.r,
                            fontSize: 30.sp,
                            textColor: Tcolor.Text,

                          )
                        ],
                      )
                    ],
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
