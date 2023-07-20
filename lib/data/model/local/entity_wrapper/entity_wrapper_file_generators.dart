import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_class_entity.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_enum_entity.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_mapper.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_request.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_response.dart';

extension FileGenerator on EntityWrapper {
  Future<void> generateFiles({
    required String projectName,
    required String projectPath,
  }) async {
    if (entity.isEnum) {
      GenerateEnumEntity()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    } else {
      GenerateClassEntity()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    }
    if (!entity.isEnum && generateResponse) {
      GenerateResponse()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    }
    if (!entity.isEnum && generateRequest) {
      GenerateRequest()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    }
    if (!entity.isEnum && (generateRequest || generateResponse)) {
      GenerateMapper()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    }
  }
}
