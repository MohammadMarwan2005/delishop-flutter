import 'package:delishop/core/data/model/product/product.dart';
import 'package:sqflite/sqflite.dart';


abstract class DBService {
  Future<List<ProductDataModel>> getCartProducts();
  Future<void> addProductToDatabase(ProductDataModel product);
  Future<void> removeProductFromDatabase(int productId);
  Future<void> removeProductsFromDatabase(List<int> productsIds);
  Future<bool> isInDatabase(int productId);
  Future<void> clearAllData();
}

class MobileDBService extends DBService {
  final Database _database;

  MobileDBService(this._database);

  @override
  Future<List<ProductDataModel>> getCartProducts() async {
    List<Map<String, dynamic>> productsMap = await _database.query("cart");
    List<ProductDataModel> result = productsMap.map(
      (e) {
        return ProductDataModel.fromMap(e);
      },
    ).toList();
    return result;
  }

  @override
  Future<void> addProductToDatabase(ProductDataModel product) async {
    await _database.insert("cart", product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> removeProductFromDatabase(int productId) async {
    await _database.delete("cart", where: "id = ?", whereArgs: [productId]);
  }

  @override
  Future<void> removeProductsFromDatabase(List<int> productsIds) async {
    if (productsIds.isNotEmpty) {
      final ids = productsIds.join(',');
      await _database.delete("cart", where: "id IN ($ids)");
    }
  }

  @override
  Future<bool> isInDatabase(int productId) async {
    final result = await _database.query(
      "cart",
      where: "id = ?",
      whereArgs: [productId],
    );
    return result.isNotEmpty;
  }

  @override
  Future<void> clearAllData() async {
    final tables = await _database.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';"
    );

    for (var table in tables) {
      final tableName = table['name'] as String;
      await _database.delete(tableName);
    }
  }
}

class WebDBService implements DBService {
  final Map<int, ProductDataModel> _cart = {};

  @override
  Future<List<ProductDataModel>> getCartProducts() async {
    return _cart.values.toList();
  }

  @override
  Future<void> addProductToDatabase(ProductDataModel product) async {
    _cart[product.id] = product;
  }

  @override
  Future<void> removeProductFromDatabase(int productId) async {
    _cart.remove(productId);
  }

  @override
  Future<void> removeProductsFromDatabase(List<int> productsIds) async {
    for (var id in productsIds) {
      _cart.remove(id);
    }
  }

  @override
  Future<bool> isInDatabase(int productId) async {
    return _cart.containsKey(productId);
  }

  @override
  Future<void> clearAllData() async {
    _cart.clear();
  }
}


class ProductDataModel {
  final int id;
  final int storeId;
  final String name;
  final String description;
  final String? productPicture;
  final double price;
  final double discount;
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


