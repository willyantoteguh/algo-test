import 'dart:developer';

import 'package:algo_pic/infrastructure/models/home_model/home_model.dart';
import 'package:algo_pic/infrastructure/source/remote/home_remote/home_remote_source.dart';

class HomeRepository {
  HomeRemoteSource homeRemoteSource = HomeRemoteSource();

  Future<dynamic> getMemes() async {
    List<MemeModel>? listHomeTemporary = [];
    var response = await homeRemoteSource.getMemes();

    log(response.toString());

    if (response != []) {
      var listResult = response;
      for (var item in listResult) {
        MemeModel memeModel = MemeModel.fromJson(item);
        listHomeTemporary.add(memeModel);
      }
    }
    log(listHomeTemporary.map((e) => e.name).toList().toString());
    return listHomeTemporary;
  }
}
