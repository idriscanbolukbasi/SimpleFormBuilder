import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_form_builder/form_builder.dart';
import 'package:simple_form_builder/src/shared/checklistModel.dart';
import 'package:simple_form_builder/src/shared/constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FormBuilder Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                dropdownDecoration: DropdownDecoration(
                  // styling the dropdown
                  width: 0.4,
                  icon: Icons.arrow_drop_down,
                  showInRow: true,
                  iconColor: Colors.green,
                  itemHeight: 50,
                  underline: Container(height: 2, color: Colors.green),
                  decoration: const BoxDecoration(),
                ),
                initialData: sampleData,
                title: "Form title",
                titleStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                description: "description",
                widgetCrossAxisAlignment: CrossAxisAlignment.center,
                index: 0,
                showIndex: false,
                descriptionTextDecoration: const TextStyle(color: Colors.red),
                submitButtonWidth: 1,
                submitButtonDecoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                showIcon: false,
                onSubmit: (ChecklistModel? val) {
                  // null-check
                  if (val == null) {
                    debugPrint("no data");
                  } else {
                    var json = jsonEncode(val.toJson());
                    debugPrint(json);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
