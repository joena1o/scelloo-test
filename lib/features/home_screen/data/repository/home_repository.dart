import 'dart:convert';
import 'package:scelloo_blog_app/data/connection.dart';
import 'package:scelloo_blog_app/data/data_provider.dart';
import 'package:scelloo_blog_app/features/home_screen/data/models/post_model.dart';

class HomeRepository {
  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "$conn/posts", auth: null);
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List;
        List<PostModel>? posts = result.map((element)=> PostModel.fromJson(element)).toList();
        return posts;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final result = json.decode(response.body);
        throw result['error'];
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<PostModel> addPost(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/posts", body: body, auth: null);
      if (response.statusCode >= 200 && response.statusCode <=300) {
        final result = json.decode(response.body);
        PostModel post = PostModel.fromJson(result);
        return post;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final result = json.decode(response.body);
        throw result['error'];
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }
}