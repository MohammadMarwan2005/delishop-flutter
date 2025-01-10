abstract class ApiConsts {
  static const String baseUrl = "http://195.88.87.77:8008/api";
  static const String loginUrl = "$baseUrl/auth/login";
  static const String registerUrl = "$baseUrl/auth/register";
  static const String productSearchUrl = "$baseUrl/product/search";
  static const String getProductByIdUrl = "$baseUrl/product/getProduct";
  static const String getProductsByStoreIdUrl = "$baseUrl/product/getProductsByStore";
  static const String storeSearchUrl = "$baseUrl/store/search";
  static const String getStoresByIds = "$baseUrl/store/getStoresByIds";
  static const String getStoreByIdUrl = "$baseUrl/store/getStore";
  static const String getStoresByCategoryId = "$baseUrl/store/getStoreByCategory";
  static const String getAllCategories = "$baseUrl/categories/getCategories";
  static const String addProductToFavoriteUrl = "$baseUrl/favorite/addToFavorite";
  static const String removeProductFromFavoriteUrl = "$baseUrl/favorite/removeFromFavorite";
  static const String getFavoriteProductsUrl = "$baseUrl/favorite/getFavorites";
  static const String getMyBalanceUrl = "$baseUrl/wallet/balance";
  static const String getDefaultLocation = "$baseUrl/location/getDefaultUserLocation";
  static const String addLocation = "$baseUrl/location/addLocation";
  static const String getUserLocations = "$baseUrl/location/getUserLocations";
  static const String deleteLocation = "$baseUrl/location/deleteLocation";
  static String createOrder = "$baseUrl/order/createOrder";
  static String updateOrder = "$baseUrl/order/updateStatusOrder";
  static String getMyOrdersUrl = "$baseUrl/order/getUserOrders";
}

abstract class StatusCodes {
  static const int unprocessableEntity = 422;
  static const int unauthorized = 401;
  static const int noInternet = 503;
  static const int unknown = 520;
  static const int conflict = 409;
  static const int notFound = 404;
}

abstract class CommonConsts {
  static const Map<String, String> acceptJsonHeader = {
    'Accept': 'application/json',
    "Content-Type": "application/json",
  };

  static Map<String, String> getTokenHeader(String token) {
    return {
      ...CommonConsts.acceptJsonHeader,
      'Authorization': 'Bearer $token',
    };
  }
}
