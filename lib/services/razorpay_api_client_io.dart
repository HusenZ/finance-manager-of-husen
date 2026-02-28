import 'dart:convert';
import 'dart:io';

Future<Map<String, dynamic>> razorpayRequest({
  required String method,
  required String path,
  required String keyId,
  required String keySecret,
  String? body,
}) async {
  final client = HttpClient();
  try {
    final request = await client.openUrl(
      method,
      Uri.parse('https://api.razorpay.com$path'),
    );
    final token = base64Encode(utf8.encode('$keyId:$keySecret'));
    request.headers.set(HttpHeaders.authorizationHeader, 'Basic $token');
    request.headers.contentType = ContentType.json;
    if (body != null) {
      request.write(body);
    }

    final response = await request.close();
    final raw = await response.transform(utf8.decoder).join();
    final decoded = raw.isEmpty
        ? <String, dynamic>{}
        : (jsonDecode(raw) as Map<String, dynamic>);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Razorpay API failed (${response.statusCode}): $decoded');
    }
    return decoded;
  } finally {
    client.close();
  }
}
