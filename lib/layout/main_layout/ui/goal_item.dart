import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goals/layout/cubit/main_cubit.dart';
import 'package:goals/localization/localization_methods.dart';
import 'package:goals/widget/button.dart';
import 'package:goals/widget/container.dart';
import 'package:goals/widget/text_form_field.dart';

class GoalItem extends StatelessWidget {
  const GoalItem(
      {super.key,
      required this.goalName,
      required this.id,
      required this.dataCreate,
        required this.timeCreate,
      });

  final int id;
  final String goalName;
  final String dataCreate;
  final String timeCreate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
              height: 200.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CreateContainer(
                    text: tr(context, "Editing Goals"),
                  ),
                  10.verticalSpace,
                  CreateTextFormField(
                    controller: MainCubit.get(context).addTextController,
                    text: tr(context, "Editing Now...."),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CreateElevatedButton(
                      text: tr(context, "Editing"),
                      function: () {
                        MainCubit.get(context).updateData(
                            MainCubit.get(context).addTextController.text, id);
                        MainCubit.get(context).addTextController.text = '';
                        MainCubit.get(context).getData();
                        Navigator.pop(context);
                      },
                      colorButton: Colors.yellow[700]!,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CreateElevatedButton(
                          text: tr(context, "Remove"),
                          function: () {
                            MainCubit.get(context).removeData(id);
                            MainCubit.get(context).getData();
                            Navigator.pop(context);
                          },
                          colorButton: Colors.red,
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: CreateElevatedButton(
                          text: tr(context, "Cancel"),
                          function: () {
                            MainCubit.get(context).addTextController.text = '';
                            Navigator.pop(context);
                          },
                          colorButton: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 120.h,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
          gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.blue,
            Colors.blue[900]!,
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    MainCubit.get(context).lang == "ar"
                        ? goalName
                        : "$id : $goalName",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      MainCubit.get(context).removeData(id);
                      MainCubit.get(context).getData();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    )),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                Text(
                  dataCreate,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white38,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  timeCreate,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white38,
                    fontWeight: FontWeight.w700,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
