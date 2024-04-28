part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeCalaculateBMILoading extends HomeState {}

class HomeCalaculateBMISuccess extends HomeState {}

class HomeSumbitDataSuccees extends HomeState {}

class HomeSumbitDataLoading extends HomeState {}

class HomeSumbitDataError extends HomeState {}
