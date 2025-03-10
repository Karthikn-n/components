import 'dart:developer';

import 'package:components/components/sync/model/post_model.dart';
import 'package:components/services/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class OnlineApiService {
  static final OnlineApiService _apiService = OnlineApiService._internal();
  
  final Dio _dio = DioService.dio;

  /// Fetch the data from the API and Store it in the Repository as well in the Local Database
  /// for offline purpose
  Future<List<PostModel>> fetchPost() async {
    final String url = "https://jsonplaceholder.typicode.com/posts";
    try {
      List<PostModel> posts = [];
       final response = await _dio.get(url);
      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> postsRes = response.data;
        posts = postsRes.map((post) => PostModel.fromJson(post),).toList();
        debugPrint("Got POsts from the API client");
      }
      print("Posts length from API: ${posts.length}");
      debugPrint("Retruned empty posts");
      return posts;
    } on DioException catch(e, st) {
      log("Something wrong",error: e.toString(), stackTrace: st);
      throw e.toString();
    }
  }
  
  factory OnlineApiService() => _apiService;
  
  OnlineApiService._internal();
}