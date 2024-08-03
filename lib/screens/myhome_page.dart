import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/employee_widget.dart';
import 'package:test_flutter/widgets/counter_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: CounterPage(),
            ),
            const Divider(),
            const Expanded(flex: 2, child: EmployeePage()),
          ],
        ),
      ),
    );
  }
}
