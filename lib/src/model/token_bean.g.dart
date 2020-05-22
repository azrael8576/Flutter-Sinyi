// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenBean _$TokenBeanFromJson(Map<String, dynamic> json) {
  return TokenBean(
    json['GKey'] as String,
    json['UserID'] as String,
    json['UserName'] as String,
    json['UserPhone'] as String,
    json['DeptID'] as String,
    json['DeptZip'] as String,
    json['DeptName'] as String,
    json['DeptLat'] as String,
    json['DeptLng'] as String,
    json['DeptType'] as String,
    json['JobID'] as String,
    json['JobName'] as String,
    json['JobTitle'] as String,
    json['DebugModel'] as String,
    json['UpperDeptID'] as String,
    json['UpperDeptName'] as String,
    json['CompanyID'] as String,
    json['Popup'] as String,
  )..Password = json['Password'] as String;
}

Map<String, dynamic> _$TokenBeanToJson(TokenBean instance) => <String, dynamic>{
      'GKey': instance.GKey,
      'UserID': instance.UserID,
      'UserName': instance.UserName,
      'UserPhone': instance.UserPhone,
      'DeptID': instance.DeptID,
      'DeptZip': instance.DeptZip,
      'DeptName': instance.DeptName,
      'DeptLat': instance.DeptLat,
      'DeptLng': instance.DeptLng,
      'DeptType': instance.DeptType,
      'JobID': instance.JobID,
      'JobName': instance.JobName,
      'JobTitle': instance.JobTitle,
      'DebugModel': instance.DebugModel,
      'UpperDeptID': instance.UpperDeptID,
      'UpperDeptName': instance.UpperDeptName,
      'CompanyID': instance.CompanyID,
      'Popup': instance.Popup,
      'Password': instance.Password,
    };
