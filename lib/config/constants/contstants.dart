
enum Environment { Local, Prod }

class Constants {
  static Map<String, dynamic> _config = _Config.prodConstants;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.Local:
        _config = _Config.localConstants;
        break;
      case Environment.Prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get API {
    return _config[_Config.API];
  }

  static get SECURE_STORAGE_AUTHTOEKN {
    return _config[_Config.SECURE_STORAGE_AUTHTOEKN];
  }
}

class _Config {
  static const API = "API";
  static const SECURE_STORAGE_AUTHTOEKN = "SECURE_STORAGE_AUTHTOEKN";

  static Map<String, dynamic> localConstants = {
    API: "http://localhost:8080",
    SECURE_STORAGE_AUTHTOEKN: "kiffy:accessToken"
  };

  static Map<String, dynamic> prodConstants = {
    API: "http://api-dev.kiffy.club",
    SECURE_STORAGE_AUTHTOEKN: "kiffy:accessToken"
  };
}