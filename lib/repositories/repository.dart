import 'package:flutter/foundation.dart';

import '../models/model.dart';

abstract class Repository {
  Model create();
  List<Model> getAll();

  Model get(int id);
  void update(Model item);
  void delete(Model item);
  void clear();
}
