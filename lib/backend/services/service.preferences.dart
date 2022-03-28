import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  SharedPreferences prefs;
  var preferences = Pref();

  Future<bool> configure() async {
    prefs = await SharedPreferences.getInstance();
    return Future.value(true);
  }

  getPref(String key) {
    bool ans = prefs.get(key);
    if (ans == null) return false;
    return ans;
  }
}

class Pref {
  String firstStart = "first start";
}
