import 'package:equatable/equatable.dart';

/// DomainErrorModel is working for:
/// 422: Unprocessable Entity ✅✅
/// 401: Unauthorized and Credentials doesn't match our records
class DomainErrorModel extends Equatable {
  final String message;
  final List<String> details;
  final int code;

  const DomainErrorModel(
      {required this.message, required this.code, this.details = const []});

  @override
  List<Object?> get props => [message, details];

  static DomainErrorModel fromJson(Map<String, dynamic> jsonMap, int statusCode) {
    final String message = jsonMap["message"].toString();
    final int code = statusCode;
    List<String> details = [];
    try {
      details = (jsonMap["errors"] as Map<String, dynamic>)
          .entries
          .map((e) => e.value.toString())
          .toList();
      // ignore: empty_catches
    } catch (e) {
      // We should not have serialization errors here until now.
      print("An error occurred: ${e.toString()}");
    }
    return DomainErrorModel(message: message, code: code, details: details);
  }
}
