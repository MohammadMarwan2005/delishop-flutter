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
  static const String createOrder = "$baseUrl/order/createOrder";
  static const String updateOrder = "$baseUrl/order/updateStatusOrder";
  static const String getMyOrdersUrl = "$baseUrl/order/getUserOrders";
  static const String getMyStoreOrdersUrl = "$baseUrl/order/getMyStoreOrders";
  static const String searchUrl = "$baseUrl/categories/search";
  static const String getProfileUrl = "$baseUrl/profile/getProfile";
  static const String updateProfileUrl = "$baseUrl/profile/updateProfile";
  static const String getMyStoreReview = "$baseUrl/storeRating/getMyRating";
  static const String getMyProductReview = "$baseUrl/productRating/getMyRating";
  static const String postMyStoreReview = "$baseUrl/storeRating/addRating";
  static const String postMyProductReview = "$baseUrl/productRating/addRating";
  static const String deleteMyStoreReview = "$baseUrl/storeRating/deleteRating";
  static const String deleteMyProductReview = "$baseUrl/productRating/deleteRating";
  static const String getStoreReviews = "$baseUrl/storeRating/getRatings";
  static const String getProductReviews = "$baseUrl/productRating/getRatings";
  static const String depositMoneyUrl = "$baseUrl/wallet/deposit";
  static const String createUserUrl = "$baseUrl/user/creatUser";
  static const String getTransactionsUrl = "$baseUrl/wallet/getTransactionsDeposit";
  static const String getMyStoreUrl = "$baseUrl/store/getMyStore";
  static const String updateMyStoreUrl = "$baseUrl/store/update";
  static const String getMyProductsUrl = "$baseUrl/product/getProductsMyStore";
  static const String createProductUrl = "$baseUrl/product/create";
  static const String updateProductUrl = "$baseUrl/product/update";
}

abstract class StatusCodes {
  static const int unprocessableEntity = 422;
  static const int unauthorized = 401;
  static const int noInternet = 503;
  static const int unknown = 520;
  static const int conflict = 409;
  static const int notFound = 404;
  static const int invalidInput = 440; // we don't need this custom code...
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

extension UriHelper on String {
  Uri getUri() => Uri.parse(this);
}

abstract class RoleIds {
  static const superAdmin = 1;
  static const mall = 2;
  static const user = 3;
}

extension RoleIdExtensions on int {
  T whenRole<T>({
    required T Function() superAdmin,
    required T Function() mall,
    required T Function() user,
  }) {
    switch (this) {
      case RoleIds.superAdmin:
        return superAdmin();
      case RoleIds.mall:
        return mall();
      case RoleIds.user:
        return user();
      default:
        throw ArgumentError('Invalid role ID: $this');
    }
  }
}

