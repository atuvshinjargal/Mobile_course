import 'package:flutter/material.dart';
import 'package:myapp/controller/plan_controller.dart';
import './models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _controller = PlanController();
  //final _plans = <Plan>[];
  PlanProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static PlanController of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._controller;
  }
}
