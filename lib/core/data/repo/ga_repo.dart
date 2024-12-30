import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class GARepo {
  final FirebaseAnalytics _analytics;

  GARepo({required FirebaseAnalytics analytics}) : _analytics = analytics;

  /// Logs a login event with user details.
  void logLogin(String firstName, String lastName, String phoneNumber) {
    _analytics.logEvent(
      name: "login",
      parameters: {
        "method": "phoneNumber_and_password",
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
      },
    );
  }

  /// Logs a signup event with user details.
  void logSignup(String firstName, String lastName, String phoneNumber) {
    _analytics.logEvent(
      name: "signup",
      parameters: {
        "method": "phoneNumber_and_password",
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
      },
    );
  }

  /// Logs when a user views a product.
  void logViewProduct(Product product, String phoneNumber) {
    _analytics.logEvent(
      name: "view_product",
      parameters: {
        "product_name": product.name,
        "product_id": product.id,
        "product_price": product.price,
        "store_id": product.storeId,
        "phone_number": phoneNumber,
      },
    );
  }

  /// Logs when a user views a store.
  void logViewStore(Store store, String phoneNumber) {
    _analytics.logEvent(
      name: "view_store",
      parameters: {
        "store_id": store.id,
        "store_category_id": store.categoryId,
        "store_name": store.name,
        "store_location": store.location,
        "phone_number": phoneNumber,
      },
    );
  }

  /// Logs when a user adds a product to their favorites.
  void logAddToFavorites(Product product, String phoneNumber) {
    _analytics.logEvent(
      name: "add_to_favorites",
      parameters: {
        "product_name": product.name,
        "product_id": product.id,
        "product_price": product.price,
        "store_id": product.storeId,
        "phone_number": phoneNumber,
      },
    );
  }

  /// Logs when a user removes a product from their favorites.
  void logRemoveFromFavorites(Product product, String phoneNumber) {
    _analytics.logEvent(
      name: "remove_from_favorites",
        parameters: {
          "product_name": product.name,
          "product_id": product.id,
          "product_price": product.price,
          "store_id": product.storeId,
          "phone_number": phoneNumber,
        },
    );
  }

  /// Logs when a user views their favorites.
  void logViewFavorites(String phoneNumber) {
    _analytics.logEvent(
      name: "view_favorites",
      parameters: {
        "phoneNumber": phoneNumber,
      },
    );
  }

  /// Logs when a user views their favorites.
  void logViewHome(String phoneNumber) {
    _analytics.logEvent(
      name: "view_home",
      parameters: {
        "phoneNumber": phoneNumber,
      },
    );
  }

  /// Logs when a user adds a product to their cart.
  void logAddToCart(Product product, String phoneNumber) {
    _analytics.logEvent(
      name: "add_to_cart",
      parameters: {
        "item_id": product.id,
        "item_name": product.name,
        "item_category": product.storeId,
        "price": product.price.toString(),
        "phoneNumber": phoneNumber,
      },
    );
  }

  /// to use later...
  /// Logs when a user toggles the app language.
  void logToggleLanguage(String languageCode, String phoneNumber) {
    _analytics.logEvent(
      name: "toggle_language",
      parameters: {
        "lang": languageCode,
        "phoneNumber": phoneNumber,
      },
    );
  }

  /// Logs when a user logs out.
  void logLogout(String phoneNumber) {
    _analytics.logEvent(
      name: "logout",
      parameters: {
        "phoneNumber": phoneNumber,
      },
    );
  }
}

extension JsonHelper on Map<String, dynamic> {
  /// Converts a `Map<String, dynamic>` to a `Map<String, Object>` to conform to Firebase Analytics parameter requirements.
  Map<String, Object> toObjectMap() => map(
        (key, value) {
          var newValue = value;
          if (newValue == null || (newValue is! num && newValue is! String)) {
            newValue = newValue.toString();
          }
          return MapEntry(key, newValue);
        },
      );
}
