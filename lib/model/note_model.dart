

class Notes{
  int? id;
  String? title;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  // Category? catergory;

  Notes({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    // this.catergory,
  });
  static Notes fromMap(Map<String, Object?> map){
 final id =map['id'] as int;
 final title=map['title'] as String;
 final content=map['content'] as String;
//  final createdAt=map['createdAt'] as DateTime;
//  final updatedAt=map['updatedAt'] as DateTime;
  final createdAtString = map['createdAt'] as String?;
  final updatedAtString = map['updatedAt'] as String?;

  final createdAt = createdAtString != null ? DateTime.parse(createdAtString) : null;
  final updatedAt = updatedAtString != null ? DateTime.parse(updatedAtString) : null;

 return Notes(id: id,title: title,content: content,createdAt: createdAt,updatedAt: updatedAt);
  }
}
