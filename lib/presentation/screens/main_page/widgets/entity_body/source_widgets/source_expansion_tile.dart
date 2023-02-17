import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/source_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/add_entity_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/source_widgets/add_source_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/entity_body/entity_widgets/entity_table.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/widgets/screen_body/screen_table_cell.dart';
import 'package:recase/recase.dart';

class SourceExpansionTile extends StatefulWidget {
  const SourceExpansionTile(
      {required this.source,
      required this.isFirst,
      required this.isLast,
      Key? key})
      : super(key: key);

  final SourceEntity source;
  final bool isFirst;
  final bool isLast;

  @override
  State<SourceExpansionTile> createState() => _SourceExpansionTileState();
}

class _SourceExpansionTileState extends State<SourceExpansionTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.source.entities.isNotEmpty) {
          setState(() {
            expanded = !expanded;
          });
        }
      },
      child: CupertinoListTile(
        padding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: const Border(
              top: BorderSide(
                color: CupertinoColors.systemGrey,
                width: 1,
              ),
              bottom: BorderSide(
                color: CupertinoColors.systemGrey,
                width: 1,
              ),
              left: BorderSide(
                color: CupertinoColors.systemGrey,
                width: 1,
              ),
              right: BorderSide(
                color: CupertinoColors.systemGrey,
                width: 1,
              ),
            ),
            color: CupertinoColors.activeBlue.withOpacity(0.1),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cell(
                    value: Text('${widget.source.name.pascalCase}Source'),
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
                                showCupertinoModalPopup<SourceEntity>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) =>
                                      AddSourceDialog(source: widget.source),
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
                                showCupertinoModalPopup<EntityEntity>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => AddEntityDialog(
                                    entity: null,
                                    standalone: false,
                                  ),
                                ).then((entity) {
                                  if (entity != null) {
                                    context.read<AppBloc>().add(
                                          EntityAdd(
                                              entity: entity,
                                              source: widget.source),
                                        );
                                  }
                                });
                              },
                              child: const Text('Add entity'),
                            ),
                            const SizedBox(width: 10),
                            CupertinoButton(
                              color: CupertinoColors.activeOrange,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () {
                                context.read<AppBloc>().add(
                                      SourceDelete(source: widget.source),
                                    );
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (widget.source.entities.isNotEmpty)
                    Icon(
                      expanded
                          ? CupertinoIcons.chevron_up
                          : CupertinoIcons.chevron_down,
                      color: CupertinoColors.activeOrange,
                    )
                  else
                    const SizedBox(width: 24),
                ],
              ),
              if (widget.source.entities.isNotEmpty && expanded) ...[
                EntityTable(
                  entities: widget.source.entities.toSet(),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
