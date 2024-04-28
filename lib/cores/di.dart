import 'package:bmi/features/home_feature/data/data_source/remote/repo/home_repo.dart';
import 'package:bmi/features/home_feature/domain/repo_imp/home_repo_imp.dart';
import 'package:bmi/features/home_feature/presention/cubit/home_cubit.dart';
import 'package:bmi/features/home_layout_feature/data/data_source/remote/repo/home_layout_repo.dart';
import 'package:bmi/features/home_layout_feature/domain/repo_imp/home_layout_repo_imp.dart';
import 'package:bmi/features/home_layout_feature/presention/cubit/home_layout_cubit.dart';
import 'package:bmi/features/sign_in_feature/data/dataSource/remote/repo/sign_in_repo.dart';
import 'package:bmi/features/sign_in_feature/domain/repo_imp/sign_in_repo_imp.dart';
import 'package:bmi/features/sign_in_feature/presention/cubit/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  _setupRepositories();
  setupBlocs();
}

void setupBlocs() {
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<SignInCubit>(() => SignInCubit());
  getIt.registerFactory<HomeLayoutCubit>(() => HomeLayoutCubit());
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt.get()));
}

void _setupRepositories() {
  getIt.registerSingleton<SignInRepo>(SignInRepoImp());
  getIt.registerSingleton<HomeRepo>(HomeRepoImp());
  getIt.registerSingleton<HomeLayoutRepo>(HomeLayoutRepoImp());
}
