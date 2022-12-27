import 'package:algo_pic/infrastructure/models/base_response/base_response.dart';

class HomeModel extends BaseResponse {
  HomeModel({
    required this.data,
  });

  List<MemeModel> data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: List<MemeModel>.from(json["memes"].map((x) => MemeModel.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "memes": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MemeModel {
  final String id;
  final String name;
  final String url;
  final int height;
  final int width;
  final int boxCount;

  MemeModel({required this.id, required this.name, required this.url, required this.height, required this.width, required this.boxCount});

  factory MemeModel.fromJson(Map<String, dynamic> json) => MemeModel(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        height: json["height"],
        width: json["width"],
        boxCount: json["box_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "width": width,
        "height": height,
        "box_count": boxCount,
      };
}
