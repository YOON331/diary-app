import 'package:mysql_client/mysql_client.dart';

// MySQL 접속
Future<MySQLConnection> dbConnector() async {
  print("Connecting to mysql server...");

  // MySQL 접속 설정
  final conn = await MySQLConnection.createConnection(
    host: '127.0.0.1',
    port: 3307,
    userName: 'root',
    password: 'quf30924',
    // databaseName: 'diary_flutter', // optional
  );

  await conn.connect();

  print("Connected");

  return conn;
}
