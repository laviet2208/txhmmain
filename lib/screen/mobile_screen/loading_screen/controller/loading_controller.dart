import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../data/Account/Account.dart';
import '../../../../data/finalData.dart';
import '../../../../data/otherdata/Time.dart';
import '../../../general_screen/main_screen.dart';
import '../../../general_screen/preview_screen.dart';
import '../../../general_screen/utils/utils.dart';

class loading_controller {
  static Future<void> isLoginWeb(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        finalData.account = await getAccountData(user.email.toString());
        if (finalData.account.id != '') {
          Timer(const Duration(seconds: 3) , () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => main_screen())));
        } else {
          toastMessage('Please check your email and password');
          Timer(const Duration(seconds: 3) , () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => preview_screen())));
        }
      } else {
        print('email chưa xác minh');
        Timer(const Duration(seconds: 3) , () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => preview_screen())));
      }
    } else {
      Timer(const Duration(seconds: 3) , () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => preview_screen())));
    }
  }

  static Future<Account> getAccountData(String email) async {
    Account account = Account(id: '', username: '', password: '', address: '', createTime: Time(second: 0, minute: 0, hour: 0, day: 0, month: 0, year: 0), money: 0, firstName: '', lastName: '', phoneNum: '', lockstatus: 0, voucherList: [],);
    print('đã khởi tạo account');
    final reference = FirebaseDatabase.instance.ref();
    print('đã khởi tạo ref');
    DatabaseEvent snapshot = await reference.child("Account").orderByChild('username').equalTo(email).once();
    final dynamic data = snapshot.snapshot.value;
    if (data != null) {
      print('True');
      data.forEach((key, value) {
        account = Account.fromJson(value);
      });
    }
    return account;
  }
}