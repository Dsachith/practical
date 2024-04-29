/* import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:service/view_model/auth/auth_view_model.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_strings.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? email, password;
  bool _obscureText = true;
  bool isLoading = false;
  String buttonText = 'Sign In';
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      top: MediaQuery.of(context).size.height / 4.5,
                      right: 16.0,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign In",
                            style: TextStyle(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0))),
                        Form(
                          key: _key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 50),
                              Container(
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    hintText: 'Enter your email',
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
                              ),
                              const SizedBox(height: 30),
                              Container(
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
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
                                    prefixIcon: Icon(Icons.lock),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/forgot');
                                },
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Forgot Password? Reset Here",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 35),
                              Center(
                                child: Container(
                                  width: 320,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: isLoading
                                        ? Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            buttonText,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                          ),
                                    onPressed: () async {
                                      if (isLoading) return;
                                      setState(() => isLoading = true);
                                      if (_emailController.text.isEmpty ||
                                          _passwordController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please fill all the fields",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Color.fromARGB(
                                                255, 143, 27, 27),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        setState(() => buttonText = "Sign Up");
                                        setState(() => isLoading = false);
                                      } else if (_passwordController
                                              .text.length <
                                          6) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Password must be 9 characters long",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Color.fromARGB(
                                                255, 143, 27, 27),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        setState(() => buttonText = "Sign In");
                                        setState(() => isLoading = false);
                                      } else if (_key.currentState!
                                              .validate() ==
                                          false) {
                                        Fluttertoast.showToast(
                                            backgroundColor: Color.fromARGB(
                                                255, 143, 27, 27),
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                            msg: "Email is not valid");
                                        setState(() => buttonText = "Sign In");
                                        setState(() => isLoading = false);
                                      } else {
                                        context
                                            .read<AuthScreenViewModel>()
                                            .login(
                                                email = _emailController.text,
                                                password =
                                                    _passwordController.text);
                                        await Future.delayed(
                                          Duration(seconds: 2),
                                        );
                                        setState(() => isLoading = false);
                                      }
                                      print(email);
                                      print(password);
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/signup');
                                    },
                                    child: const Text(
                                      'SignUp',
                                      style: TextStyle(
                                        fontSize: 18,
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
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:practical/constants/app_color.dart';
import 'package:practical/view_model/auth/auth_view_model.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_strings.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? email, password;
  bool _obscureText = true;
  bool isLoading = false;
  String buttonText = 'Sign In';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(
                            fontSize: 12.sp, // Adjust the font size here
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(fontSize: 12.sp),
                            labelStyle: TextStyle(fontSize: 12.sp),
                            prefixIcon: Icon(Icons.email, size: 2.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color:
                                      Colors.amber), // Amber color when focused
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors
                                      .grey), // Light amber color when enabled but not focused
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            }
                            String pattern =
                                r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (email) => this.email = email,
                        ),
                        SizedBox(height: 3.h),
                        TextFormField(
                          controller: _passwordController,
                          style: TextStyle(
                            fontSize: 12.sp, // Adjust the font size here
                            fontWeight: FontWeight.w400,
                          ),
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 12.sp),
                            labelStyle: TextStyle(fontSize: 12.sp),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color:
                                      Colors.amber), // Amber color when focused
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
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
                                size: 2.h,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            prefixIcon: Icon(Icons.lock, size: 2.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgot');
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Forgot Password? Reset Here",
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(70.w, 6.h),
                          ),
                          child: isLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : Text(
                                  buttonText,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                          onPressed: () async {
                            if (isLoading) return;
                            setState(() => isLoading = true);
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              Fluttertoast.showToast(
                                msg: "Please fill all the fields",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                    Color.fromARGB(255, 143, 27, 27),
                                textColor: Colors.white,
                                fontSize: 16.sp,
                              );
                              setState(() => buttonText = "Sign Up");
                              setState(() => isLoading = false);
                            } else if (_passwordController.text.length < 6) {
                              Fluttertoast.showToast(
                                msg: "Password must be 9 characters long",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                    Color.fromARGB(255, 143, 27, 27),
                                textColor: Colors.white,
                                fontSize: 16.sp,
                              );
                              setState(() => buttonText = "Sign In");
                              setState(() => isLoading = false);
                            } else if (_key.currentState!.validate() == false) {
                              Fluttertoast.showToast(
                                backgroundColor:
                                    Color.fromARGB(255, 143, 27, 27),
                                textColor: Colors.white,
                                fontSize: 16.sp,
                                msg: "Email is not valid",
                              );
                              setState(() => buttonText = "Sign In");
                              setState(() => isLoading = false);
                            } else {
                              context.read<AuthScreenViewModel>().login(
                                    email = _emailController.text,
                                    password = _passwordController.text,
                                  );
                              await Future.delayed(
                                Duration(seconds: 2),
                              );
                              setState(() => isLoading = false);
                            }
                            print(email);
                            print(password);
                          },
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                Navigator.of(context).pushReplacementNamed(
                                  '/signup',
                                );
                              },
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
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
