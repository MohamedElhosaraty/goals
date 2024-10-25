part of 'main_cubit.dart';

sealed class MainState {}

final class MainInitial extends MainState {}

//------------------- to get data -------------------

final class GetGoalSuccessState extends MainState {}

final class GetGoalLoadingState extends MainState {}

final class GetGoalErrorState extends MainState {}


//------------------- to remove data -------------------

final class RemoveGoalSuccessState extends MainState {}

final class RemoveGoalLoadingState extends MainState {}

final class RemoveGoalErrorState extends MainState {}


//------------------- to update data -------------------

final class UpdateGoalSuccessState extends MainState {}

final class UpdateGoalLoadingState extends MainState {}

final class UpdateGoalErrorState extends MainState {}

//------------------- to insert data -------------------

final class InsertGoalSuccessState extends MainState {}

final class InsertGoalLoadingState extends MainState {}

final class InsertGoalErrorState extends MainState {}

//----------------------- delete DataBase ------------------



final class DeleteGoalSuccessState extends MainState {}

final class DeleteGoalLoadingState extends MainState {}

final class DeleteGoalErrorState extends MainState {}

//-----------lang-----------

final class ChangeLanguage extends MainState {
  final String? language;

  ChangeLanguage({required this.language});
}
