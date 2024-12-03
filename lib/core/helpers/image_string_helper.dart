extension ImageStringHelper on String {
  String validatePicture() {
    return "http://10.0.2.2:8000${substring(21)}";
  }
}

extension StringHelper on String? {
  bool isNotNullOrEmpty() {
    return !(this == null || this!.isEmpty);
  }
}