import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practical/widget/services/service_provider_card.dart';
import 'package:provider/provider.dart';
import 'package:practical/general/secure_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../injection.dart';
import '../../model/fav_model.dart';

import '../../view_model/auth/auth_view_model.dart';
import '../../view_model/services/services_view_model.dart';

class FavItemViewScreen extends StatefulWidget {
  final Favorite favorite;
  final String visits_user;
  const FavItemViewScreen(
      {required this.visits_user, required this.favorite, super.key});

  @override
  State<FavItemViewScreen> createState() => _FavItemViewScreenState();
}

class _FavItemViewScreenState extends State<FavItemViewScreen> {
  String id = '';
  String? image;
  String? visits_user;
  String? visit_id;
  String? type = "service";
  String? basicAuth;
  _fetchBasicAuth() async {
    try {
      var value = await SecureStorage.readValue('basicAuth');
      setState(() {
        basicAuth = value;
      });
    } catch (e) {
      print('Error retrieving basicAuth: $e');
    }
    print("basic auth $basicAuth");
  }

  _launchWhatsApp() async {
    // Change the number to the desired phone number
    String phoneNumber =
        widget.favorite.service!.user!.metaData!.mobile!.mobile1.toString();
    // The 'https://wa.me/' is the base URL for WhatsApp
    String whatsappUrl = 'https://wa.me/$phoneNumber';

    // Check if the WhatsApp URL can be launched
    if (await canLaunch(whatsappUrl)) {
      // Launch the WhatsApp URL
      await launch(whatsappUrl);
    } else {
      // Handle error
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  void initState() {
    image = widget.favorite.service!.mainImage!.url.toString();

    super.initState();
    _fetchBasicAuth();
    //context.read<ServicesScreenViewModel>().loadServiceProvider(widget.favorite.userId.toString());
    visits_user = widget.visits_user.toString() == "0" ||
            widget.visits_user.isEmpty ||
            widget.visits_user == null
        ? "guest"
        : widget.visits_user;
    visit_id = widget.favorite.service!.id.toString();
   
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: '${widget.favorite.service!.user!.email.toString()}',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                width: 10.w,
                height: 10.w,
                //  margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    size: 2.5.h,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            /* GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Back',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), */
            Spacer(),
            Text(
              'Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: image.toString(),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.favorite.service!.name.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Price:",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "LKR",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            widget.favorite.service!.price.toString(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            '/',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            widget.favorite.service!.payType.toString() ==
                                    'monthly'
                                ? 'm'
                                : widget.favorite.service!.payType.toString() ==
                                        'weekly'
                                    ? 'w'
                                    : widget.favorite.service!.payType
                                                .toString() ==
                                            'daily'
                                        ? 'd'
                                        : widget.favorite.service!.payType
                                                    .toString() ==
                                                'hourly'
                                            ? 'h'
                                            : 'd',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        widget.favorite.service!.description == null
                            ? ''
                            : widget.favorite.service!.description.toString(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Contact Information.",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "WhatsApp: ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          widget.favorite.service!.user == null
                              ? Text(
                                  "Not Provided",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                )
                              : GestureDetector(
                                  child: Text(
                                    widget.favorite.service!.user == null ||
                                            widget.favorite.service!.user!
                                                    .metaData
                                                    .toString() ==
                                                'null' ||
                                            widget.favorite.service!.user!
                                                    .metaData ==
                                                null ||
                                            widget.favorite.service!.user!
                                                    .metaData!.mobile ==
                                                null ||
                                            widget.favorite.service!.user!
                                                    .metaData!.mobile!.mobile1
                                                    .toString() ==
                                                'null'
                                        ? "Not Provided"
                                        : widget.favorite.service!.user!
                                            .metaData!.mobile!.mobile1
                                            .toString()
                                            .replaceRange(3, 4, "****"),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          widget.favorite.service!.user ==
                                                      null ||
                                                  widget.favorite.service!.user!
                                                          .metaData
                                                          .toString() ==
                                                      'null' ||
                                                  widget.favorite.service!.user!
                                                          .metaData ==
                                                      null ||
                                                  widget.favorite.service!.user!
                                                          .metaData!.mobile ==
                                                      null ||
                                                  widget
                                                          .favorite
                                                          .service!
                                                          .user!
                                                          .metaData!
                                                          .mobile!
                                                          .mobile1
                                                          .toString() ==
                                                      'null'
                                              ? Colors.grey
                                              : Colors.red,
                                    ),
                                  ),
                                  onTap: () async {
                                    _launchWhatsApp();
                                  },
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "Phone: ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Text(
                                  widget.favorite.service!.user == null ||
                                          widget.favorite.service!.user!
                                                  .metaData
                                                  .toString() ==
                                              'null' ||
                                          widget.favorite.service!.user!
                                                  .metaData ==
                                              null ||
                                          widget.favorite.service!.user!
                                                  .metaData!.mobile ==
                                              null ||
                                          widget.favorite.service!.user!
                                                  .metaData!.mobile!.mobile1
                                                  .toString() ==
                                              'null'
                                      ? "Not Provided"
                                      : widget.favorite.service!.user!.metaData!
                                          .mobile!.mobile1
                                          .toString()
                                          .replaceRange(3, 4, "****"),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: widget
                                                    .favorite.service!.user ==
                                                null ||
                                            widget.favorite.service!.user!
                                                    .metaData
                                                    .toString() ==
                                                'null' ||
                                            widget.favorite.service!.user!
                                                    .metaData ==
                                                null ||
                                            widget.favorite.service!.user!
                                                    .metaData!.mobile ==
                                                null ||
                                            widget.favorite.service!.user!
                                                    .metaData!.mobile!.mobile1
                                                    .toString() ==
                                                'null'
                                        ? Colors.grey
                                        : Colors.red,
                                  ),
                                ),
                                onTap: () async {
                                  setState(() {
                                    _makePhoneCall(
                                        'tel:${widget.favorite.service!.user!.metaData!.mobile!.mobile1.toString()}');
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                ",",
                                style: TextStyle(color: Colors.blue),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                child: Text(
                                  widget.favorite.service!.user == null ||
                                          widget.favorite.service!.user!
                                                  .metaData
                                                  .toString() ==
                                              'null' ||
                                          widget.favorite.service!.user!
                                                  .metaData ==
                                              null ||
                                          widget.favorite.service!.user!
                                                  .metaData!.mobile ==
                                              null ||
                                          widget.favorite.service!.user!
                                                  .metaData!.mobile!.mobile2
                                                  .toString() ==
                                              'null'
                                      ? "Not Provided"
                                      : widget.favorite.service!.user!.metaData!
                                          .mobile!.mobile2
                                          .toString()
                                          .replaceRange(3, 4, "****"),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: widget
                                                    .favorite.service!.user ==
                                                null ||
                                            widget.favorite.service!.user!
                                                    .metaData
                                                    .toString() ==
                                                'null' ||
                                            widget.favorite.service!.user!
                                                    .metaData ==
                                                null ||
                                            widget.favorite.service!.user!
                                                    .metaData!.mobile ==
                                                null ||
                                            widget.favorite.service!.user!
                                                    .metaData!.mobile!.mobile2
                                                    .toString() ==
                                                'null'
                                        ? Colors.grey
                                        : Colors.red,
                                  ),
                                ),
                                onTap: () async {
                                  setState(() {
                                    _makePhoneCall(
                                        'tel:${widget.favorite.service!.user!.metaData!.mobile!.mobile2.toString()}');
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Color.fromARGB(255, 212, 212, 212),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Text(
                        "Vehicle Owner",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 15.w,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  shape: BoxShape
                                      .circle, // Use BoxShape.circle to make it circular
                                ),
                                child: ClipOval(
                                  child: widget
                                              .favorite.service!.user?.avatar !=
                                          null
                                      ? Image.network(
                                          widget.favorite.service!.user!.avatar!
                                              .toString(),
                                          fit: BoxFit
                                              .cover, // Ensure the image covers the entire container
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Center(
                                              child: Icon(Icons.error),
                                            );
                                          },
                                        )
                                      : Center(
                                          child: Icon(Icons
                                              .error)), // Handle if the avatar URL is null
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  widget.favorite.service!.user == null
                                      ? Text(
                                          "Not Provided",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : Text(
                                          widget.favorite.service!.user!.name
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      widget.favorite.service!.user == null
                                          ? Text(
                                              "Not Provided",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            )
                                          : Text(
                                              "Age: ${widget.favorite.service!.user!.metaData!.age.toString()}Y",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      widget.favorite.service!.user == null
                                          ? Text(
                                              "Not Provided",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                            )
                                          : Text(
                                              "Gender: ${widget.favorite.service!.user!.metaData!.gender.toString() == "null" ? "Not Provided" : widget.favorite.service!.user!.metaData!.gender.toString()}",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                                color: widget
                                                            .favorite
                                                            .service!
                                                            .user!
                                                            .metaData!
                                                            .gender
                                                            .toString() ==
                                                        "null"
                                                    ? Colors.grey
                                                    : Colors.black,
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
           
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                /* border: Border(
                  top: BorderSide(
                    color: Color.fromARGB(255, 197, 197, 197),
                    width: 2.0,
                  ),
                ), */
              ),
              child: Row(
                children: [
                  // Left side for the price section
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.green.shade500,
                              Color.fromARGB(255, 1, 121, 55),
                            ],
                          ),
                          // borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "WhatsApp",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        setState(() {
                          _launchWhatsApp();
                        });
                      },
                    ),
                  ),
                  // Right side for the "Call Now" button
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.red,
                              Color.fromARGB(255, 248, 120, 110),
                            ],
                          ),
                          // borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Call Now",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        setState(() {
                          _makePhoneCall(
                              'tel:${widget.favorite.service!.user!.metaData!.mobile!.mobile1.toString()}');
                        });
                      },
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
}
