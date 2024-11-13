class NetworkServiceException implements Exception {
  final String message;
  final int? statusCode;
  final Map<String, dynamic>? responseData;

  NetworkServiceException({
    required this.message,
    this.statusCode,
    this.responseData,
  });

  @override
  String toString() => message;
}