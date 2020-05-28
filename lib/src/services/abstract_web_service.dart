class AbstractWebService {
  String encryptKey;
  String apiUrl;
  String nameSpace;
  String token;
  String userID;
  String appName;
  bool isDebug;

  String getEncryptKey() {
    return encryptKey;
  }

  void setEncryptKey(String encryptKey) {
    this.encryptKey = encryptKey;
  }

  String getApiUrl() {
    return apiUrl;
  }

  void setApiUrl(String apiUrl) {
    this.apiUrl = apiUrl;
  }

  String getToken() {
    return token;
  }

  void setToken(String token) {
    this.token = token;
  }
}