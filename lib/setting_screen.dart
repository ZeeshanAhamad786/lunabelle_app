
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunabelle_app/sized_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Heyy Babyy",
          style: TextStyle(
            fontSize: 16.px,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xffF6F8FB),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.px),
                      //color: Color(0xffBDB4FE),
                      color: Colors.blue
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(98),
                        child: Image.asset(
                          "assets/png/dp_1.png",
                          width: 20.w,
                          height: 10.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      getVerticalSpace( 1.h),
                      Text(
                        "Mohsin",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.px,
                        ),
                      ),
                      getVerticalSpace( 1.h),
                      // CustomElevatedButtonN(
                      //   text: "Edit",
                      //   onPressed: (){},
                      //   borderRadius: BorderRadius.circular(4.px),
                      //   fontSize: 12.px,
                      //   height: 3.5.h,
                      //   width: MediaQuery.sizeOf(context).width * 0.18,
                      //   horizontalPadding: 0,
                      // )
                    ],
                  )
              ),
              getVerticalSpace( 2.h),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 5.5.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.px),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            offset: Offset(0, 0.1),
                            spreadRadius: 1,
                            color: Colors.grey
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 3.w,),
                            child: SvgPicture.asset(
                              "assets/svg/settings_white_icon.svg",
                              colorFilter: ColorFilter.mode(
                                Colors.blue,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          getHorizontalSpace( 3.w),
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400
                            ),
                            //  style: AppTextStyles.regularBody,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 2.5.h),
                      )
                    ],
                  ),
                ),
              ),
              getVerticalSpace(1.5.h),
              GestureDetector(
                onTap: (){
                  // Get.to(() => NewsScreen());
                },
                child: Container(
                  height: 5.5.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.px),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            offset: Offset(0, 0.1),
                            spreadRadius: 1,
                            color: Colors.grey,
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 3.w,),
                            child: SvgPicture.asset(
                              "assets/svg/news_icon.svg",
                            ),
                          ),
                          getHorizontalSpace( 3.w),
                          Text(
                            'News',
                            style: TextStyle(
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400
                            ),
                            //  style: AppTextStyles.regularBody,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 2.5.h),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
