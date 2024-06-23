import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> openDb() async {
  final database = await openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'megamall.db'),

    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) async {
      // Run the CREATE TABLE statement on the database.
      await db.execute(
        '''
        CREATE TABLE cart(
        id INTEGER PRIMARY KEY, 
        title TEXT, 
        price DOUBLE, 
        description TEXT, 
        category TEXT, 
        image TEXT, 
        rating TEXT,
        cartQty INTEGER,
        totalPrice DOUBLE
        )''',
      );

      await db.execute(
        '''
        CREATE TABLE wishlist(
        id INTEGER PRIMARY KEY, 
        title TEXT, 
        price DOUBLE, 
        description TEXT, 
        category TEXT, 
        image TEXT, 
        rating TEXT
        )''',
      );

      await db.execute(
        '''
        CREATE TABLE auth(
        emailOrPhoneNumber TEXT PRIMARY KEY, 
        password TEXT
        )''',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  return database;
}
