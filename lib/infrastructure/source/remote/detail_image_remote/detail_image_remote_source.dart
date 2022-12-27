import 'dart:developer';

import 'package:algo_pic/domain/core/network/api_launch.dart';
import 'package:algo_pic/infrastructure/models/detail_image_model/request/request_add_text.dart';
import 'package:dio/dio.dart';

import '../../../../domain/core/network/env.dart';

class DetailImageRemoteSource {
  Future<dynamic> addText(RequestAddText params) async {
    final Dio _api = ApiLaunch().launch();

    try {
      var response = await _api.post(AppConstants.appApi.addText, data: params.toJson());

      // BaseResponse baseResponse = BaseResponse.fromJson(responses.data);
      // if (baseResponse.message == true) {
      //   homeData = responses.data['data']['memes'];
      // }
      // return homeData;
      log(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
