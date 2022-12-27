import 'dart:developer';

import 'package:algo_pic/infrastructure/models/detail_image_model/request/request_add_text.dart';
import 'package:algo_pic/infrastructure/models/detail_image_model/response/detail_image_model.dart';
import 'package:algo_pic/infrastructure/source/local/detail_local_source/detail_dao.dart';
import 'package:algo_pic/infrastructure/source/remote/detail_image_remote/detail_image_remote_source.dart';

class DetailImageRepository {
  DetailImageRemoteSource detailImageRemoteSource = DetailImageRemoteSource();
  DetailDao detailDao = DetailDao();

  Future<DetailImageModel> addCaptionText({
    required String username,
    required String password,
    required int template_id,
    required text1,
    required text0,
  }) async {
    // DetailImageModel data;

    RequestAddText params = RequestAddText(
      template_id: template_id,
      username: username,
      text1: text1,
      text0: text0,
      password: password,
    );

    var data = await detailImageRemoteSource.addText(params);

    DetailImageModel resultImageModel = DetailImageModel.fromJson(data);
    // log("res: ${response.toString()}");
    // log("data: ${data.toJson().toString()}");
    return resultImageModel;
  }

  storeLocally(List<DetailImageModel> data) {
    return detailDao.insert(data);
  }
}
