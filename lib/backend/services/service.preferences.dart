import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  GetStorage prefs;
  var preferences = Pref();

  Future<bool> configure() async {
    prefs = GetStorage("local");
    return Future.value(true);
  }

  getPref(String key) {
    bool ans = prefs.read(key);
    if (ans == null) return false;
    return ans;
  }
}

class Pref {
  String firstStart = "first start";
}
