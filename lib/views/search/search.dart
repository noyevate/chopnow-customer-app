import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:chopnow_new_customer_app/views/common/custom_search_bar.dart';
import 'package:chopnow_new_customer_app/views/common/reusable_text_widget.dart';
import 'package:chopnow_new_customer_app/views/common/size.dart';
import 'package:chopnow_new_customer_app/views/controllers/search_page_controller.dart';
import 'package:chopnow_new_customer_app/views/search/category_search.dart';
import 'package:chopnow_new_customer_app/views/search/widget/recent_serarch_circle_widget.dart';
import 'package:chopnow_new_customer_app/views/search/widget/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearched = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged); // Add listener for text changes
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // Handle search text changes here
    setState(() {
      // Optionally, you can perform any immediate actions based on the search text change
    });
  }

  void _onSearchSubmitted() {
    setState(() {
      _hasSearched = true;
    });
    final controller = Get.put(SearchFoodRestaurantController());
    controller.searchFood(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodRestaurantController());
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: Container(
            color: Tcolor.White,
          ),
        ),
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
                        color: Tcolor.Text,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextWidget(
                      controller: _searchController,
                      keyboardType: TextInputType.text,
                      hintText: "Search restaurant, food, drinks, etc",
                      onFieldSubmitted: (value) {
                        _onSearchSubmitted();
                      },
                      prefixIcon: GestureDetector(
                        onTap: _onSearchSubmitted,
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
                                setState(() {
                                  _hasSearched = false;
                                });
                              },
                              child: Icon(
                                HeroiconsSolid.xCircle,
                                size: 32.sp,
                                color: Tcolor.BORDER_Dark,
                              ),
                            )
                          : null,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : !_hasSearched
                      ? SizedBox(
                          height: height,
                          width: width,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 30.w, right: 30.w, top: 10.h),
                                  child: SizedBox(
                                    height: 280.h,
                                    width: width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        SizedBox(height: 40.h),
                                        Row(
                                          children: [
                                            const RecentSerarchCircleWidget(
                                              title: 'Grills',
                                            ),
                                            SizedBox(width: 10.w),
                                            const RecentSerarchCircleWidget(
                                              title: 'Plantain',
                                            ),
                                            SizedBox(width: 10.w),
                                            const RecentSerarchCircleWidget(
                                              title: 'Indomie',
                                            ),
                                            SizedBox(width: 10.w),
                                          ],
                                        ),
                                        SizedBox(height: 15.h),
                                        const RecentSerarchCircleWidget(
                                          title: 'Iya Kamo',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.w, bottom: 40.h),
                                  child: Divider(
                                    thickness: 25.h,
                                    color: Tcolor.BACKGROUND_Regaular,
                                  ),
                                ),
                                const CategorySearch(),
                              ],
                            ),
                          ),
                        )
                      : controller.foodSearch.isEmpty &&
                              controller.restaurantSearch.isEmpty
                          ? Container(
                              height: height,
                              width: width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    HeroiconsOutline.exclamationCircle,
                                    size: 100.sp,
                                    color: Tcolor.BORDER_Dark,
                                  ),
                                  SizedBox(height: 20.h),
                                  ReuseableText(
                                    title: "No results found",
                                    style: TextStyle(
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Tcolor.Text,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "Try searching for different keywords or check your spelling.",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Tcolor.Text,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : FoodRestaurantSearchResult(
                              foodResults: controller.foodSearch ?? [],
                              restaurantResults:
                                  controller.restaurantSearch ?? [],
                              text: _searchController.text,
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
