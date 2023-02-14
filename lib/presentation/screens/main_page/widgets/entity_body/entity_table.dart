import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/add_entity_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/screen_table_cell.dart';
import 'package:recase/recase.dart';

class EntityTable extends StatelessWidget {
  const EntityTable({required this.entities, Key? key}) : super(key: key);

  final Set<EntityEntity> entities;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: CupertinoColors.systemGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: CupertinoColors.systemGrey,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: const [
                Cell(
                  value: Text('Entity', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Gen request', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Gen response', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Gen repository', textAlign: TextAlign.center),
                  decorated: true,
                ),
                Cell(
                  value: Text('Actions', textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          ...entities.map(
            (entity) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: entity != entities.last
                      ? const BorderSide(
                          color: CupertinoColors.systemGrey,
                          width: 1,
                        )
                      : BorderSide.none,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cell(
                    value: Text('${entity.name.pascalCase}Entity'),
                    decorated: true,
                  ),
                  Cell(
                    value: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSHCheckbox(
                          value: entity.generateRequest,
                          onChanged: (_) {},
                          isDisabled: true,
                          duration: const Duration(milliseconds: 200),
                          colorConfig:
                              MSHColorConfig.fromCheckedUncheckedDisabled(
                            checkedColor: CupertinoColors.activeOrange,
                            uncheckedColor: CupertinoColors.activeOrange,
                            disabledColor: CupertinoColors.activeOrange,
                          ),
                        ),
                      ],
                    ),
                    decorated: true,
                  ),
                  Cell(
                    value: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSHCheckbox(
                          value: entity.generateResponse,
                          onChanged: (_) {},
                          isDisabled: true,
                          duration: const Duration(milliseconds: 200),
                          colorConfig:
                              MSHColorConfig.fromCheckedUncheckedDisabled(
                            checkedColor: CupertinoColors.activeOrange,
                            uncheckedColor: CupertinoColors.activeOrange,
                            disabledColor: CupertinoColors.activeOrange,
                          ),
                        ),
                      ],
                    ),
                    decorated: true,
                  ),
                  Cell(
                    value: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MSHCheckbox(
                          value: entity.generateRepository,
                          onChanged: (_) {},
                          isDisabled: true,
                          duration: const Duration(milliseconds: 200),
                          colorConfig:
                              MSHColorConfig.fromCheckedUncheckedDisabled(
                            checkedColor: CupertinoColors.activeOrange,
                            uncheckedColor: CupertinoColors.activeOrange,
                            disabledColor: CupertinoColors.activeOrange,
                          ),
                        ),
                      ],
                    ),
                    decorated: true,
                  ),
                  Cell(
                    value: SizedBox(
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                              color: CupertinoColors.activeOrange,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () {
                                showCupertinoModalPopup<EntityEntity>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) =>
                                      AddEntityDialog(entity: entity),
                                ).then((entity) {
                                  if (entity != null) {
                                    context.read<AppBloc>().add(
                                          const StateUpdate(),
                                        );
                                  }
                                });
                              },
                              child: const Text('Modify'),
                            ),
                            const SizedBox(width: 10),
                            CupertinoButton(
                              color: CupertinoColors.activeOrange,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () {
                                context.read<AppBloc>().add(
                                      EntityDelete(entity: entity),
                                    );
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
