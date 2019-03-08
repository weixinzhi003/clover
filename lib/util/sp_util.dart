import 'package:shared_preferences/shared_preferences.dart';

class SpUtil{

  static void setString(String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


}