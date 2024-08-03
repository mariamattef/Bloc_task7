import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/employee_bloc.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  void initState() {
    context.read<EmployeeBloc>().add(LoadEmployeeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child:
          BlocBuilder<EmployeeBloc, EmployeeState>(builder: ((context, state) {
        if (state is EmployeeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is EmployeeLoadedState) {
          return ListView.builder(
            itemCount: state.employees.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  child: Text(state.employees[index].name?.first ?? 'No Name'),
                ),
                trailing: Text(
                  state.employees[index].gender ?? 'i don,t know gender',
                  style: const TextStyle(fontSize: 16),
                ),
                title:
                    Text(state.employees[index].address?.city ?? 'No Address'),
                subtitle:
                    Text(state.employees[index].address?.street ?? 'No Street'),
              );
            },
          );
        }
        if (state is EmployeeLoadingErrorState) {
          return Center(
              child: Text(
            ' Employees :${state.errorMessage}',
            textAlign: TextAlign.center,
          ));
        }
        return Container();
      })),
    );
  }
}
