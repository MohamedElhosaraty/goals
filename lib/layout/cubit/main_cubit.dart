import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  final TextEditingController addTextController = TextEditingController();

  String? lang = 'ar';

  void toEnglish() {
    lang = 'en'; // تعيين اللغة الإنجليزية
    print('Language changed to English');
    emit(ChangeLanguage(language: lang));

  }

  void toArabic() {
    lang = 'ar'; // تعيين اللغة العربية
    print('Language changed to Arabic');
    emit(ChangeLanguage(language: lang));
  }


  initSqfLite() async {
    var databasesPath = await getDatabasesPath();

    // any file to database must be finish .db ----------
    String path = join(databasesPath, 'goals.db');

    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          // Any word must be UpperCase
        // Goals :- Name Table , id and name :- Content the Table , may be more than
          '''CREATE TABLE Goals 
                  (id INTEGER PRIMARY KEY,
                   name TEXT,
                   data TEXT,
                   time TEXT
                   )''');
    });


  }

  List<Map> goalsList = [];

  getData() async {
    var databasesPath = await getDatabasesPath();

    // any file to database must be finish .db ----------
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);
    await database.rawQuery('SELECT * FROM Goals').then((value) {
      goalsList = value;
      emit(GetGoalSuccessState());
    }).catchError((onError) {
      emit(GetGoalLoadingState());
      print(onError.toString());
    });

    database.close();
  }

  insetData(String name) async {

    String formattedDate = DateFormat.yMMMMd(lang).format(DateTime.now());
    String formattedTime = DateFormat('mm:hh a', lang).format(DateTime.now());


    emit(InsertGoalLoadingState());

    var databasesPath = await getDatabasesPath();

    // any file to database must be finish .db ----------
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);
    await database
        .rawInsert('INSERT INTO Goals(name,data,time) VALUES(?,?,?)',
        [name,formattedDate,formattedTime] ).then((value) {
      emit(InsertGoalSuccessState());
    }).catchError((onError) {
      emit(InsertGoalErrorState());
      print(onError.toString());
    });
    database.close();
  }

  removeData(id) async {

    var databasesPath = await getDatabasesPath();

    // any file to database must be finish .db ----------
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);
    await database
        .rawDelete('DELETE FROM Goals WHERE id = ?', [id]).then((value){
          emit(RemoveGoalSuccessState());

    }).catchError((onError){
      print (onError.toString());
      emit(RemoveGoalErrorState());
    });
  }

  updateData (String nameUpdate , id) async {

    var databasesPath = await getDatabasesPath();

    // any file to database must be finish .db ----------
    String path = join(databasesPath, 'goals.db');
    Database database = await openDatabase(path);
    await database.rawUpdate(
        'UPDATE Goals SET name = ? WHERE id = ?',
        [nameUpdate, id]).then((value){
          emit(UpdateGoalSuccessState());
    }).catchError((onError){
      emit (UpdateGoalErrorState());
      print (onError.toString());
    });
    database.close();
  }

  deleteDataBase () async {

    var databasesPath = await getDatabasesPath();

    // any file to database must be finish .db ----------
    String path = join(databasesPath, 'goals.db');
    await deleteDatabase(path);

    emit(DeleteGoalSuccessState());
    initSqfLite();
    getData();
    emit(DeleteGoalLoadingState());

  }
}
