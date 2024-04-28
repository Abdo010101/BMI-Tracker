part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {}

class UserDataComeSuccess extends HomeLayoutState {
  final List<UserDataModel> myList;
  UserDataComeSuccess({required this.myList});
}

class UserDataComeLoading extends HomeLayoutState {}

class UserDataComeError extends HomeLayoutState {
  final String? error;

  UserDataComeError({this.error});
}

class UserItemDeleteLoading extends HomeLayoutState {}

class UserItemDeleteSuccess extends HomeLayoutState {}

class UserItemUpdateLoading extends HomeLayoutState {}

class UserItemUpdateSuccess extends HomeLayoutState {}

class UserSignOutLoading extends HomeLayoutState {}

class UserSignOutSuccess extends HomeLayoutState {}
