import 'dart:async';
import 'package:mysql_client/mysql_client.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper instance = DatabaseHelper._internal();

  factory DatabaseHelper() => instance;

  // Private constructor
  DatabaseHelper._internal();

  // MySQL connection object
  MySQLConnection? _connection;

  // Method to create a connection
  FutureOr<void> initConnection() async {
    if (_connection == null) {
      _connection = await MySQLConnection.createConnection(
        host: '127.0.0.1',
        port: 3306,
        userName: 'root',
        password: '123',
        databaseName: 'indent_management',
        secure: false
      );
      await _connection!.connect();
    }
  }

  // Method to fetch data
  Future<List<Map<String, String?>>> fetchData(String query) async {
    if (_connection == null) await initConnection();

    var result = await _connection!.execute(query);

    List<Map<String, String?>> data = [];
    for (final row in result.rows) {
      data.add(row.assoc());
    }

    return data;
  }

  // Method to insert/update/delete data
  FutureOr<void> executeQuery(String query) async {
    if (_connection == null) await initConnection();

    await _connection!.execute(query);
  }

  // Close the connection
  void closeConnection() async {
    await _connection?.close();
    _connection = null;
  }
}
