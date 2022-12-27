class BaseResponse {
  late bool? message;

  BaseResponse();

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()..message = json['message'];
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) => <String, dynamic>{
      'message': instance.message,
    };
