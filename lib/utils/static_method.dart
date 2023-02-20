import 'package:fluttertoast/fluttertoast.dart';

class StaticMethods{
  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
    );
  }
}