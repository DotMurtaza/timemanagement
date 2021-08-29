import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Models/user_model.dart';

class UserController extends GetxController{
  Rx<UserModel> usermodel=UserModel().obs;
  UserModel get user=>usermodel.value;
  set user(UserModel value)=>this.usermodel.value=value;
  // void clear(){
  //   usermodel.value=UserModel();
  // }
}