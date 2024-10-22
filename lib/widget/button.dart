import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateElevatedButton extends StatelessWidget {
  const CreateElevatedButton({super.key, required this.text,required  this.function, required this.colorButton,});

  final String text;
  final void Function()? function ;
  final Color colorButton;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            WidgetStateProperty.all(colorButton)),
        onPressed: function,
        child:  Text(text,style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp
        ),));
  }
}
