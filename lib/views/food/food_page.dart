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
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, this.food});

  final FoodModel? food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final Map<String, bool> _isChecked = {};

  @override
  void initState() {
    super.initState();
    // Initialize the checked state map with default values
    widget.food?.additive.forEach((additive) {
      additive.options.forEach((option) {
        _isChecked[option.name] = false; // Default to false
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController(widget.food!));
    // print(controller.totalPrice);
    // print(controller.isChecked.values);

    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 246, 243, 243),
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
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.h, right: 30.w),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 70.h,
                          width: 70.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Tcolor.BACKGROUND_Dark
                          ),
                          child: Icon(HeroiconsOutline.xMark, color: Tcolor.Text,
                                size: 24.sp)
                          
                        ),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Obx(
                                    () => ReuseableText(
                                      title: "${controller.count.value}",
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Tcolor.TEXT_Body,
                                      ),
                                    ),
                                  )),
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
                                  child: Obx(
                                    () => ReuseableText(
                                      title:
                                          "\u20A6 ${widget.food!.price * controller.count.value}",
                                      style: TextStyle(
                                        color: Tcolor.TEXT_Label,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 28.sp,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Divider(
                        thickness: 2.w,
                        color: Tcolor.BORDER_Light,
                      ),
                      // SizedBox(height: 10.h),
                      Column(
                        children: List.generate(
                          widget.food!.additive.length,
                          (index) {
                            final additive = widget.food!.additive[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: 25.h),
                                ReuseableText(
                                  title: additive.title,
                                  style: TextStyle(
                                    color: Tcolor.TEXT_Label,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28.sp,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.w, right: 10.w),
                                  child: Column(
                                    children: List.generate(
                                      additive.options.length,
                                      (optionIndex) {
                                        final option =
                                            additive.options[optionIndex];
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.h, bottom: 10.h),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      
                                                      CustomCircularCheckbox(
                                                          value: controller.isChecked["${additive.title}-${option.name}"] ?? false,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              _isChecked[option
                                                                      .name] =
                                                                  value ??
                                                                      false;
                                                            });
                                                            controller
                                                                .toggleCheckbox(
                                                                    "${additive.title}-${option.name}",
                                                                    value);
                                                          }),

                                                          
                                                      SizedBox(width: 10.w),
                                                      SizedBox(
                                                        width: 200.w,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.w,
                                                                  right: 10.w),
                                                          child: ReuseableText(
                                                            title: option.name,
                                                            style: TextStyle(
                                                              color: Tcolor
                                                                  .TEXT_Label,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 28.sp,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  
                                                  SizedBox(width: 20.w,),
                                                  if (index !=
                                                      0) // Hide increment and decrement options for the first object
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: _isChecked[option
                                                                      .name] ==
                                                                  true
                                                              ? () {
                                                                  controller
                                                                      .decrementOption(
                                                                          "${additive.title}-${option.name}");
                                                                }
                                                              : null,
                                                          child: Icon(
                                                            AntDesign
                                                                .minuscircleo,
                                                            size: 36.sp,
                                                            color: _isChecked[option
                                                                        .name] ==
                                                                    true
                                                                ? Tcolor
                                                                    .TEXT_Placeholder
                                                                : Tcolor.TEXT_Placeholder
                                                                    .withOpacity(
                                                                        0.5),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      25.w),
                                                          child: Obx(
                                                            () => ReuseableText(
                                                              title:
                                                                  "${controller.getOptionCount("${additive.title}-${option.name}")}",
                                                              style: TextStyle(
                                                                fontSize: 30.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Tcolor
                                                                    .TEXT_Body,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: _isChecked[option
                                                                      .name] ==
                                                                  true
                                                              ? () {
                                                                  controller
                                                                      .incrementOption(
                                                                          "${additive.title}-${option.name}");
                                                                }
                                                              : null,
                                                          child: Icon(
                                                            AntDesign
                                                                .pluscircleo,
                                                            size: 36.sp,
                                                            color: _isChecked[option
                                                                        .name] ==
                                                                    true
                                                                ? Tcolor
                                                                    .TEXT_Body
                                                                : Tcolor.TEXT_Placeholder
                                                                    .withOpacity(
                                                                        0.5),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (index !=
                                                      0) 
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 80.w),
                                                    child: _isChecked[option
                                                                      .name] ==
                                                                  true? Obx(
                                                      () => ReuseableText(
                                                        title:
                                                            "\u20A6 ${controller.getOptionTotalPrice("${additive.title}-${option.name}")}",
                                                        style: TextStyle(
                                                          color:
                                                              Tcolor.TEXT_Label,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 28.sp,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                    ): 
                                                    ReuseableText(
                                                        title:
                                                            "\u20A6 ${option.price}",
                                                        style: TextStyle(
                                                          color:
                                                              Tcolor.TEXT_Label,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 28.sp,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                    )
                                                  ),
                                                  // if(index == 0)
                                                  if (index == 0)
                                              ReuseableText(
                                                title:
                                                    "\u20A6 ${option.price.toString()}",
                                                style: TextStyle(
                                                  fontSize: 28.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Tcolor.TEXT_Label,
                                                ),
                                              ),

                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 2.w,
                                  color: Tcolor.BORDER_Light,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
                color: Tcolor.White,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(-2, -5),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => ReuseableText(
                      title: "\u20A6 ${controller.totalPrice}",
                      style: TextStyle(
                        color: Tcolor.TEXT_Body,
                        fontWeight: FontWeight.w500,
                        fontSize: 36.sp,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  CustomButton(
                    btnColor: Tcolor.Primary,
                    title: "Add to Order",
                    onTap: () {
                      // Handle the add to order action
                    
                       
                        print(controller.selectedItems[0].foodTitle);
                        print(controller.selectedItems[0].foodPrice);
                        print(controller.selectedItems[0].foodCount);
                    //   
                      
                    },
                    btnWidth: 300.w, showArrow: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



















// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
// import 'package:chopnow_new_customer_app/views/common/custom_button.dart';
// import 'package:chopnow_new_customer_app/views/common/custom_circular_checkbox.dart';
// import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
// import 'package:chopnow_new_customer_app/views/common/row_icon.dart';
// import 'package:chopnow_new_customer_app/views/common/size.dart';
// import 'package:chopnow_new_customer_app/views/controllers/food_controller.dart';
// import 'package:chopnow_new_customer_app/views/models/food_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:heroicons_flutter/heroicons_flutter.dart';

// class FoodPage extends StatefulWidget {
//   const FoodPage({super.key, this.food});

//   final FoodModel? food;

//   @override
//   State<FoodPage> createState() => _FoodPageState();
// }

// class _FoodPageState extends State<FoodPage> {
//   final Map<String, bool> _isChecked = {};

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the checked state map with default values
//     widget.food?.additive.forEach((additive) {
//       additive.options.forEach((option) {
//         _isChecked[option.name] = false; // Default to false
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FoodController(widget.food!));

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(31, 246, 243, 243),
//       body: Container(
//         height: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(60.r),
//             topRight: Radius.circular(60.r),
//           ),
//           color: Tcolor.White,
//         ),
//         child: Column(
//           children: [
//             // Image section
//             ClipRRect(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(60.r),
//                 topRight: Radius.circular(60.r),
//               ),
//               child: Stack(
//                 children: [
//                   SizedBox(
//                     height: 400.h,
//                     width: double.infinity,
//                     child: PageView.builder(
//                       itemCount: widget.food!.imageUrl.length,
//                       itemBuilder: (context, i) {
//                         return Container(
//                           color: Tcolor.White,
//                           child: CachedNetworkImage(
//                             fit: BoxFit.cover,
//                             imageUrl: widget.food!.imageUrl[i],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: Icon(
//                         HeroiconsOutline.xMark,
//                         color: Tcolor.Text,
//                         size: 24.sp,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10.h),
//             // Scrollable section
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.all(30.sp),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ReuseableText(
//                         title: widget.food!.title,
//                         style: TextStyle(
//                           color: Tcolor.Text,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 36.sp,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 15.h),
//                       ReuseableText(
//                         title: "\u20A6 ${widget.food!.price.toString()}",
//                         style: TextStyle(
//                           color: Tcolor.Text,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 28.sp,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 15.h),
//                       ReuseableText(
//                         title: widget.food!.description,
//                         style: TextStyle(
//                           color: Tcolor.TEXT_Label,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 28.sp,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       Divider(
//                         thickness: 2.w,
//                         color: Tcolor.BORDER_Light,
//                       ),
//                       SizedBox(height: 10.h),
//                       ReuseableText(
//                         title: "MAIN",
//                         style: TextStyle(
//                           fontSize: 28.sp,
//                           fontWeight: FontWeight.w500,
//                           color: Tcolor.TEXT_Label,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ReuseableText(
//                             title: "Required",
//                             style: TextStyle(
//                               fontSize: 28.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Tcolor.ERROR_Reg,
//                             ),
//                           ),
//                           ReuseableText(
//                             title: "Add up to 5",
//                             style: TextStyle(
//                               fontSize: 28.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Tcolor.TEXT_Label,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           RowIcon(
//                             title: widget.food!.title,
//                             style: TextStyle(
//                               fontSize: 34.sp,
//                               fontWeight: FontWeight.w400,
//                               color: Tcolor.Text,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   controller.decrement();
//                                 },
//                                 child: Icon(
//                                   AntDesign.minuscircleo,
//                                   size: 36.sp,
//                                   color: Tcolor.TEXT_Placeholder,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 25.w),
//                                 child: Obx(
//                                   () => ReuseableText(
//                                     title: "${controller.count.value}",
//                                     style: TextStyle(
//                                       fontSize: 30.sp,
//                                       fontWeight: FontWeight.w400,
//                                       color: Tcolor.TEXT_Body,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   controller.increment();
//                                 },
//                                 child: Icon(
//                                   AntDesign.pluscircleo,
//                                   size: 36.sp,
//                                   color: Tcolor.TEXT_Body,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 80.w),
//                                 child: Obx(
//                                   () => ReuseableText(
//                                     title:
//                                         "\u20A6 ${widget.food!.price * controller.count.value}",
//                                     style: TextStyle(
//                                       color: Tcolor.TEXT_Label,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 28.sp,
//                                       decoration: TextDecoration.none,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 25.h),
//                       Divider(
//                         thickness: 2.w,
//                         color: Tcolor.BORDER_Light,
//                       ),
//                       Column(
//                         children: List.generate(
//                           widget.food!.additive.length,
//                           (index) {
//                             final additive = widget.food!.additive[index];
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ReuseableText(
//                                   title: additive.title,
//                                   style: TextStyle(
//                                     color: Tcolor.TEXT_Label,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 28.sp,
//                                     decoration: TextDecoration.none,
//                                   ),
//                                 ),
//                                 SizedBox(height: 20.h),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 10.w, right: 10.w),
//                                   child: Column(
//                                     children: List.generate(
//                                       additive.options.length,
//                                       (optionIndex) {
//                                         final option = additive.options[optionIndex];
//                                         return Padding(
//                                           padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       CustomCircularCheckbox(
//                                                         value: _isChecked[option.name] ?? false,
//                                                         onChanged: (bool? value) {
//                                                           if (index == 0) {
//                                                             // Ensure only one item is selected for index 0
//                                                             if (value == true) {
//                                                               setState(() {
//                                                                 _isChecked.updateAll((key, value) => false);
//                                                                 _isChecked[option.name] = true;
//                                                               });
//                                                               controller
//                                                                 .toggleCheckbox(
//                                                                     "${additive.title}-${option.name}",
//                                                                     value);
//                                                             } else {
//                                                               setState(() {
//                                                                 _isChecked[option.name] = false;
//                                                               });
//                                                               controller
//                                                                 .toggleCheckbox(
//                                                                     "${additive.title}-${option.name}",
//                                                                     value);
//                                                             }
//                                                           } else {
//                                                             setState(() {
//                                                               _isChecked[option.name] = value ?? false;
//                                                             });
//                                                             controller.toggleCheckbox("${additive.title}-${option.name}", value);
//                                                           }
//                                                         },
//                                                       ),
//                                                       SizedBox(width: 10.w),
//                                                       SizedBox(
//                                                         width: 200.w,
//                                                         child: Padding(
//                                                           padding: EdgeInsets.only(left: 10.w, right: 10.w),
//                                                           child: ReuseableText(
//                                                             title: option.name,
//                                                             style: TextStyle(
//                                                               fontSize: 28.sp,
//                                                               fontWeight: FontWeight.w400,
//                                                               color: Tcolor.Text,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       index != 0 ? Row(
//                                                         children: [
//                                                           GestureDetector(
//                                                             onTap: () {
//                                                               controller.decrementOption("${additive.title}-${option.name}");
//                                                             },
//                                                             child: Icon(
//                                                               AntDesign.minuscircleo,
//                                                               size: 36.sp,
//                                                               color: Tcolor.TEXT_Placeholder,
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding: EdgeInsets.symmetric(horizontal: 25.w),
//                                                             child: Obx(
//                                                               () => ReuseableText(
//                                                                 title: "${controller.getOptionCount("${additive.title}-${option.name}")}",
//                                                                 style: TextStyle(
//                                                                   fontSize: 30.sp,
//                                                                   fontWeight: FontWeight.w400,
//                                                                   color: Tcolor.TEXT_Body,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           GestureDetector(
//                                                             onTap: () {
//                                                               controller.incrementOption("${additive.title}-${option.name}");
//                                                             },
//                                                             child: Icon(
//                                                               AntDesign.pluscircleo,
//                                                               size: 36.sp,
//                                                               color: Tcolor.TEXT_Body,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ) : SizedBox.shrink(),
//                                                       Padding(
//                                                         padding: EdgeInsets.only(left: 80.w),
//                                                         child: ReuseableText(
//                                                           title: "\u20A6 ${option.price}",
//                                                           style: TextStyle(
//                                                             color: Tcolor.TEXT_Label,
//                                                             fontWeight: FontWeight.w400,
//                                                             fontSize: 28.sp,
//                                                             decoration: TextDecoration.none,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(height: 25.h),
//                                               Divider(
//                                                 thickness: 2.w,
//                                                 color: Tcolor.BORDER_Light,
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.r),
//                   topRight: Radius.circular(40.r),
//                 ),
//                 color: Tcolor.White,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.shade200,
//                     offset: Offset(-2, -5),
//                     blurRadius: 10,
//                   )
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Obx(
//                     () => ReuseableText(
//                       title: "\u20A6 ${controller.totalPrice}",
//                       style: TextStyle(
//                         color: Tcolor.TEXT_Body,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 36.sp,
//                         decoration: TextDecoration.none,
//                       ),
//                     ),
//                   ),
//                   CustomButton(
//                     btnColor: Tcolor.Primary,
//                     title: "Add to Order",
//                     onTap: () {
//                       // if (controller.isFirstAdditiveSelected()) {
//                       //   // Handle the add to order action
//                       //   print(controller.selectedItems[0].foodTitle);
//                       //   print(controller.selectedItems[0].foodPrice);
//                       //   print(controller.selectedItems[0].foodCount);
//                       // } else {
//                       //   Get.snackbar(
//                       //     "Selection Required",
//                       //     "Please select at least one option from the main additive.",
//                       //     snackPosition: SnackPosition.BOTTOM,
//                       //     backgroundColor: Colors.red,
//                       //     colorText: Colors.white,
//                       //   );
//                       // }
//                     },
//                     btnWidth: 300.w, showArrow: true,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }










































