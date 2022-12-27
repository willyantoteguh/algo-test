import 'dart:developer';

import 'package:algo_pic/domain/core/network/env.dart';
import 'package:algo_pic/infrastructure/models/detail_image_model/response/detail_image_model.dart';
import 'package:algo_pic/infrastructure/repository/detail_image_repository/detail_image_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailImageController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAddCaption = false.obs;
  RxList<DetailImageModel> listDetailImage = RxList.empty();
  RxList<DetailImageModel> listDetailImageTemporary = RxList.empty();
  Rx<DetailImageModel> resultImage = DetailImageModel(data: ImageModel(page_url: '', url: '')).obs;
  TextEditingController addTextController = TextEditingController();

  DetailImageRepository detailImageRepository = DetailImageRepository();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addTextController;
  }

  Future<void> saveCaption(int templateId, String text0, String text1) async {
    isLoading.value = true;
    resultImage.value = await detailImageRepository.addCaptionText(
      template_id: templateId,
      username: 'teguh',
      password: AppConstants.baseEnvironment.password,
      text0: text0,
      text1: text1,
    );
    log(templateId.toString());
    log(text0.toString());
    log(text1.toString());

    log("result ctrl: ${resultImage.value.data.toJson().toString()}");

    isLoading.value = false;
    Get.back(closeOverlays: true);
  }

  Future<void> saveLocalData() async {
    listDetailImage.add(resultImage.value);
    detailImageRepository.storeLocally(listDetailImage);
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
