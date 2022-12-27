class DetailImageModel {
  DetailImageModel({
    required this.data,
  });

  ImageModel data;

  factory DetailImageModel.fromJson(Map<String, dynamic> json) => DetailImageModel(
        data: ImageModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}

class ImageModel {
  final String url;
  final String page_url;

  ImageModel({required this.url, required this.page_url});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        url: json["url"],
        page_url: json["page_url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "page_url": page_url,
      };
}
