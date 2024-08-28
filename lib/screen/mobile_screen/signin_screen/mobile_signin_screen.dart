import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:txhmmain/screen/ingredient/bottom_page_mobile_decoration.dart';

import '../../../data/finalData.dart';
import '../../general_screen/appbar/general_app_bar.dart';
import '../../general_screen/main_screen.dart';
import '../../general_screen/utils/utils.dart';
import '../../ingredient/product_directory_drawer/product_directory_drawer.dart';
import '../../general_screen/appbar/mobile_main_appbar.dart';
import '../../general_screen/appbar/mobile_preview_appbar.dart';
import '../signup_screen/ingredient/text_field_login.dart';
import 'controller/signin_controller.dart';

class mobile_signin_screen extends StatefulWidget {
  const mobile_signin_screen({super.key});

  @override
  State<mobile_signin_screen> createState() => _mobile_signin_screenState();
}

class _mobile_signin_screenState extends State<mobile_signin_screen> {
  bool loading = false;
  final userController = TextEditingController();
  final passController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: RefreshIndicator(
        child: Container(
          color: Colors.blueGrey.withOpacity(0.1),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: general_app_bar(event: () => _scaffoldKey.currentState?.openDrawer(),),
              ),

              Positioned(
                top: 130,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: ListView(
                    children: [
                      SizedBox(height: 10,),

                      Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 5,),

                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  'Đăng nhập tài khoản',
                                  style: TextStyle(
                                    fontFamily: 'muli',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 100,
                                  ),
                                ),
                              ),

                              SizedBox(height: 15,),

                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: text_field_login(controller: userController, hint: 'Email của bạn', event: () {}, iconData: Icons.email_outlined),
                              ),

                              SizedBox(height: 6,),

                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: text_field_login(controller: passController, hint: 'Mật khẩu của bạn', event: () {}, iconData: Icons.password),
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
                                        setState(() {loading = true;});
                                        await signin_controller.loginHandleWeb(userController.text.toString(), passController.text.toString(),
                                              () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_screen()),);},
                                              () {setState(() {loading = false;});},);
                                      } else {
                                        toastMessage('Làm ơn điền đủ thông tin.');
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 7, bottom: 7),
                                      child: !loading ? Text(
                                        '        Đăng nhập        ',
                                        style: TextStyle(
                                          fontFamily: 'sf',
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ) : CircularProgressIndicator(color: Colors.white,),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 35,),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30,),

                      bottom_page_mobile_decoration(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onRefresh: _refresh,
      ),
      drawer: Drawer(
        width: width / (394 / 286),
        // child: type_drawer(),
        child: product_directory_drawer(),
      ),
    );
  }
}