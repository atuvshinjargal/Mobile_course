import 'package:flutter/foundation.dart';
import '../repositories/repository.dart';
import 'model.dart';

class Task {
  final int id;
  String description; //tailbar
  bool complete;
  Task.fromModel(Model model)
      : id = model.id,
        description = model.data['description'],
        complete = model.data['complete'];

  Task({
    required this.id,
    this.complete = false,
    this.description = '',
  });
  Model toModel() => Model(id: id, data: {
        'description': description,
        'complete': complete,
      });
}
