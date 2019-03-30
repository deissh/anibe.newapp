import 'dart:async';
import 'dart:convert';

import 'package:flutter_rxtable/flutter_rxtable.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class HttpException implements Exception {
  final int statusCode;
  final String message;

  HttpException(this.statusCode, this.message);

  @override
  String toString() {
    return 'HttpException{statusCode: $statusCode, message: $message}';
  }
}

enum Method {
  get,
  post,
  patch,
  put,
  delete,
}

class Request {
  final String url;
  final Method method;
  final dynamic body;

  Request({this.url, this.method, this.body});
}

class ClientModule {
  static const method2str = const {
    Method.get: "get",
    Method.post: "post",
    Method.patch: "patch",
    Method.put: "put",
    Method.delete: "delete",
  };

  String _token;
  String get token => _token;

  final Provider provider;
  Database get _db => provider.inject<Database>();

  ClientModule(this.provider);

  Future<void> init() async {
    final rows = await _db.query("auth");
    _token = rows.isEmpty ? null : rows.first['token'];
  }

  Future<void> saveToken(String token) async {
    _token = token;
    await _db.insert("auth", {"token": token});
  }

  Future<void> resetToken() async {
    _token = null;
    await _db.delete("auth");
  }

  Future<http.Response> get(String url, {Map<String, String> headers}) async {
    headers = _mergeHeaders(headers);
    return _successOrThrow(await http.get(url, headers: headers));
  }

  Future<http.Response> post(String url, {Map<String, String> headers, body, Encoding encoding}) async {
    headers = _mergeHeaders(headers);
    return _successOrThrow(await http.post(url, headers: headers, body: body, encoding: encoding));
  }

  Future<http.Response> patch(String url, {Map<String, String> headers, body, Encoding encoding}) async {
    headers = _mergeHeaders(headers);
    return _successOrThrow(await http.patch(url, headers: headers, body: body, encoding: encoding));
  }

  Future<http.Response> delete(String url, {Map<String, String> headers}) async {
    headers = _mergeHeaders(headers);
    return _successOrThrow(await http.delete(url, headers: headers));
  }

  Map<String, String> _mergeHeaders(Map<String, String> headers) {
    if (headers == null) headers = {};
    if (_token != null) headers['Authorization'] = "Bearer " + _token;
    return headers;
  }

  http.Response _successOrThrow(http.Response resp) {
    if (resp.statusCode == 200) return resp;

    String message;
    try {
      final json = jsonDecode(resp.body);
      message = json['message'];
    } catch (ex) {
      message = resp.body;
    }
    throw HttpException(resp.statusCode, message);
  }
}
