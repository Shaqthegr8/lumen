import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://localhost:3000/api";

  Future<http.Response> registerUser(Map<String, dynamic> userData) {
    return http.post(
      Uri.parse('$baseUrl/users/register'),
      body: userData,
    );
  }

  Future<http.Response> loginUser(Map<String, dynamic> userData) {
    return http.post(
      Uri.parse('$baseUrl/users/login'),
      body: userData,
    );
  }

  Future<http.Response> getTopics(String token) {
    return http.get(
      Uri.parse('$baseUrl/topics'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> updateProgress(
      Map<String, dynamic> progressData, String token) {
    return http.post(
      Uri.parse('$baseUrl/progress'),
      body: progressData,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
