import 'package:algo_pic/infrastructure/shared/theme/theme.dart';
import 'package:flutter/material.dart';

InputDecoration themeInputDecoration({String hintText = ""}) => InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15, 12, 15, 12),
      hintText: hintText,
      hintStyle: greyTextStyle.copyWith(color: greyColor, fontSize: 14),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: lightGreyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: greyColor),
      ),
      focusColor: blueColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: greyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: redColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
