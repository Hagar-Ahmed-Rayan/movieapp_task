import 'package:movieapp/shared/filmdb/film%20model.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static late Database dataBase;
  static String dbName = "favfilm.db";
  static const String tableName = "favfilms";
//int
  static Future<void> initDB({
    String tableName = tableName,
  }) async {
    dataBase = await openDatabase(
      dbName,
      version: 1,
      onCreate: (Database database, int x) async {
        await onCreateDataBase(database: database);
      },
    );
  }
//oncreate
  static Future<void> onCreateDataBase({
    required Database database,
    String tableName = tableName,
  }) async {
    await database.execute(
        'CREATE TABLE $tableName(film_id TEXT PRIMARY KEY, name TEXT, image_url TEXT, director TEXT)');
  }
  ///close
  ///
  ///
  static Future<void> closeDataBase() async {
    return await dataBase.close();
  }


//insert
  static Future<void> insertProduct(filmModel filmModel, {String tableName = tableName,}) async
  {
    await dataBase.rawInsert(
      'INSERT INTO $tableName(film_id, name, image_url, director) VALUES(?, ?, ?, ?)',
      [filmModel.id, filmModel.name, filmModel.imageUrl, filmModel.director],
    );
  }

 /* static Future<void> updateProductQuantity(String id, int quantity, {String tableName = tableName}) async
  {
    await initDB();
    await dataBase.rawUpdate(
      'UPDATE $tableName SET quantity = ? WHERE product_id = ?',
      [
        quantity,
        id,
      ],
    );
  }*/
///////////////
  //Future<List<Map<String, Object?>>>

  static Future<List<Map<String, dynamic>>> getAllfilms({String tableName = tableName}) async

  {
    await initDB();
    return await dataBase.rawQuery('SELECT * FROM $tableName');
  }
//delete
  static Future<void> deleteRecorde(String id, {String tableName = tableName}) async {
    await initDB();
    await dataBase.rawDelete(
      'DELETE FROM $tableName WHERE film_id = ?',
      [
        id,
      ],
    );
  }
}
