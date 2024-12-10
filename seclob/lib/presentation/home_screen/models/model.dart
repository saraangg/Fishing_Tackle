class Media {
  String? id;
  String? userId;
  String? fileType;
  String? fileName;
  String? filePath;
  String? key;
  String? description;
  int? likeCount;
  int? commentCount;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? lastLikedUserName;
  String? lastCommentedUserName;
  bool? isLiked;
  bool? story;
  String? createdAt;
  String? updatedAt;
  List<LikedBy>? likedBy;
  List<Comment>? comments;
  final String type;

  Media({
    required this.type,
    this.id,
    this.userId,
    this.fileType,
    this.fileName,
    this.filePath,
    this.key,
    this.description,
    this.likeCount,
    this.commentCount,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.lastLikedUserName,
    this.lastCommentedUserName,
    this.isLiked,
    this.story,
    this.createdAt,
    this.updatedAt,
    this.likedBy,
    this.comments,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['_id'],
      userId: json['userId'],
      fileType: json['fileType'],
      fileName: json['fileName'],
      filePath: json['filePath'],
      key: json['key'],
      description: json['description'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePic: json['profilePic'],
      lastLikedUserName: json['lastLikedUserName'],
      lastCommentedUserName: json['lastCommentedUserName'],
      isLiked: json['isLiked'],
      story: json['story'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      type: json['type'] ?? 'unknown', // Provide a default value for type
      likedBy: json['likedBy'] != null
          ? List<LikedBy>.from(json['likedBy'].map((x) => LikedBy.fromJson(x)))
          : null,
      comments: json['commentId'] != null
          ? List<Comment>.from(json['commentId'].map((x) => Comment.fromJson(x)))
          : null,
    );
  }
}

class LikedBy {
  String? id;
  String? firstName;
  String? lastName;

  LikedBy({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory LikedBy.fromJson(Map<String, dynamic> json) {
    return LikedBy(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

class Comment {
  final User userId;
  final String text;

  Comment({
    required this.userId,
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw Exception('Failed to parse Comment from null JSON');
    }
    return Comment(
      userId: User.fromJson(json['userId']),
      text: json['text'] ?? '', // Provide a default value if 'text' is null
    );
  }
}


class User {
  final String firstName;
  final String lastName;

  User({
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw Exception('Failed to parse User from null JSON');
    }
    return User(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }
}