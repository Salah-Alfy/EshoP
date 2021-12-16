// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, unrelated_type_equality_checks

import 'package:eshop/helper/constance.dart';
import 'package:eshop/view/widgets/custom_list_tile.dart';
import 'package:eshop/view/widgets/custom_text.dart';
import 'package:eshop/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(
                  top: AppBar().preferredSize.height,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .25.w,
                              height: MediaQuery.of(context).size.width * .25.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  image: DecorationImage(
                                      image: controller.userModel == null ||
                                              controller.userModel!.pic ==
                                                  "default" ||
                                              controller.userModel!.pic == ""
                                          ? AssetImage("assets/images/chai.png")
                                          : NetworkImage(
                                                  controller.userModel!.pic)
                                              as ImageProvider,
                                      fit: BoxFit.fill)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.userModel!.name,
                                  fontsize: 32.sp,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: controller.userModel!.email,
                                  fontsize:16.sp,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomListTile(
                          text: "Edit Profile",
                          leading: "assets/menu/Icon_Edit-Profile.png",
                          trailing: Icon(Icons.arrow_forward_ios),
                          onPressed: () {}),
                      SizedBox(height: 20.h),
                      CustomListTile(
                          text: "Shipping Adress",
                          leading: "assets/menu/Icon_Location.png",
                          trailing: Icon(Icons.arrow_forward_ios),
                          onPressed: () {}),
                      SizedBox(height: 20.h),
                      CustomListTile(
                          text: "Order History",
                          leading: "assets/menu/Icon_History.png",
                          trailing: Icon(Icons.arrow_forward_ios),
                          onPressed: () {}),
                      SizedBox(height: 20.h),
                      CustomListTile(
                          text: "Cards",
                          leading: "assets/menu/Icon_Payment.png",
                          trailing: Icon(Icons.arrow_forward_ios),
                          onPressed: () {}),
                      SizedBox(height: 20.h),
                      CustomListTile(
                          text: "Notifications",
                          leading: "assets/menu/Icon_Alert.png",
                          trailing: Icon(Icons.arrow_forward_ios),
                          onPressed: () {}),
                      SizedBox(height: 20.h),
                      CustomListTile(
                          text: "Log Out",
                          leading: "assets/menu/Icon_Exit.png",
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.transparent,
                          ),
                          onPressed: () {
                            controller.signOut();
                          }),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
