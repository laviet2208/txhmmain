import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../../data/finalData.dart';
import '../../../../data/historyData/Transaction.dart';
import '../../../../data/orderData/Order.dart';
import '../../../../data/otherdata/Tool.dart';
import '../../../../data/voucherData/UserUse.dart';
import '../../../../data/voucherData/Voucher.dart';
import '../../../general_screen/utils/utils.dart';

class check_out_controller {
  static Future<void> push_new_order(Order order, VoidCallback successEvent, VoidCallback failEvent) async {
    DatabaseReference database = FirebaseDatabase.instance.ref("Order");
    await database.child(order.id).set(order.toJson()).then((value) async {
      if (finalData.isLogin) {
        if (check_voucher_exist(order.voucher)) {
          int index = get_voucher_index(order.voucher);
          finalData.account.voucherList.removeAt(index);
          DatabaseReference database1 = FirebaseDatabase.instance.ref("Account");
          await database1.child(finalData.account.id).set(finalData.account.toJson());
        } else {
          await pushVoucher(order.voucher);
        }
      }
      toastMessage('Create order success');
      successEvent();
    }).onError((error, stackTrace) {
      failEvent();
      toastMessage(error.toString());
      print(error.toString());
    });
  }

  static bool check_voucher_exist(Voucher voucher) {
    for (int i = 0; i < finalData.account.voucherList.length; i++) {
      if (finalData.account.voucherList[i].id == voucher.id) {
        return true;
      }
    }
    return false;
  }

  static int get_voucher_index(Voucher voucher) {
    for (int i = 0; i < finalData.account.voucherList.length; i++) {
      if (finalData.account.voucherList[i].id == voucher.id) {
        return i;
      }
    }
    return -1;
  }

  static Future<void> pushVoucher(Voucher voucher) async {
    if (voucher.id != '') {
      voucher.useCount = voucher.useCount + 1;
      bool check = false;
      for (UserUse use in voucher.CustomList) {
        if (use.id == finalData.account.id) {
          check = true;
          use.count = use.count + 1;
          break;
        }
      }
      if (!check) {
        voucher.CustomList.add(UserUse(id: finalData.account.id, count: 1));
      }
      final reference = FirebaseDatabase.instance.ref();
      await reference.child('Voucher').child(voucher.id).set(voucher.toJson());
    }
  }
}
