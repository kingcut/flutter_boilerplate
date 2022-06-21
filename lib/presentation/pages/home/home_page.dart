import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/presentation/di/locator.dart';
import 'package:flutter_boilerplate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => locator<HomeBloc>()..add(GetTaskEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.helloWorld),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is GetTasksSuccessState) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: state.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 50,
                      child: Center(
                          child: Text('Entry ${state.tasks[index].name}')),
                    );
                  });
            } else if (state is GetTasksFailedState) {
              return Text(state.error.message);
            } else {
              return const Offstage();
            }
          },
        ),
      ),
    );
  }
}
