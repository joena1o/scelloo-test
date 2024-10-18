class PostComment {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  PostComment({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  // Factory constructor to create an instance from JSON
  factory PostComment.fromJson(Map<String, dynamic> json) {
    return PostComment(
      postId: json['postId'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      body: json['body'] as String?,
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}
