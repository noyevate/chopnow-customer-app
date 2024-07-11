import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_search_bar.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/controllers/search_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

import 'category_search.dart';
import 'widget/recent_serarch_circle_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodRestaurantController());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Container(
            color: Tcolor.White,
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseableText(
                    title: "Search",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.Text),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextWidget(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    hintText: "Search restaurant, food, drinks, etc",
                    prefixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        HeroiconsOutline.magnifyingGlass,
                        size: 26.sp,
                        color: Tcolor.TEXT_Placeholder,
                      ),
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              _onSearchChanged();
                            },
                            child: Icon(
                              HeroiconsSolid.xCircle,
                              size: 32.sp,
                              color: Tcolor.BORDER_Dark,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
                    child: SizedBox(
                      height: 280.h,
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: ReuseableText(
                              title: "Recent searches",
                              style: TextStyle(
                                  fontSize: 34.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Tcolor.Text),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            children: [
                              const RecentSerarchCircleWidget(
                                title: 'Grills',
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const RecentSerarchCircleWidget(
                                title: 'Plantain',
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const RecentSerarchCircleWidget(
                                title: 'Indomie',
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const RecentSerarchCircleWidget(
                            title: 'Iya Kamo',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.w,
                      bottom: 40.w,
                    ),
                    child: Divider(
                      thickness: 25.h,
                      color: Tcolor.BACKGROUND_Regaular,
                    ),
                  ),
                  
                  const CategorySearch(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(top: 60.h),
//                             child: ReuseableText(
//                               title: "Recent searches",
//                               style: TextStyle(
//                                   fontSize: 34.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: Tcolor.Text),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 40.h,
//                           ),
//                           SizedBox(
//                             height: 190.h,
//                             width: width,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     const RecentSerarchCircleWidget(
//                                       title: 'Grills',
//                                     ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     const RecentSerarchCircleWidget(
//                                       title: 'Plantain',
//                                     ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     const RecentSerarchCircleWidget(
//                                       title: 'Indomie',
//                                     ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 15.h,
//                                 ),
//                                 const RecentSerarchCircleWidget(
//                                   title: 'Iya Kamo',
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
