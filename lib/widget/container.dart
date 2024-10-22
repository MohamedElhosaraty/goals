import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateContainer extends StatelessWidget {
  const CreateContainer({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(20)
      ),
      child:  Center(
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 15.sp
          ),
        ),
      ),
    );

  }
}
