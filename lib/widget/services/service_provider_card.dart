import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ServiceProviderCard extends StatelessWidget {
  final String image;
  final String description;
  final String date;
  final String price;
  final VoidCallback onTap;
  final String priceType;

  ServiceProviderCard({
    required this.image,
    required this.description,
    required this.date,
    required this.price,
    required this.priceType,
    required this.onTap,
    super.key,
  });

  final List<String> items = [
    'View',
    'Edit',
    'Delete',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 14.h,
        decoration: BoxDecoration(
          color: Colors.white,
          //   borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        child: Row(
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
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LKR ${price} ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          priceType == 'monthly'
                              ? '/km'
                              : priceType == 'weekly'
                                  ? '/km'
                                  : priceType == 'hourly'
                                      ? '/km'
                                      : priceType == 'daily'
                                          ? '/daily'
                                          : '/km',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ), */
                ],
              ),
            ),
          ],
        ),
      ),
    );

    /*  return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 18.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amberAccent,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 14,
            //  right: 15,
            top: 15,
            bottom: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 11.h,
                    height: 11.h /* 105 */,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      //   color: Color.fromARGB(255, 211, 211, 211),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        /*  loadingBuilder: (context, child, loadingProgress) {
                                return CircularProgressIndicator();
                              }, */
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          description.toString().length > 50
                              ? description.toString().substring(0, 49) + "..."
                              : description.toString(),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "P/S: LKR ${price} ",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            priceType == 'monthly'
                                ? '/m'
                                : priceType == 'weekly'
                                    ? '/w'
                                    : priceType == 'hourly'
                                        ? '/h'
                                        : priceType == 'daily'
                                            ? '/d'
                                            : '/h',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        date.substring(0, 10),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  */
  }
}
