import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practical/view/Services/fav_item_view.dart';
import 'package:practical/widget/appbar.dart';
import 'package:provider/provider.dart';
import 'package:practical/service/navigation_service.dart';
import 'package:practical/service/network_servce.dart';
import 'package:practical/view/auth/signin.dart';
import 'package:practical/view/auth/signup.dart';
import 'package:practical/widget/fav/fav_card.dart';
import 'package:sizer/sizer.dart';
import '../../constants/config.dart';
import '../../constants/enums.dart';
import '../../general/secure_storage.dart';
import '../../general/shared_preference_helper.dart';
import '../../injection.dart';

import '../../view_model/auth/auth_view_model.dart';
import '../../view_model/services/services_view_model.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  String? basicAuth;
  String? favId;
  bool isLogged = false;
  NavigationService navigationService = NavigationService();
  NetworkService networkService = NetworkService();

  String? visit_id;
  String? visits_user;

  @override
  void initState() {
    loadService();

    super.initState();
    loadService();
    print("helooooooooooo");

    SecureStorage.readValue('basicAuth').then((value) {
      setState(() {
        basicAuth = value;
      });
    });
    context.read<AuthScreenViewModel>().currentUser;
    SharedPreferenceHelper.getFromPref("token").then((value) {
      if (value != null) {
        setState(() {
          isLogged = true;
        });
      }
    });

    context.read<ServicesScreenViewModel>().loadFavList();
  }

  loadService() {
    context.read<ServicesScreenViewModel>().loadFavList();
  }

  @override
  Widget build(BuildContext context) {
    loadService();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        appBar: CustomAppBar(
          height: MediaQuery.of(context).size.width < 600 ? 75 : 150,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    width: 5.w,
                    height: 5.w,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 2.h,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Consumer<AuthScreenViewModel>(
              builder: (_, cu, __) {
                if (cu.currentUser == null || basicAuth == null) {
                  visits_user = "guest";
                  return Center(
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Text(
                              "My Favorites",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Text(
                              "Maintain your favorite vehicles list to reach them quickly.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3.5,
                          ),
                          Center(
                            child: Text(
                              "Hello User",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 97, 97, 97),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Please Sign In to the system to ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 97, 97, 97),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "add favorite vehicles.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 4.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SigninScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade700,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Center(
                                child: Container(
                                  height: 4.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade700,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/signin");
                      },
                    ),
                  );
                } else {
                  visits_user = cu.currentUser.user.id.toString();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Text(
                          "My Favorites",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Text(
                          "Maintain your favorite vehicles list to reach them quickly.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Consumer<ServicesScreenViewModel>(builder: (_, fl, __) {
                        if (fl.favModel!.favorites == null ||
                            fl.favModel == null ||
                            fl.favModel == [] ||
                            fl.favModel!.favorites == [] ||
                            fl.favModel!.favorites!.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 17.h,
                                ),
                                Text(
                                  "~Empty~",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 146, 146, 146),
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: fl.favModel!.favorites!.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return FavCard(
                                    name: fl.favModel!.favorites![index]
                                        .service!.name
                                        .toString(),
                                    date: fl.favModel!.favorites![index]
                                        .service!.createdAt
                                        .toString()
                                        .substring(1, 10),
                                    image: fl.favModel!.favorites![index]
                                                .service!.mainImage
                                                .toString() ==
                                            'null'
                                        ? ""
                                        : fl.favModel!.favorites![index]
                                            .service!.mainImage!.thumb
                                            .toString(),
                                    payType: fl.favModel!.favorites![index]
                                        .service!.payType
                                        .toString(),
                                    price: fl.favModel!.favorites![index]
                                        .service!.price
                                        .toString(),
                                    userName: fl.favModel!.favorites![index]
                                                .service!.user!.name
                                                .toString()
                                                .length >
                                            7
                                        ? fl.favModel!.favorites![index]
                                            .service!.user!.name
                                            .toString()
                                            .substring(0, 7)
                                        : fl.favModel!.favorites![index]
                                            .service!.user!.name
                                            .toString(),
                                    avatar: fl.favModel!.favorites![index]
                                        .service!.user!.avatar
                                        .toString(),
                                    onTap: () async {},
                                    onTap2: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => MultiProvider(
                                            providers: [
                                              ChangeNotifierProvider(
                                                create: (_) =>
                                                    sl<AuthScreenViewModel>(),
                                              ),
                                              ChangeNotifierProvider(
                                                create: (_) => sl<
                                                    ServicesScreenViewModel>(),
                                              ),
                                            ],
                                            child: FavItemViewScreen(
                                                visits_user:
                                                    visits_user.toString(),
                                                favorite: fl.favModel!
                                                    .favorites![index]),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        }
                      })
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
