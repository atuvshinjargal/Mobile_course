import 'dart:async';

import 'task.dart';

class Plan {
  String name = '';
  final List<Task> tasks = [];

  int get completeCount => tasks.where((task) => task.complete).length;
  String get completenessMessage =>
      'Нийт ${tasks.length} ажлаас $completeCount дууссан байна.';
}
