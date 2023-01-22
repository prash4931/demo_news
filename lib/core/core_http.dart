import 'package:http/http.dart' as http;

Future<http.Response> getHttp({required String url}) {
  return http.get(Uri.parse(url));
}
