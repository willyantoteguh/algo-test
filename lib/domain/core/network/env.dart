class AppConstants {
  const AppConstants();

  static Api appApi = const Api();
  static BaseEnvironment baseEnvironment = const BaseEnvironment();
}

class Api {
  const Api();

  String get getMemes => "get_memes";
  String get addText => "caption_image";
}

class BaseEnvironment {
  const BaseEnvironment();

  String get baseUrl => "https://api.imgflip.com/";
  String get password => "yw2sTKhs5cQajQG";
}
