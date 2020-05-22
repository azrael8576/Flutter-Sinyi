import 'dart:collection';

import '../api_base_helper.dart';
import 'abstract_web_service.dart';

class LoginWebService extends AbstractWebService {
  final String TAG = "LoginWebService";
  final int DEV_TYPE_ANDROID = 3;

  static final LoginWebService _singleton = LoginWebService._internal();
  factory LoginWebService() {
    return _singleton;
  }
  LoginWebService._internal();

  bool init(bool isDebug, String url, int timeout, String appName) {
    logger.d(TAG, "init() called with: isDebug = [" + isDebug.toString() + "], url = [" + url + "], timeout = [" + timeout.toString() + "], appName = [" + appName + "]");
    bool isSuccess = false;
    this.isDebug = isDebug;
    this.apiUrl = url;
    this.appName = appName;

    try {
      ApiBaseHelper().init(timeout);
    } catch  (e) {
      e.printStackTrace();
      return isSuccess;
    }
    isSuccess = true;
    return isSuccess;
  }

  /**
   * App取得存取權限
   *
   * @param UserID
   * @param PWD
   * @param UUID
   * @param OSVer
   * @param ApVer
   * @param ApName
   * @param MobileId
   * @return
   */

  GetAuthToken(String UserID, String PWD, String UUID, String OSVer,
      String ApVer, String ApName, String MobileId, String PnToken) async {

    logger.i(TAG, "GetAuthToken: UserID:" + UserID + "\n"
        "GetAuthToken: PWD:" + PWD);
    HashMap<String, String> data = new HashMap<String, String>();
    data.addAll({
      "UserID" : UserID,
      "PWD" : PWD,
      //Android10 開始只帶入UUID至DevNewHID，DevHID與DevHID2帶空值
      "DevHID" : "", //IMEI
      "DevHID2" : "", //IMSI
      "DevNewHID" : UUID,
      "OSVer" : OSVer,
      "ApVer" : ApVer,
      "ApName" : ApName,
      "MobileId" : MobileId,
      "PnToken" : PnToken,
      "DevType" : DEV_TYPE_ANDROID.toString()
    });
    HashMap<String, String> header = new HashMap<String, String>();
    header.addAll({"Content-Type" : "application/json"});
    Map<String, dynamic> httpResult = await ApiBaseHelper.post(this.apiUrl, "taGetAuthToken",
        data, header);

    return httpResult;
  }
}