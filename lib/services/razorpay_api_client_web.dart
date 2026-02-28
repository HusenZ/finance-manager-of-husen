Future<Map<String, dynamic>> razorpayRequest({
  required String method,
  required String path,
  required String keyId,
  required String keySecret,
  String? body,
}) {
  throw UnsupportedError(
    'Razorpay HTTP requests are not supported in web client runtime.',
  );
}
