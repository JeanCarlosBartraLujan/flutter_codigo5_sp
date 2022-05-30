import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  static final SPGlobal _instance = SPGlobal._mandarina();

  SPGlobal._mandarina();

  factory SPGlobal() {
    return _instance;
  }

  late SharedPreferences _prefs;
//Puedo poner el Future<void> si se desea
  Future<void> initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

//------------>
  set fullName(String value) {
    _prefs.setString("fullName", value);
  }

  String get fullName {
    return _prefs.getString("fullName") ?? "";
  }
  //-----------

  set address(String value) {
    _prefs.setString("address", value);
  }

  String get address {
    return _prefs.getString("address") ?? "";
  }
  //------------------

  set darkMode(bool value) {
    _prefs.setBool("darkMode", value);
  }

  bool get darkMode {
    return _prefs.getBool("darkMode") ?? false;
  }
  //------------------------

  set gender(int value) {
    _prefs.setInt("gender", value);
  }

  int get gender {
    return _prefs.getInt("gender") ?? 1;
  }
//---------------------

}
