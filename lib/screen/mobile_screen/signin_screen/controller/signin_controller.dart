import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:txhmmain/data/finalData.dart';
import 'package:txhmmain/screen/mobile_screen/loading_screen/controller/loading_controller.dart';

import '../../../general_screen/utils/utils.dart';

class signin_controller {
  static Future<void> loginHandleWeb(String email, String password, VoidCallback successEvent, VoidCallback failEvent) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null && user.emailVerified) {
        finalData.account = await loading_controller.getAccountData(email);
        if (finalData.account.id != '') {
          if (finalData.account.lockstatus == 1) {
            successEvent();
          } else {
            failEvent();
            toastMessage('Tài khoản của bạn bị khóa');
          }
        } else {
          failEvent();
          toastMessage('Kiểm tra lại thông tin tài khoản');
        }
      } else {
        failEvent();
        toastMessage('Làm ơn xác nhận email trước khi đăng nhập.');
        // You can also send a verification email again if needed
        if (user != null) {
          await user.sendEmailVerification();
        }
      }
    } catch (error) {
      failEvent();
      toastMessage(error.toString());
      print(error.toString());
    }
  }
}