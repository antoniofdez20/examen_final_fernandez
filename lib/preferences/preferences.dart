import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs; //objeto de tipo SharedPreferences

  static String _tempUsername = '';
  static String _tempPassword = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get tempUsername {
    return _prefs.getString('tempUsername') ?? _tempUsername;
  }

  static set tempUsername(String value) {
    _tempUsername = value;
    _prefs.setString('tempUsername', value);
  }

  static String get tempPassword {
    return _prefs.getString('tempPassword') ?? _tempPassword;
  }

  static set tempPassword(String value) {
    _tempPassword = value;
    _prefs.setString('tempPassword', value);
  }
}
