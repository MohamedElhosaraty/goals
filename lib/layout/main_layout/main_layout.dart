import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goals/layout/cubit/main_cubit.dart';
import 'package:goals/layout/main_layout/ui/floating_action_button.dart';
import 'package:goals/layout/main_layout/ui/goal_item.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..initSqfLite()..getData(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "GOALS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                  color: Colors.white,
                  fontSize: 37.sp,
                ),
              ),
              backgroundColor: Colors.blue[900],
            ),
            body: ListView.builder(
                itemCount: MainCubit.get(context).goalsList.length,
                itemBuilder: (context, index) {
                  return GoalItem(
                    id:  MainCubit.get(context).goalsList[index]['id'],
                    goalName: MainCubit.get(context).goalsList[index]['name'],
                  );
                }),

              floatingActionButton: const CreateFloatingActionButton(),
            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: Colors.blue,
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         builder: (_) => AlertDialog(
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(20)),
            //               content: SizedBox(
            //                 height: 180.h,
            //                 child: Column(
            //                   children: [
            //                     Container(
            //                       color: Colors.blue[900],
            //                       height: 30.h,
            //                       child: const Center(
            //                         child: Text(
            //                           "Write your Goals",
            //                           style: TextStyle(
            //                               fontWeight: FontWeight.w700,
            //                               color: Colors.white),
            //                         ),
            //                       ),
            //                     ),
            //                     5.verticalSpace,
            //                     TextFormField(
            //                       controller: MainCubit.get(context).addTextController,
            //                       decoration: InputDecoration(
            //                           filled: true,
            //                           fillColor: Colors.white,
            //                           label: const Text("Write Here....."),
            //                           floatingLabelBehavior:
            //                               FloatingLabelBehavior.never,
            //                           border: OutlineInputBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(5)),
            //                           contentPadding: const EdgeInsets.all(5)),
            //                     ),
            //                     Row(
            //                       children: [
            //                         Expanded(
            //                           child: ElevatedButton(
            //                               style: ButtonStyle(
            //                                   backgroundColor:
            //                                       WidgetStateProperty.all(
            //                                           Colors.red)),
            //                               onPressed: () {
            //                                 MainCubit.get(context).insetData(
            //                                     MainCubit.get(context).addTextController.text.toString());
            //
            //                                 MainCubit.get(context).addTextController.text = '';
            //
            //                                 MainCubit.get(context).getData();
            //                                 Navigator.pop(context);
            //                               },
            //                               child: const Text("ADD")),
            //                         ),
            //                         5.horizontalSpace,
            //                         Expanded(
            //                           child: ElevatedButton(
            //                               style: ButtonStyle(
            //                                   backgroundColor:
            //                                       WidgetStateProperty.all(
            //                                           Colors.blue)),
            //                               onPressed: () {
            //                                 MainCubit.get(context).addTextController.text = '';
            //                                 Navigator.pop(context);
            //                               },
            //                               child: const Text("Cancel")),
            //                         ),
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ));
            //   },
            //   child: Icon(
            //     Icons.add,
            //     color: Colors.white,
            //     size: 33.sp,
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
