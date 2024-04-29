import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({super.key});

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth;
        double cardHeight = 25.0.h;
        return Container(
          width: cardWidth,
          height: cardHeight,
          padding: EdgeInsets.zero,
          child: ListView.builder(
            itemCount: 3,
            physics:
                NeverScrollableScrollPhysics(), // Choose a number of shimmer items to display
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                ),
                title: Container(
                  width: double.infinity,
                  height: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                ),
                subtitle: Container(
                  width: 200.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        );
      },
      /*    child: Container(
        width: double.infinity,
        height: 150,
        child: ListView.builder(
          itemCount: 5, // Choose a number of shimmer items to display
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 48.0,
                height: 48.0,
                color: Colors.white,
              ),
              title: Container(
                width: double.infinity,
                height: 16.0,
                color: Colors.white,
              ),
              subtitle: Container(
                width: 200.0,
                height: 16.0,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    */
    );
  }
}
