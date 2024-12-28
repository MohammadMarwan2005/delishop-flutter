extension ImageStringHelper on String {
  String validatePicture() {
    // return this;
    return "http://195.88.87.77:8008${substring(21)}";
  }
}

extension StringHelper on String? {
  bool isNotNullOrEmpty() {
    return !(this == null || this!.isEmpty);
  }
}