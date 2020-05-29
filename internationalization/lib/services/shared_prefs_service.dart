import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  SharedPreferences _prefs;

  // Usable if global di is used
  // static SharedPrefsService _instance;

  // SharedPrefsService._({@required SharedPreferences prefs})
  //     : assert(prefs != null),
  //       this._prefs = prefs;

  // static Future<SharedPrefsService> getInstance() async {
  //   if (_instance == null) {
  //     final prefs = await SharedPreferences.getInstance();
  //     _instance = SharedPrefsService._(prefs: prefs);
  //   }
  //   return _instance;
  // }

  void throwGenericTypeException(dynamic t) {
    String genericTypes =
        'generic types: `bool` `double` `int` `String` `List<String>`';

    throw Exception(toString() == null
        ? 'Generic type not specified.\nValid $genericTypes'
        : 'Generic type ${t.toString()} not supported.\nSupported $genericTypes');
  }

  Future<bool> set<T extends Object>(String key, T value) async {
    _prefs ?? (_prefs = await SharedPreferences.getInstance());

    if (T is bool) return _prefs.setBool(key, value as bool);

    if (T == double) return _prefs.setDouble(key, value as double);

    if (T == int) return _prefs.setInt(key, value as int);

    if (T == String) return _prefs.setString(key, value as String);

    if (value is List<String>)
      return _prefs.setStringList(key, value as List<String>);

    throwGenericTypeException(T);
  }

  Future<T> get<T extends Object>(String key) async {
    _prefs ?? (_prefs = await SharedPreferences.getInstance());

    if (T == bool) return _prefs.getBool(key) as T;

    if (T == double) return _prefs.getDouble(key) as T;

    if (T == int) return _prefs.getInt(key) as T;

    if (T == String) return _prefs.getString(key) as T;

    if (key is List<String>) return _prefs.getStringList(key) as T;

    throwGenericTypeException(T);
  }

  Future<bool> update<T>(String key, T value) async {
    _prefs ?? (_prefs = await SharedPreferences.getInstance());

    if (_prefs.containsKey(key)) return set<T>(key, value);

    throw Exception('{key: $key}: not found!');
  }

  Future<bool> delete(String key) async {
    _prefs ?? (_prefs = await SharedPreferences.getInstance());

    return _prefs.remove(key);
  }

  Future<bool> hasKey(String key) async {
    _prefs ?? (_prefs = await SharedPreferences.getInstance());

    return _prefs.containsKey(key);
  }
}
