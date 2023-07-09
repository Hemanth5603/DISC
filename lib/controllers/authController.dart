import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:sms_autofill/sms_autofill.dart";

import "../view/authorization/login.dart";



class authController extends GetxController{
  final auth = FirebaseAuth.instance;
  TextEditingController textEditingController = TextEditingController();
  var verificationID = ''.obs;
  var code = ''.obs;

  @override
  void onInit() async{
    super.onInit();
    print(SmsAutoFill().getAppSignature);
    await SmsAutoFill().listenForCode();
  }

  @override
  void onReady() async{
    super.onReady();
  }


  @override
  void onClose(){
    super.onClose();
    textEditingController.dispose();
    SmsAutoFill().unregisterListener();
  }


  Future<void> phoneVerification(String phoneNo) async{
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (e){
        if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'The Given Phone Number is Invalid');
        }else{
          Get.snackbar('Error', 'Something went Wrong, Try Again');
        }
      },
      codeSent: (verificationID,resendToken){
        this.verificationID.value = verificationID;
      },
      codeAutoRetrievalTimeout: (verificationID){
        this.verificationID.value = verificationID;
      }
    );
  }


  Future<bool>  verifyOtp(String otp)async {
    var credentials = await auth.signInWithCredential(
      PhoneAuthProvider.credential(verificationId:
       this.verificationID.value,
      smsCode: otp)
    );
    return credentials.user != null ? true : false;
  }

  void otpController(String otp) async{
    var isVerified = await verifyOtp(otp);
    isVerified ? Get.offAll(Login()) : Get.back();
  }

}