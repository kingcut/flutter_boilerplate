part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetTasksSuccessState extends HomeState {
  final List<Task> tasks;

  GetTasksSuccessState(this.tasks);
}
