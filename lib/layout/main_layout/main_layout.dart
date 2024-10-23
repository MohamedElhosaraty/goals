import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goals/layout/cubit/main_cubit.dart';
import 'package:goals/layout/main_layout/ui/floating_action_button.dart';
import 'package:goals/layout/main_layout/ui/goal_item.dart';
import 'package:goals/localization/localization_methods.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              tr(context, "GOALS"),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: Colors.white,
                fontSize: 37.sp,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  MainCubit.get(context).deleteDataBase();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.green,
                  size: 30,
                ),
              ),
              DropdownButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                items: const [
                  DropdownMenuItem(
                    value: "English",
                    child: Text("English"),
                  ),
                  DropdownMenuItem(
                    value: "Arabic",
                    child: Text("عربى"),
                  ),
                ],
                onChanged: (item) {
                  if (item == "English") {
                    MainCubit.get(context).toEnglish();
                  } else if (item == "Arabic") {
                    MainCubit.get(context).toArabic();
                    print(MainCubit.get(context).lang);
                  }
                },
              )
            ],
            backgroundColor: Colors.blue[900],
          ),
          body: ListView.builder(
              itemCount: MainCubit.get(context).goalsList.length,
              itemBuilder: (context, index) {
                return GoalItem(
                  id: MainCubit.get(context).goalsList[index]['id'],
                  goalName: MainCubit.get(context).goalsList[index]['name'],
                  dataCreate: MainCubit.get(context).goalsList[index]['data'] ?? '20',
                  timeCreate: MainCubit.get(context).goalsList[index]['time'] ?? '20',
                );
              }),
          floatingActionButton: const CreateFloatingActionButton(),
        );
      },
    );
  }
}
