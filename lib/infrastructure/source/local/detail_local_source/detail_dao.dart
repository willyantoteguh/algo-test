import 'dart:developer';

import 'package:algo_pic/infrastructure/models/detail_image_model/response/detail_image_model.dart';
import 'package:sembast/sembast.dart';

import '../../../../domain/core/local/sembast_database.dart';

class DetailDao {
  static const String STORE_NAME = "detail_image";

  final _store = intMapStoreFactory.store(STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(listImage) async {
    for (var item in listImage) {
      if (item is DetailImageModel == false) {
        item = DetailImageModel.fromJson(item);
      }
      await _store.add(await _db, item.toJson());
      log(item.json());
    }
  }

  Future getAll() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);

    final listImage = await _store.find(await _db, finder: finder);
    return listImage.map((e) {
      final item = DetailImageModel.fromJson(e.value);
      return item;
    }).toList();
  }

  Future deleteAll() async {
    await _store.delete(await _db);
  }
}
