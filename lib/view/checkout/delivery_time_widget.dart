// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:eshop/helper/constance.dart';
import 'package:eshop/helper/enum.dart';
import 'package:eshop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

Delivery delivery = Delivery.StandardDelivery;

class _DeliveryTimeState extends State<DeliveryTime> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: delivery,
              onChanged: (Delivery? value) {
                setState(() {
                  delivery = value!;
                });
              },
              title: CustomText(text: "Standard Delivery", fontsize: 24.sp),
              subtitle: Text(
                 "Order will be delivered between 3-5 bussines days ",
                style:  TextStyle(color: Colors.grey[600],fontSize: 18.sp),
              ),
              activeColor: primaryColor,
            ),
            SizedBox(
              height: 30.h,
            ),
            RadioListTile<Delivery>(
              value: Delivery.NextDayDelivery,
              groupValue: delivery,
              onChanged: (Delivery? value) {
                setState(() {
                  delivery = value!;
                });
              },
              title: CustomText(text: "Next Day Delivery", fontsize: 24.sp),
              subtitle: Text(
                  "Place your order before 6pm and your items will be delivered the next day",
                  style: TextStyle(color: Colors.grey[600], fontSize: 18.sp)),
              activeColor: primaryColor,
            ),
            SizedBox(
              height: 30.h,
            ),
            RadioListTile<Delivery>(
              value: Delivery.NominatedDelivery,
              groupValue: delivery,
              onChanged: (Delivery? value) {
                setState(() {
                  delivery = value!;
                });
              },
              title: CustomText(
                text: "Nominated Delivery",
                fontsize: 24.sp,
              ),
              subtitle: Text(
                "Pick a particular date from the calendar and order will be delivered on selected date",
                style: TextStyle(color: Colors.grey[600], fontSize: 18.sp),
              ),
              activeColor: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
