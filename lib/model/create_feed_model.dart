class CreateFeedModel {
  String content;
  List<String>? mediaIds;

  CreateFeedModel({
    required this.content,
    this.mediaIds,
  });

  factory CreateFeedModel.fromJson(Map<String, dynamic> json) {
    return CreateFeedModel(
      content: json['content'] as String,
      mediaIds: json['mediaIds'] as List<String>,
    );
  }
}
