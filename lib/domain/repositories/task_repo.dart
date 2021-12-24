import 'package:flutter_boilerplate/data/models/task.dart';

abstract class TaskRepo {

  Future<List<Task>> getTasks();
}