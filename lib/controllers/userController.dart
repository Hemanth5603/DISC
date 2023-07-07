import 'package:disc/model/userModel.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  Rx<userModel> UserModel = userModel().obs;
}