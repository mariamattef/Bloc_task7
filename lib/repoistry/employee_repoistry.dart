import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_flutter/models/employee.dart';

class EmployeeRepoistory {
  Future<List<Employee>> getEmployees() async {
    try {
      var result = await rootBundle.loadString('assets/employee.json');
      var employees = jsonDecode(result);
      return List<Employee>.from(
          employees.map((json) => Employee.fromJson(json)).toList());
    } catch (e) {
      rethrow;
    }
  }
}
