import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity/property.dart';

part 'class_entity.g.dart';

@JsonSerializable()
class ClassEntity implements Entity {
  @override
  final String name;
  @override
  final List<Property> properties;
  final Set<String> imports = {};

  ClassEntity({
    required this.name,
    required this.properties,
  });

  factory ClassEntity.fromJson(Map<String, dynamic> json) =>
      _$ClassEntityFromJson(json);

  void addImports(List<String> imports) {
    this.imports.addAll(imports);
  }

  @override
  String toString() {
    var result = '';

    result += '$name {';

    for (final property in properties) {
      result += '\n     $property';
    }

    result += '\n}\n';

    result += '\nimports: $imports';
    return result;
  }

  @override
  String generateClassBody() {
    var result = '';

    result += '@freezed\n';

    result += 'class $name with _\$$name {\n';
    result += '  factory $name({\n';

    for (final property in properties) {
      result += '\n     $property,';
    }

    result += '\n  }) = _$name;\n';

    result += '\n}';

    return result;
  }
}
