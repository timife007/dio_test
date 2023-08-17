import 'package:freezed_annotation/freezed_annotation.dart';
part 'article.freezed.dart';
part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class Article with _$Article {
  const factory Article({required int id, required String name}) = _Article;

   factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
