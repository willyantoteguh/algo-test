import 'dart:developer';

import 'package:algo_pic/infrastructure/navigation/routes.dart';
import 'package:algo_pic/infrastructure/shared/component/item_meme_card.dart';
import 'package:algo_pic/infrastructure/shared/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late HomeController controller;
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.find();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            key: refreshKey,
            onRefresh: onRefresh,
            child: GetX<HomeController>(
                init: controller,
                builder: (ctrl) {
                  return buildList(ctrl);
                }),
          )
        ],
      ),
    );
  }

  Future<void> onRefresh() async {
    await controller.loadMore();
    log("refresh");
  }

  Widget buildList(controller) {
    if (controller.isLoading.value) {
      return SizedBox(
        height: Get.height / 4,
        width: 200,
        child: Center(
          child: CircularProgressIndicator.adaptive(backgroundColor: Colors.lightBlue),
        ),
      );
    } else {
      return ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: Get.height,
            child: buildGridView(),
          )
        ],
      );
    }
  }

  Widget buildGridView() {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        // Icon(CupertinoIcons.refresh_circled),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid.count(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(controller.homeMemes.value.data.length, (index) {
                var meme = controller.homeMemes.value.data[index];

                return Center(
                  child: ItemMemeCard(
                      onTap: () {
                        controller.meme.value = meme;

                        Get.toNamed(Routes.DETAIL);
                      },
                      meme: meme),
                );
              })),
        ),
      ],
    );
  }
}
