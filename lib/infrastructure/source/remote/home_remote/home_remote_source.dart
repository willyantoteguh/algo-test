import 'dart:developer';

import 'package:algo_pic/domain/core/network/api_launch.dart';
import 'package:algo_pic/infrastructure/models/base_response/base_response.dart';
import 'package:algo_pic/infrastructure/models/home_model/home_model.dart';
import 'package:dio/dio.dart';

import '../../../../domain/core/network/env.dart';

class HomeRemoteSource {
  final Dio _api = ApiLaunch().launch();

  Future<dynamic> getMemes() async {
    // HomeModel homeData = HomeModel();

    try {
      var response = await _api.get(AppConstants.appApi.getMemes);

      // BaseResponse baseResponse = BaseResponse.fromJson(responses.data);
      // if (baseResponse.message == true) {
      //   homeData = responses.data['data']['memes'];
      // }
      // return homeData;
      return response.data['data']['memes'];
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
