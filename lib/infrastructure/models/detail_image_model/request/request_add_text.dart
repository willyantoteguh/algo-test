class RequestAddText {
  int template_id;
  String username;
  String text1;
  String text0;
  dynamic password;

  RequestAddText({
    required this.template_id,
    required this.username,
    required this.text1,
    required this.text0,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{
      'template_id': template_id,
      'password': password,
      'username': username,
      'text1': text1,
      'text0': text0,
    };

    return data;
  }

  factory RequestAddText.fromJson(Map<String, dynamic> map) {
    return RequestAddText(
      template_id: map['template_id'] as int,
      username: map['username'] as String,
      password: map['password'] as String,
      text1: map['text1'] as dynamic,
      text0: map['text1'] as dynamic,
    );
  }
}
