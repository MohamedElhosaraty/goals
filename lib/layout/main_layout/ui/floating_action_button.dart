import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goals/layout/cubit/main_cubit.dart';
import 'package:goals/localization/localization_methods.dart';
import 'package:goals/widget/button.dart';
import 'package:goals/widget/container.dart';
import 'package:goals/widget/text_form_field.dart';

class CreateFloatingActionButton extends StatelessWidget {
  const CreateFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: SizedBox(
                height: 150.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     CreateContainer(
                      text: tr(context, "Write your Goals"),
                    ),
                    10.verticalSpace,
                    CreateTextFormField(
                      controller: MainCubit.get(context).addTextController,
                      text: tr(context, "Write Here....."),
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CreateElevatedButton(
                            text: tr(context, "ADD"),
                            function: (){
                              MainCubit.get(context).insetData(
                                  MainCubit.get(context)
                                      .addTextController
                                      .text
                                      .toString());
                              MainCubit.get(context)
                                  .addTextController
                                  .text = '';
                              MainCubit.get(context).getData();
                              Navigator.pop(context);
                            },
                            colorButton: Colors.blue,
                          ),
                        ),
                        5.horizontalSpace,
                        Expanded(
                          child: CreateElevatedButton(
                            text: tr(context, "Cancel"),
                            function: () {
                              MainCubit.get(context)
                                  .addTextController
                                  .text = '';
                              Navigator.pop(context);
                            },
                            colorButton: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),);
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 33.sp,
      ),
    );
  }
}
