import 'package:components/components/sync/model/post_model.dart';
import 'package:components/components/sync/service/local_db_service.dart';
import 'package:components/components/sync/service/online_api_service.dart';
import 'package:flutter/material.dart';

class PostRepository {
  static final OnlineApiService apiClient = OnlineApiService();


  static Future<List<PostModel>> fetchPosts() async {
    try {
      await LocalDbService.initDatabase();
      // Try to fetch the POSt from the API client
      final List<PostModel> apiClientPosts = await apiClient.fetchPost();
      print("Fetched");
      // If it successfully feteched the Data from the api return it after storing into the localdb
      await LocalDbService.addPosts(apiClientPosts);
      print("Added to local db");
      return apiClientPosts;
    } catch (e) {
      // If APi throws error or connection is not available it will send the POsts from the Local db
      final List<PostModel> localPosts = await LocalDbService.getAllPosts();
      debugPrint("Local posts: ${localPosts.length}");
      if(localPosts.isNotEmpty){
        return localPosts;
      } else {
        throw Exception("Posts are not found");
      }
    }
  }
}