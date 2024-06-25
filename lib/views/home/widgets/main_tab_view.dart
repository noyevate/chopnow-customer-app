// ignore_for_file: must_be_immutable

import 'package:chopnow_new_customer_app/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:chopnow_new_customer_app/views/common/color_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MainTabView extends StatefulWidget {
   MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
   int selectedTab = 2;

  PageStorageBucket storageBucket = PageStorageBucket();

  Widget selectPageView = const Hompage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView,),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        height: 96.h,
        width: 96.w,
        child: FloatingActionButton(
          
          onPressed: () {
            if (selectedTab !=2){
              selectedTab = 2;
              selectPageView = const Hompage();
            } 
            if(mounted) {
              setState(() {});
            }
            else {
        
            }
          },
          backgroundColor: selectedTab == 2 ? Tcolor.Primary : Tcolor.Secondary ,
          shape: const CircleBorder(),
          child:  IconButton(onPressed: null, icon: SvgPicture.asset("assets/img/appbar_avatar.svg" ,)),
        
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Tcolor.PRIMARY_S4,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [],
        ),
      ),
      
      
    );
  }
}

