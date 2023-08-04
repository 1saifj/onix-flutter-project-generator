import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';

abstract class DataComponentRepository {
  Set<DataComponent> get dataComponents;

  bool isEnum(String name);

  Set<String> getEnumNames();

  void parse(Map<String, dynamic> data);

  DataComponent? getDataComponentByName(String name);
}
