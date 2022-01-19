import 'package:flutter_boilerplate/data/data.dart';
import 'package:flutter_boilerplate/domain/domain.dart';
import 'package:flutter_boilerplate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance..allowReassignment = true;

Future setupLocator(String? flavor) async {
  await Data.init(flavor);
  Domain.init();
  _registerBloc();
}

void _registerBloc() {
  ///Home page
  locator.registerFactory(() => HomeBloc(getTask: locator()));
}
