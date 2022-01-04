import 'package:flutter_boilerplate/data/data.dart';
import 'package:flutter_boilerplate/domain/domain.dart';
import 'package:flutter_boilerplate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance..allowReassignment = true;

Future setupLocator() async {
  _registerBloc();
  await Data.init();
  Domain.init();
}

void _registerBloc() {
  ///Home page
  locator.registerFactory(() => HomeBloc(getTask: locator()));
}
