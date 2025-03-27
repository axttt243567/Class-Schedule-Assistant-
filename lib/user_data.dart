import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static const String _nameKey = 'user_name';
  static const String _yearKey = 'user_year';
  static const String _sectionKey = 'user_section';
  static const String _groupKey = 'user_group';
  static const String _rollNumberKey = 'user_roll_number';
  static const String _isFirstTimeKey = 'is_first_time';

  static late SharedPreferences _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save user data
  static Future<void> saveUserData({
    String? name,
    String? year,
    String? section,
    String? group,
    String? rollNumber,
  }) async {
    if (name != null) await _prefs.setString(_nameKey, name);
    if (year != null) await _prefs.setString(_yearKey, year);
    if (section != null) await _prefs.setString(_sectionKey, section);
    if (group != null) await _prefs.setString(_groupKey, group);
    if (rollNumber != null) await _prefs.setString(_rollNumberKey, rollNumber);
    await _prefs.setBool(_isFirstTimeKey, false);
  }

  // Get user data
  static String? get name => _prefs.getString(_nameKey);
  static String? get year => _prefs.getString(_yearKey);
  static String? get section => _prefs.getString(_sectionKey);
  static String? get group => _prefs.getString(_groupKey);
  static String? get rollNumber => _prefs.getString(_rollNumberKey);
  static bool get isFirstTime => _prefs.getBool(_isFirstTimeKey) ?? true;

  // Clear all user data
  static Future<void> clearUserData() async {
    await _prefs.clear();
  }
}
