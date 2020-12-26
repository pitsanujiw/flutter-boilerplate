import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// pkg
import 'package:flutter_boilerplate/utils/utils.dart';

HttpRequest httpRequest = HttpRequest();

class HttpRequest {
  // ------------------ SINGLETON -----------------------
  static final HttpRequest _httpRequest = HttpRequest._internal();
  factory HttpRequest() => _httpRequest;
  HttpRequest._internal();
  Future<String> getToken() async {
    return await preferences.getString('token');
  }

  Future<Map<String, String>> getHeader(String i18n) async {
    String token = await getToken();
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token ?? '',
      'Accept-Language': i18n ?? 'en',
    };
  }

  /// ----------------------------------------------------------
  /// Generic HTTP REQUEST for fetch API, #GET
  /// ----------------------------------------------------------
  Future<dynamic> getApi({String url, String i18n}) async {
    try {
      Map<String, String> headers = await getHeader(i18n);
      final Response resp =
          await http.get(url, headers: headers).timeout(Duration(seconds: 10));
      return resp.statusCode == 200
          ? await jsonDecode(resp.body)
          : await jsonDecode(resp.body);
    } catch (e) {
      return null;
    }
  }

  /// ----------------------------------------------------------
  /// Generic HTTP REQUEST for fetch API, #POST
  /// ----------------------------------------------------------
  Future<dynamic> postApi({String url, dynamic body, String i18n}) async {
    try {
      Map<String, String> headers = await getHeader(i18n);
      final Response resp = await http.post(url, headers: headers, body: body);
      return resp.statusCode == 200
          ? await jsonDecode(resp.body)
          : await jsonDecode(resp.body);
    } catch (e) {
      return null;
    }
  }

  /// ----------------------------------------------------------
  /// Generic HTTP REQUEST for fetch API, #PUT
  /// ----------------------------------------------------------
  Future<dynamic> putApi({String url, dynamic body, String i18n}) async {
    try {
      Map<String, String> headers = await getHeader(i18n);
      final resp = await http.put(url, headers: headers, body: body);
      return resp.statusCode == 200
          ? await jsonDecode(resp.body)
          : await jsonDecode(resp.body ?? {});
    } catch (e) {
      return null;
    }
  }

  /// ----------------------------------------------------------
  /// Generic HTTP REQUEST for fetch API, #PATCH
  /// ----------------------------------------------------------
  Future<dynamic> patchApi({String url, dynamic body, String i18n}) async {
    try {
      Map<String, String> headers = await getHeader(i18n);
      final resp = await http.patch(url, headers: headers, body: body);
      return resp.statusCode == 200
          ? await jsonDecode(resp.body)
          : await jsonDecode(resp.body ?? {});
    } catch (e) {
      return null;
    }
  }

  /// ----------------------------------------------------------
  /// Generic HTTP REQUEST for fetch API, #DELETE
  /// ----------------------------------------------------------
  Future<dynamic> deleteApi({String url, String i18n}) async {
    try {
      Map<String, String> headers = await getHeader(i18n);
      final resp = await http.delete(url, headers: headers);
      return resp.statusCode == 200
          ? await jsonDecode(resp.body)
          : await jsonDecode(resp.body ?? {});
    } catch (e) {
      return null;
    }
  }
}
