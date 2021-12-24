import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:flutter_boilerplate/domain/use_cases/get_task.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTask getTask;

  HomeBloc({required this.getTask}) : super(HomeInitial()) {
    on<GetTaskEvent>((event, emit) {
      _getTask(event, emit);
    });
  }

  Future<void> _getTask(GetTaskEvent event, Emitter<HomeState> emit) async {
    print('object');
    final task = await getTask();
    emit(GetTasksSuccessState(task));
  }
}
