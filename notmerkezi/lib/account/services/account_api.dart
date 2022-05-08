import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/account.dart';
import '../models/user.dart';

class AccountAPI {
  var dio = Dio();

  Future login(email, pwd) async {
    try{
      UserModel a = UserModel();
      a.id=0;
      a.schoolId=0;
      a.phone='';
      a.name='';
      a.email=email;
      a.password=pwd;
      final response = await dio.post('https://192.168.3.144:7058/api/User/Login',
          data: a.toJson(),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      debugPrint(response.statusCode.toString());
      return response;
    } catch (e){
      print(e);
    }
  }
  Future register(UserModel um) async {
    try{
      UserModel a = UserModel();
      a.id=0;
      a.schoolId=um.schoolId;
      a.phone=um.phone;
      a.name=um.name;
      a.email=um.email;
      a.password=um.password;
      debugPrint(a.toJson().toString());
      final response = await dio.post('https://192.168.3.144:7058/api/User/SignUp',
          data: a.toJson(),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      debugPrint(response.statusCode.toString());
      print(response);
      return response;
    } catch (e){
      print(e);
    }
  }
}
