extension ImageStringHelper on String? {
  String validatePicture() {
    if(this == null) return "";
    final splits = this!.split("/");
    return "http://195.88.87.77:8008/storage/uploads/${splits.last}";
  }
}

extension StringHelper on String? {
  bool isNotNullOrEmpty() {
    return !(this == null || this!.isEmpty);
  }
}