import 'dart:convert';
import 'package:scelloo_blog_app/data/connection.dart';
import 'package:scelloo_blog_app/data/data_provider.dart';
import 'package:scelloo_blog_app/features/post_page/data/model/comment_model.dart';

class PostRepository {
  Future<List<PostComment>> getAllPosts(String id) async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "$conn/posts/$id/comments", auth: null);
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List;
        List<PostComment>? postComments = result.map((element)=> PostComment.fromJson(element)).toList();
        return postComments;
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
