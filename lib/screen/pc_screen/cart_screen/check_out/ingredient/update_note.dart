import 'package:flutter/material.dart';
import '../../../../../data/orderData/Order.dart';
import '../../../../general_screen/utils/utils.dart';
import '../../../../mobile_screen/cart_screen/ingredient/edit_text_in_signup_step_1.dart';

class update_note extends StatefulWidget {
  final Order order;
  final VoidCallback event;
  const update_note({super.key, required this.order, required this.event});

  @override
  State<update_note> createState() => _update_noteState();
}

class _update_noteState extends State<update_note> {
  final noteController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteController.text = widget.order.note;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/2.5;
    return AlertDialog(
      title: Text('Add note', style: TextStyle(fontFamily: 'muli', fontSize: width/50, fontWeight: FontWeight.bold),),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      content: Container(
        width: width/5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),

            SizedBox(
              height: 50,
              child: edit_text_in_signup_step_1(controller: noteController, hint: 'Enter note', event: () {setState(() {});  },),
            ),

            SizedBox(height: 10,),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (noteController.text.isNotEmpty) {
              widget.order.note = noteController.text.toString();
              widget.event();
              Navigator.of(context).pop();
            } else {
              toastMessage('Làm ơn thêm ghi chú');
            }
          },
          child: Text(
            'Lưu ghi chú',
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ),

        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Đóng form',
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
