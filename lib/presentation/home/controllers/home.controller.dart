import 'dart:developer';

import 'package:algo_pic/infrastructure/models/home_model/home_model.dart';
import 'package:algo_pic/infrastructure/repository/home_repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<HomeModel> homeMemes = HomeModel(data: []).obs;
  Rx<MemeModel> meme = MemeModel(id: '', name: '', url: '', height: 0, width: 0, boxCount: 0).obs;
  RxList<MemeModel> listHomeMemes = RxList.empty();

  HomeRepository homeRepository = HomeRepository();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    initMemes();
    isLoading.value = false;
  }

  Future<void> initMemes() async {
    listHomeMemes.value = await homeRepository.getMemes();
    homeMemes.value = HomeModel(data: listHomeMemes.sublist(0, 18));
    log(homeMemes.value.data.length.toString());
  }

  Future<void> loadMore() async {
    listHomeMemes.value = await homeRepository.getMemes();
    homeMemes.value = HomeModel(data: listHomeMemes.sublist(0, 36));
    log(homeMemes.value.data.length.toString());
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
