import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// class NetUtils {
//   static Dio _dio;
//   static final String baseUrl = 'http://127.0.0.1';

//   static void init() async {
//     Directory tempDir = await getTemporaryDirectory();
//     String tempPath = tempDir.path;
//     CookieJar cj = PersistCookieJar(dir: tempPath);
//     _dio = Dio(BaseOptions(baseUrl: '$baseUrl:3000', followRedirects: false))
//       ..interceptors.add(CookieManager(cj))
//       ..interceptors
//           .add(CustomLogInterceptor(responseBody: true, requestBody: true));
//   }

//   static Future<Response> _get(
//     BuildContext context,
//     String url, {
//     Map<String, dynamic> params,
//     bool isShowLoading = true,
//   }) async {
//     if (isShowLoading) Loading.showLoading(context);
//     try {
//       return await _dio.get(url, queryParameters: params);
//     } on DioError catch (e) {
//       if (e == null) {
//         return Future.error(Response(data: -1));
//       } else if (e.response != null) {
//         if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
//           _reLogin();
//           return Future.error(Response(data: -1));
//         } else {
//           return Future.value(e.response);
//         }
//       } else {
//         return Future.error(Response(data: -1));
//       }
//     } finally {
//       Loading.hideLoading(context);
//     }
//   }
