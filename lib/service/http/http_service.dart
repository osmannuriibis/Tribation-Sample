import 'package:http/http.dart' as http;

class HttpService {
  final baseUrl = 'https://jsonplaceholder.typicode.com/';

  Future<http.Response> get(String url) {
  return  http.get(Uri.parse(baseUrl +  url));
  }

  
}
