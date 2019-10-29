import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static SpHelper instance;

  SpHelper(){}

  static SpHelper getInstance() {
    print("getInstance");

    if (instance == null) {
      instance = new SpHelper();
    }
  }

   void setStr(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  Future<String> getStr(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var p = sharedPreferences.getString(key)??"";
    return p;
  }
}
