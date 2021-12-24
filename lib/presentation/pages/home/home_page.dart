import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:flutter_boilerplate/presentation/di/locator.dart';
import 'package:flutter_boilerplate/presentation/pages/home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => locator<HomeBloc>()..add(GetTaskEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: BlocSelector<HomeBloc, HomeState, List<Task>>(
          selector: (state) {
            if(state is GetTasksSuccessState) {
              return state.tasks;
            } else {
              return [];
            }
          },
          builder: (context, tasks) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    child: Center(child: Text('Entry ${tasks[index].name}')),
                  );
                });
          },
        ),
      ),
    );
  }
}
