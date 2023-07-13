import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Spirit {
  String index_id;
  String name;
  String description;
  String core_type;
  String image;

  Spirit({
    this.name = '',
    this.core_type = '',
    this.description = '',
    this.index_id = '',
    this.image = '',
  });
  factory Spirit.fromJson(Map<String, dynamic> json) => _$SpiritFromJson(json);
  Map<String, dynamic> toJson() => _$SpiritToJson(this);
}
