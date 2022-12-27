import 'dart:developer';

import 'package:algo_pic/infrastructure/models/home_model/home_model.dart';
import 'package:algo_pic/infrastructure/shared/component/custom_textfield.dart';
import 'package:algo_pic/infrastructure/shared/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/detail_image.controller.dart';

class DetailMemeScreen extends GetView<DetailImageController> {
  final MemeModel meme;

  const DetailMemeScreen({Key? key, required this.meme}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: (() => Get.back()),
          child: Icon(
            CupertinoIcons.arrow_left,
            color: blackColor,
          ),
        ),
        title: Text('MimGenerator', style: blackTextStyle.copyWith(fontWeight: bold)),
        centerTitle: true,
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Obx(
                () => Image.network(
                  // (controller.isAddCaption.value == true) ?
                  (controller.resultImage.value.data.url == '') ? meme.url : controller.resultImage.value.data.url,
                  // color: blueColor,
                  fit: BoxFit.fitHeight,
                  height: Get.height / 1.5,
                ),
              ),
              SizedBox(height: 35),
              Obx(() => (controller.resultImage.value.data.url == '')
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCustomButton(
                          "Add Logo",
                          image: Icons.image_rounded,
                          onTap: () {},
                        ),
                        buildCustomButton(
                          "Add Text",
                          image: Icons.text_fields_rounded,
                          onTap: () {
                            showModalAddText(context);
                          },
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCustomButton(
                          "Simpan",
                          image: null,
                          onTap: () {
                            controller.saveLocalData().then((value) {
                              Get.snackbar('Success', 'Your image has been saved');
                            });
                          },
                        ),
                        buildCustomButton(
                          "Share",
                          image: null,
                          onTap: () {},
                        )
                      ],
                    )),
            ],
          ),
        )),
      ),
    );
  }

  InkWell buildCustomButton(String title, {required IconData? image, required Function onTap}) {
    return InkWell(
      onTap: () => onTap(),
      // height: 80,
      // width: 80,
      // color: blackColor,
      child: Container(
        height: 50,
        width: Get.width / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightBlue,
        ),
        child: Row(
          mainAxisAlignment: (image != null) ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (image != null)
                ? Icon(
                    image,
                    size: 25,
                    color: whiteColor,
                  )
                : SizedBox(),
            // SizedBox(width: 10),
            Text(
              title,
              style: whiteTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  showModalAddText(
    BuildContext context,
  ) {
    final controller = Get.put(DetailImageController());

    return showModalBottomSheet(
        barrierColor: Colors.black45,
        backgroundColor: Colors.transparent,
        elevation: 0,
        context: context,
        builder: (context) {
          return Container(
              height: Get.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: whiteColor),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 4.3,
                      width: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: greyColor),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // TextFormField()
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: 'Tambahkan untuk caption gambar',
                          controller: controller.addTextController,
                          multiline: true,
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 35),
                        buildCustomButton(
                          'Simpan',
                          image: null,
                          onTap: () async {
                            var id = int.tryParse(meme.id);

                            controller.isAddCaption.value = true;
                            log(controller.isAddCaption.value.toString());
                            await controller.saveCaption(
                              id!,
                              controller.addTextController.text.toString(),
                              controller.addTextController.text.toString(),
                            );
                            controller.update();
                            // Get.back(closeOverlays: true);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
