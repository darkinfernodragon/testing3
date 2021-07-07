class Post {
  var userId;
  var id;
  var title;
  var body;

  Post({required this.userId,required this.id,required this.title,required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}