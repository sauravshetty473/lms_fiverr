

class DBManager {
  static final DBManager _singleton = DBManager._internal();

  factory DBManager() {
    return _singleton;
  }

  DBManager._internal();

}