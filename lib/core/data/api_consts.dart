abstract class ApiConsts {
  static const String baseUrl = "http://10.0.2.2:8000/api";
  static const String loginUrl = "$baseUrl/auth/login";
  static const String registerUrl = "$baseUrl/auth/register";
  static const String productSearchUrl = "$baseUrl/product/search";
  static const String getProductByIdUrl = "$baseUrl/product/getProduct";
  static const String storeSearchUrl = "$baseUrl/store/search";
  static const String getStoreByIdUrl = "$baseUrl/store/getStore";
  static const String getAllCategories = "$baseUrl/categories/getCategories";
}

abstract class StatusCodes {
  static const int unprocessableEntity = 422;
  static const int unauthorized = 401;
  static const int noInternet = 503;
  static const int unknown = 520;
}

abstract class CommonConsts {
  static const Map<String, String> acceptJsonHeader = {
    'Accept': 'application/json',
    "Content-Type": "application/json",
  };
}
