// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:eshop/helper/constance.dart';
import 'package:eshop/helper/enum.dart';
import 'package:eshop/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

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
              height: 50,
            ),
            RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: delivery,
              onChanged: (Delivery? value) {
                setState(() {
                  delivery = value!;
                });
              },
              title: CustomText(
                text: "Standard Delivery",
                fontsize: 26,
              ),
              subtitle: CustomText(
                text: "Order will be delivered between 3-5 bussines days ",
                fontsize: 18,
              ),
              activeColor: primaryColor,
            ),
            SizedBox(
              height: 50,
            ),
            RadioListTile<Delivery>(
              value: Delivery.NextDayDelivery,
              groupValue: delivery,
              onChanged: (Delivery? value) {
                setState(() {
                  delivery = value!;
                });
              },
              title: CustomText(
                text: "Next Day Delivery",
                fontsize: 26,
              ),
              subtitle: CustomText(
                text:
                    "Place your order before 6pm and your items will be delivered the next day",
                fontsize: 18,
              ),
              activeColor: primaryColor,
            ),
            SizedBox(
              height: 50,
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
                fontsize: 26,
              ),
              subtitle: CustomText(
                text:
                    "Pick a particular date from the calendar and order will be delivered on selected date",
                fontsize: 18,
              ),
              activeColor: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
