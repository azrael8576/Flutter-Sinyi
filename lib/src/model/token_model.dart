import 'package:fluttersinyi/src/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';
///{
//"Status":"1",
//"ErrDesc":"",
//"JToken":{
//	"GKey":"KAzkkQ5KMv70d5ic/qvPgX5zGwZwtEnBRvmqYXBFr9pji6eFQGNXrEWwfDoSHOm8wYpVCH0QuAmx+zg8ykEwUg==-NZAgptgeJOX1kSIK",
//	"UserID":"225315",
//	"UserName":"陳鼎元",
//	"UserPhone":"0987491411 ",
//	"DeptID":"R535",
//	"DeptZip":"106",
//	"DeptName":"台北東門店",
//	"DeptLat":"25.033698366380886",
//	"DeptLng":"121.52856826483355",
//	"DeptType":"A",
//	"JobID":null,
//	"JobName":null,
//	"JobTitle":"B0",
//	"DebugModel":null,
//	"UpperDeptID":"RR03",
//	"UpperDeptName":"業三區",
//	"CompanyID":"0001",
//	"Popup":"Y"
//	}
//}
@JsonSerializable()
class TokenModel extends BaseModel {
  TokenModel(this.GKey , this.UserID, this.UserName, this.UserPhone,
      this.DeptID, this.DeptZip, this.DeptName, this.DeptLat,
      this.DeptLng, this.DeptType, this.JobID, this.JobName,
      this.JobTitle, this.DebugModel, this.UpperDeptID, this.UpperDeptName,
      this.CompanyID, this.Popup);
  static final String TAG = "JToken";

  String GKey;
  String UserID;
  String UserName;
  String UserPhone;
  String DeptID;
  String DeptZip;
  String DeptName;
  String DeptLat;
  String DeptLng;
  String DeptType;
  String JobID;
  String JobName;
  String JobTitle;
  String DebugModel;
  String UpperDeptID;
  String UpperDeptName;
  String CompanyID;
  String Popup;

  String Password;

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic>toJson() => _$TokenModelToJson(this);
}