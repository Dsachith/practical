import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:practical/constants/app_color.dart';
import 'package:practical/view_model/auth/auth_view_model.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordConfirmationController =
      TextEditingController();
  String? email, password, name, password_confirmation;
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool isLoading = false;
  String buttonText = 'Sign UP';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _key.currentState?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign Up",
                            style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0))),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: Form(
                                  key: _key,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 50),
                                      TextFormField(
                                        controller: _nameController,
                                        style: TextStyle(
                                          fontSize: 12
                                              .sp, // Adjust the font size here
                                          fontWeight: FontWeight.w400,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Name',
                                          hintText: 'Enter your Name',
                                          hintStyle: TextStyle(fontSize: 12.sp),
                                          labelStyle:
                                              TextStyle(fontSize: 12.sp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .amber), // Amber color when focused
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .grey), // Light amber color when enabled but not focused
                                          ),
                                          prefixIcon: Icon(Icons.person),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                        validator: (text) {
                                          if (text!.isEmpty) {
                                            return REQUIRED_FIELD;
                                          }
                                          return null;
                                        },
                                        onSaved: (email) => this.email = email,
                                      ),
                                      const SizedBox(height: 30),
                                      TextFormField(
                                        controller: _emailController,
                                        style: TextStyle(
                                          fontSize: 12
                                              .sp, // Adjust the font size here
                                          fontWeight: FontWeight.w400,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          hintText: 'Enter your email',
                                          hintStyle: TextStyle(fontSize: 12.sp),
                                          labelStyle:
                                              TextStyle(fontSize: 12.sp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .amber), // Amber color when focused
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .grey), // Light amber color when enabled but not focused
                                          ),
                                          prefixIcon: Icon(Icons.email),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your email address';
                                          }
                                          // Use a regular expression for basic email validation
                                          String pattern =
                                              r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b';
                                          RegExp regex = RegExp(pattern);
                                          if (!regex.hasMatch(value)) {
                                            return 'Please enter a valid email address';
                                          }
                                          return null; // Return null if the validation is successful
                                        },
                                        onSaved: (email) => this.email = email,
                                      ),
                                      const SizedBox(height: 30),
                                      TextFormField(
                                        controller: _passwordController,
                                        obscureText: _obscureText,
                                        style: TextStyle(
                                          fontSize: 12
                                              .sp, // Adjust the font size here
                                          fontWeight: FontWeight.w400,
                                        ),
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .amber), // Amber color when focused
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .grey), // Light amber color when enabled but not focused
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                          ),
                                          labelText: 'Password',
                                          hintText: 'Enter your password',
                                          hintStyle: TextStyle(fontSize: 12.sp),
                                          labelStyle:
                                              TextStyle(fontSize: 12.sp),
                                          prefixIcon: Icon(Icons.lock),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      TextFormField(
                                        controller:
                                            _passwordConfirmationController,
                                        style: TextStyle(
                                          fontSize: 12
                                              .sp, // Adjust the font size here
                                          fontWeight: FontWeight.w400,
                                        ),
                                        obscureText: _obscureText1,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .amber), // Amber color when focused
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .grey), // Light amber color when enabled but not focused
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscureText1
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _obscureText1 = !_obscureText1;
                                              });
                                            },
                                          ),
                                          labelText: 'Password Confirmation',
                                          hintText: 'Enter your password Again',
                                          hintStyle: TextStyle(fontSize: 12.sp),
                                          labelStyle:
                                              TextStyle(fontSize: 12.sp),
                                          prefixIcon: Icon(Icons.lock),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return REQUIRED_FIELD;
                                          }
                                          if (value !=
                                              _passwordController.text) {
                                            return 'Password does not match';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 35),
                                      Center(
                                        child: Container(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: buttonColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              minimumSize: Size(70.w, 6.h),
                                            ),
                                            child: isLoading
                                                ? Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  )
                                                : Text(
                                                    buttonText,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                            onPressed: () async {
                                              if (isLoading) return;
                                              setState(() => isLoading = true);
                                              if (_emailController
                                                      .text.isEmpty ||
                                                  _passwordController
                                                      .text.isEmpty) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Please fill all the fields",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 143, 27, 27),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                setState(() =>
                                                    buttonText = "Sign Up");
                                                setState(
                                                    () => isLoading = false);
                                              } else if (_passwordController
                                                      .text.length <
                                                  8) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Password must be 9 characters long",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 143, 27, 27),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                setState(() =>
                                                    buttonText = "Sign Up");
                                                setState(
                                                    () => isLoading = false);
                                              } else if (_passwordController
                                                      .text !=
                                                  _passwordConfirmationController
                                                      .text) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Password dose not match",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 143, 27, 27),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                setState(() =>
                                                    buttonText = "Sign Up");
                                                setState(
                                                    () => isLoading = false);
                                              } else if (_nameController
                                                  .text.isEmpty) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Please fill all the fields",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 143, 27, 27),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                setState(() =>
                                                    buttonText = "Sign Up");
                                                setState(
                                                    () => isLoading = false);
                                              } else if (_key.currentState!
                                                      .validate() ==
                                                  false) {
                                                Fluttertoast.showToast(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 143, 27, 27),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0,
                                                    msg: "Email is not valid");
                                                setState(() =>
                                                    buttonText = "Sign In");
                                                setState(
                                                    () => isLoading = false);
                                              } else {
                                                context
                                                    .read<AuthScreenViewModel>()
                                                    .register(
                                                      name =
                                                          _nameController.text,
                                                      email =
                                                          _emailController.text,
                                                      password =
                                                          _passwordController
                                                              .text,
                                                      password_confirmation =
                                                          _passwordConfirmationController
                                                              .text,
                                                    );
                                                await Future.delayed(
                                                    Duration(seconds: 2));
                                                setState(
                                                    () => isLoading = false);
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Already have an account?',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      '/signin');
                                            },
                                            child: Text(
                                              'SignIn',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
