abstract class saved{
  static const String collectionName = 'savedPosts';
  String id;
  String caption ;
  String imageUrl;
  bool isDone;
  saved({required this.id,required this.caption, required this.imageUrl,this.isDone = false});


 saved.fromJson(Map<String, Object?> json)
      : this(
    id:json['id']! as String,
    caption: json['caption']!as String,
    imageUrl: json['imageUrl']!as String,
    isDone: json['isDone'] !as bool,
  );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'caption': caption,
      'imageUrl': imageUrl,
      'isDone': isDone,
    };
  }

}