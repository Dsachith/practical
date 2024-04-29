import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class FavCard extends StatelessWidget {
  final String name;
  final String image;
  final String payType;
  final String price;
  final String userName;
  final VoidCallback onTap;
  final VoidCallback onTap2;
  final String avatar;
  final String date;

  const FavCard({
    required this.name,
    required this.image,
    required this.payType,
    required this.price,
    required this.onTap,
    required this.userName,
    required this.avatar,
    required this.onTap2,
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
            color: const Color.fromARGB(255, 206, 206, 206),
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
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 1.w, right: 1.5.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formattedPrice,
                          style: TextStyle(
                            fontSize: 11.sp, // Adjust font size as needed
                            fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 196, 141, 0),
                          ),
                        ),
                        Spacer(),
                        Text(
                          date,
                          style: GoogleFonts.openSansCondensed(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 112, 112, 112),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
