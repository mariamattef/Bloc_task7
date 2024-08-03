import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/employee_bloc.dart';
import 'package:test_flutter/cubit/counter/counter_cubit.dart';
import 'package:test_flutter/repoistry/employee_repoistry.dart';
import 'package:test_flutter/screens/myhome_page.dart';
import 'package:test_flutter/widgets/counter_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CounterCubit(),
      ),
      BlocProvider<EmployeeBloc>(
        create: (context) => EmployeeBloc(EmployeeRepoistory()),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
