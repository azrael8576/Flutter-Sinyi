import 'package:fluttersinyi/src/services/app_exceptions.dart';
import 'package:fluttersinyi/src/model/response_model.dart';
import 'package:fluttersinyi/src/model/token_model.dart';
import 'package:fluttersinyi/src/services/login_web_service.dart';
import 'package:fluttersinyi/src/services/sinyi_api_config.dart';

import '../bloc/bloc.dart';

class TokenBloc extends BaseBloc{
  var _tokenBean;
  var responseStatus;
  var responseDesc;
  var responseErrDesc;

  String userId = '';
  String password = '';

  login() async{
    Map<String, dynamic> json = await LoginWebService().GetAuthToken(userId, password, "81374642-3004-41cf-a3ea-5c4cb6111d3c", "9999", "1.0.36.393.9999", "TA2", "samsung SM-N9208", "");
    responseStatus = json[ResponseModel.status] != null ? int.parse(json[ResponseModel.status]) : "";
    responseDesc = json[ResponseModel.desc] != null ? json[ResponseModel.desc] : "";
    responseErrDesc = json[ResponseModel.errDesc] != null ? json[ResponseModel.errDesc] : "";
    if (responseStatus == SinyiApiConfig.API_SUCCESS) {
      _tokenBean = TokenModel.fromJson(json[TokenModel.TAG]);
      return true;
    } else {
      return false;
    }
  }

  get tokenBean{
    if (_tokenBean == null) {
      throw InvalidAuthorizedException("尚未登入！");
    } else {
      return _tokenBean;
    }
  }
}