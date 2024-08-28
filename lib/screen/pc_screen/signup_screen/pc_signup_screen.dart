import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../data/Account/Account.dart';
import '../../../data/otherdata/Tool.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../general_screen/signin_screen.dart';
import '../../general_screen/utils/utils.dart';
import '../../ingredient/bottom_page_pc_decoration.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import '../../mobile_screen/signup_screen/ingredient/text_field_login.dart';
import '../../mobile_screen/signup_screen/signup_controller/signup_controller.dart';

class pc_signup_screen extends StatefulWidget {
  const pc_signup_screen({super.key});

  @override
  State<pc_signup_screen> createState() => _pc_signup_screenState();
}

class _pc_signup_screenState extends State<pc_signup_screen> {
  bool loading = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  bool can_continue() {
    if (userController.text.isNotEmpty && passController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> _refresh() async {
    setState(() {

    });
  }
  bool isOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 248, 249),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: general_app_bar(event: () {
                  if (isOpen) {
                    setState(() {
                      isOpen = false;
                    });
                  } else {
                    setState(() {
                      isOpen = true;
                    });
                  }
                },),
              ),

              Positioned(
                top: height/13,
                left: width/3 - width/7 - 65,
                child: Container(
                  width: width/7,
                  height: isOpen ? (height - height/13 - 10) : 0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: product_directory_drawer(),
                ),
              ),

              Positioned(
                top: height/13,
                left: width/3,
                bottom: 0,
                child: Container(
                  width: width/2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(height: 10,),

                      Container(
                        height: 25,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          'Đăng ký tài khoản',
                          style: TextStyle(
                            fontFamily: 'muli',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: width/15, right: width/15,),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 15,),

                            SizedBox(height: 15,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: text_field_login(controller: firstNameController, hint: 'Họ của bạn', event: () {}, iconData: Icons.person),
                            ),

                            SizedBox(height: 6,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: text_field_login(controller: lastNameController, hint: 'Tên của bạn', event: () {}, iconData: Icons.person),
                            ),

                            SizedBox(height: 6,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: text_field_login(controller: userController, hint: 'Email của bạn', event: () {}, iconData: Icons.email_outlined),
                            ),

                            SizedBox(height: 6,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: text_field_login(controller: phoneController, hint: 'Sđt của bạn', event: () {}, iconData: Icons.phone),
                            ),

                            SizedBox(height: 6,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: text_field_login(controller: passController, hint: 'Mật khẩu', event: () {}, iconData: Icons.password),
                            ),

                            SizedBox(height: 15,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                child: TextButton(
                                  autofocus: true,
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                                  ),
                                  onPressed: () async {
                                    if (can_continue()) {
                                      Account account = Account(id: '', username: userController.text.toString(), password: passController.text.toString(), address: '', createTime: getCurrentTime(), money: 0, firstName: firstNameController.text.toString(), lastName: lastNameController.text.toString(), phoneNum: '', lockstatus: 1, voucherList: []);
                                      String id = (DateTime.now().hour >= 10 ? DateTime.now().hour.toString() : '0' + DateTime.now().hour.toString()) + (DateTime.now().minute >= 10 ? DateTime.now().minute.toString() : '0' + DateTime.now().minute.toString()) + (DateTime.now().second >= 10 ? DateTime.now().second.toString() : '0' + DateTime.now().second.toString()) + (DateTime.now().day >= 10 ? DateTime.now().day.toString() : '0' + DateTime.now().day.toString()) + (DateTime.now().month >= 10 ? DateTime.now().month.toString() : '0' + DateTime.now().month.toString()) + (DateTime.now().year >= 10 ? DateTime.now().year.toString() : '0' + DateTime.now().year.toString());
                                      account.id = 'TK' + id;
                                      await signup_controller.signUpPressed(account,
                                            () {setState(() {loading = true;});},
                                            () {setState(() {loading = false;});},
                                            () {setState(() {loading = false;}); toastMessage('Check email để xác minh tài khoản'); Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => signin_screen()));},
                                      );
                                    } else {
                                      toastMessage('Làm ơn điền đủ thông tin');
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 7, bottom: 7),
                                    child: Text(
                                      '        Đăng ký        ',
                                      style: TextStyle(
                                        fontFamily: 'sf',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),

                      bottom_page_pc_decoration(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
