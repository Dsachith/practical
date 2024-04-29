/* import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ServicesCard extends StatelessWidget {
  final String image;
  final String description;
  final String status;
  final String price;
  final String priceType;
  final VoidCallback onTap;
  final PopupMenuButton popupMenuButton;

  ServicesCard({
    required this.image,
    required this.description,
    required this.status,
    required this.price,
    required this.priceType,
    required this.onTap,
    required this.popupMenuButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 23.h,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18.h,
            height: 23.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: 19.h,
                height: 19.h,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 2.w),
                    child: Text(
                      description,
                      maxLines: 5,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Row(
                    children: [
                      Text(
                        "Rs ",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        priceType == 'weekly'
                            ? '/w'
                            : priceType == 'monthly'
                                ? '/m'
                                : priceType == 'daily'
                                    ? '/d'
                                    : priceType == 'hourly'
                                        ? '/h'
                                        : '/h',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w, top: 1.h),
                  child: Container(
                    width: 32.w,
                    height: 4.7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: status == "approved"
                          ? Colors.amber
                          : Color.fromARGB(255, 248, 236, 225),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          status.toUpperCase(),
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                            color: status == "approved"
                                ? Colors.white
                                : Color.fromARGB(255, 245, 167, 94),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Visibility(
                    visible: status == "waiting for payment" ? true : false,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "Pay Now",
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 3.w,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(child: popupMenuButton),
        ],
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'View':
        print('View Customer');
        break;
      case 'Edit':
        print('Edit Customer');

        break;
      case 'Delete':
        print('Delete Customer');

        break;
    }
  }
}
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class ServicesCard extends StatelessWidget {
  final String image;
  final String description;
  final String status;
  final String price;
  final String priceType;
  final VoidCallback onTap;
  final VoidCallback onTap2;
  final PopupMenuButton popupMenuButton;
  final String payType;
  final String date;

  ServicesCard({
    required this.image,
    required this.description,
    required this.status,
    required this.price,
    required this.priceType,
    required this.onTap,
    required this.onTap2,
    required this.popupMenuButton,
    required this.payType,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cleanedPrice = price.replaceAll(',', '');

    double priceDouble = double.parse(cleanedPrice); // Convert price to double

    String formattedPrice = NumberFormat.currency(
      symbol: 'Rs ', // Add currency symbol here
      decimalDigits: 0, // Specify the number of decimal digits
    ).format(priceDouble);
    return GestureDetector(
      onTap: onTap2,
      child: Container(
        width: double.infinity,
        height: 15.h,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          //   borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color.fromARGB(255, 75, 75, 75),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 21.h,
                  height: 15.h,
                  child: ClipRRect(
                    //  borderRadius: BorderRadius.circular(12),
                    child: image.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                            width: 14.h,
                            height: 14.h,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        : Shimmer.fromColors(
                            baseColor: Colors.amber[200]!,
                            highlightColor: Colors.amber[100]!,
                            child: Container(
                              color: Colors.amber,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 5),
                  child: Container(
                    width: 4.h,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(child: popupMenuButton),
                  ),
                ),
              ],
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7.h,
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.h, left: 1.w),
                      child: Text(
                        description,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Row(
                      children: [
                        Text(
                          formattedPrice,
                          style: TextStyle(
                            fontSize: 11.sp, // Adjust font size as needed
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 196, 141, 0),
                          ),
                        ),
                        Text(
                          payType == 'weekly'
                              ? '/km'
                              : payType == 'monthly'
                                  ? '/km'
                                  : payType == 'daily'
                                      ? '/daily'
                                      : payType == 'hourly'
                                          ? '/km'
                                          : '/km',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 196, 141, 0),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            date,
                            style: GoogleFonts.openSansCondensed(
                              fontSize: 7.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 112, 112, 112),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Row(
                      children: [
                        Text(
                          "Status : ",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600),
                        ),
                        Text(
                          "$status",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: status == "approved"
                                ? const Color.fromARGB(255, 255, 191, 0)
                                : Colors.red,
                          ),
                        ),
                        SizedBox(width: 1.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'View':
        print('View Customer');
        break;
      case 'Edit':
        print('Edit Customer');

        break;
      case 'Delete':
        print('Delete Customer');

        break;
    }
  }
}
