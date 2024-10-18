import 'dart:convert';
import 'package:http/http.dart' as http;

class DataProvider {
  static Future<http.Response> getRequest(
      {required String endpoint, final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.get(Uri.parse(endpoint), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> postRequest(
      {required String endpoint,
      required Map<String, dynamic> body,
      final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.post(Uri.parse(endpoint),
          body: json.encode(body), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> deleteRequest(
      {required String endpoint,
      required Map<String, dynamic> body,
      final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.delete(Uri.parse(endpoint),
          body: json.encode(body), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> updateRequest(
      {required String endpoint,
      required Map<String, dynamic> body,
      final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.put(Uri.parse(endpoint),
          body: json.encode(body), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> patchRequest(
      {required String endpoint,
      required Map<String, dynamic> body,
      final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.patch(Uri.parse(endpoint),
          body: json.encode(body), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
