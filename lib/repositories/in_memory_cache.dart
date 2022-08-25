import '../models/model.dart';
import 'repository.dart';

class InMemoryCache implements Repository {
  final _storage = Map<int, Model>();

  @override
  void clear() {
    _storage.clear();
    // TODO: implement clear
  }

  @override
  Model create() {
    final ids = _storage.keys.toList()..sort();
    final id = (ids.length == 0) ? 1 : ids.last + 1;
    final model = Model(id: id);
    _storage[id] = model;
    return model;
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  void delete(Model item) {
    _storage.remove(item.id);
    // TODO: implement delete
  }

  @override
  Model get(int id) {
    return _storage[id]!;
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<Model> getAll() {
    return _storage.values.toList(growable: false);
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  void update(Model item) {
    _storage[item.id] = item;
    // TODO: implement update
  }
}
