import 'package:delishop/core/data/model/product/product.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  final Database _database;

  DBService(this._database);

  Future<List<ProductDataModel>> getCartProducts() async {
    List<Map<String, dynamic>> productsMap = await _database.query("cart");
    List<ProductDataModel> result = productsMap.map(
      (e) {
        return ProductDataModel.fromMap(e);
      },
    ).toList();
    return result;
  }

  Future<void> addProductToDatabase(ProductDataModel product) async {
    await _database.insert("cart", product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeProductFromDatabase(int productId) async {
    await _database.delete("cart", where: "id = ?", whereArgs: [productId]);
  }

  Future<void> removeProductsFromDatabase(List<int> productsIds) async {
    if (productsIds.isNotEmpty) {
      final ids = productsIds.join(',');
      await _database.delete("cart", where: "id IN ($ids)");
    }
  }

  Future<bool> isInDatabase(int productId) async {
    final result = await _database.query(
      "cart",
      where: "id = ?",
      whereArgs: [productId],
    );
    return result.isNotEmpty;
  }

  Future<void> clearAllData() async {
    // Get all tables in the database
    final tables = await _database.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';"
    );

    for (var table in tables) {
      final tableName = table['name'] as String;
      await _database.delete(tableName);
    }
  }
}

class ProductDataModel {
  final int id;
  final int storeId;
  final String name;
  final String description;
  final String? productPicture;
  final String price;
  final String discount;
  final int quantity;

  ProductDataModel(
      {required this.id,
      required this.storeId,
      required this.name,
      required this.description,
      required this.productPicture,
      required this.price,
      required this.discount,
      required this.quantity});

  Product toProduct() {
    return Product(
        id: id,
        storeId: storeId,
        name: name,
        description: description,
        productPicture: productPicture,
        price: price,
        discount: discount,
        quantity: quantity,
        isFavorite: null,
        rating: null);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'storeId': storeId,
      'name': name,
      'description': description,
      'productPicture': productPicture,
      'price': price,
      'discount': discount,
      'quantity': quantity,
    };
  }

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDataModel(
      id: map['id'],
      storeId: map['storeId'],
      name: map['name'],
      description: map['description'],
      productPicture: map['productPicture'],
      price: map['price'],
      discount: map['discount'],
      quantity: map['quantity'],
    );
  }
}
