import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttersinyi/net/app_exceptions.dart';
import 'package:fluttersinyi/net/ws/login_web_service.dart';
import 'package:fluttersinyi/net/ws/sinyi_api_config.dart';
import 'package:fluttersinyi/src/model/response_model.dart';
import 'package:fluttersinyi/src/model/token_bean.dart';

import '../../main.dart';

class TokenBloc extends BlocBase{
  var _tokenBean;
  var responseStatus;
  var responseDesc;
  var responseErrDesc;

  login() async{
    Map<String, dynamic> json = await LoginWebService().GetAuthToken("417437", "SummerCozyRock70", "81374642-3004-41cf-a3ea-5c4cb6111d3c", "9999", "1.0.36.393.9999", "TA2", "samsung SM-N9208", "");
    responseStatus = json[ResponseModel.status] != null ? int.parse(json[ResponseModel.status]) : "";
    responseDesc = json[ResponseModel.desc] != null ? json[ResponseModel.desc] : "";
    responseErrDesc = json[ResponseModel.errDesc] != null ? json[ResponseModel.errDesc] : "";
    if (responseStatus == SinyiApiConfig.API_SUCCESS) {
      _tokenBean = TokenBean.fromJson(json[TokenBean.TAG]);
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