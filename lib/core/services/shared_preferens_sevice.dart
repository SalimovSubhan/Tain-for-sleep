import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServise {
  late final SharedPreferences prefs;

  initSharedPreferens() async {
    prefs = await SharedPreferences.getInstance();
  }

  // kays
  static const String _language = 'language';

  //geters
  String? get getLanduade => prefs.getString(_language);

  //seters
  Future<void> setLanguage({required String value}) async {
    await prefs.setString(_language, value);
  }
}

final prefsServiseProvider = Provider((ref) {
  return PrefsServise();
});
