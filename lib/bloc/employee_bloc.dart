import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_flutter/models/employee.dart';
import 'package:test_flutter/repoistry/employee_repoistry.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepoistory _employeeRepoistory;
  EmployeeBloc(this._employeeRepoistory) : super(EmployeeLoadingState()) {
    on<LoadEmployeeEvent>(loadEmployee);
  }

  FutureOr<void> loadEmployee(
      LoadEmployeeEvent event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoadingState());
    await _employeeRepoistory
        .getEmployees()
        .then((employees) => emit(EmployeeLoadedState(employees)))
        .catchError(
            (error) => emit(EmployeeLoadingErrorState(error.toString())));
  }
}
