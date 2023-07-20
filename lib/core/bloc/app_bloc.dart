import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/config/config.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper_file_generators.dart';
import 'package:onix_flutter_bricks/data/model/local/screen/screen_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper_file_generators.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source.dart';
import 'package:onix_flutter_bricks/data/source/local/config_source_impl.dart';
import 'package:onix_flutter_bricks/data/model/local/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/domain/entity_parser/entity.dart';
import 'package:onix_flutter_bricks/domain/entity_parser/property.dart';
import 'package:onix_flutter_bricks/domain/use_case/screen/generate_screen_use_case.dart';
import 'package:onix_flutter_bricks/utils/extensions/logging.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/swagger_parser.dart';
import 'package:process_run/shell.dart';
import 'package:recase/recase.dart';
import 'package:http/http.dart' as http;

import 'app_models.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  String projectPath;

  static const String gitRef = '--git-ref swagger_parser';

  final ConfigSource _configSource = ConfigSourceImpl();

  final _generateScreenUseCase = GenerateScreenUseCase();

  AppBloc({required this.projectPath})
      : super(
            Data(projectPath: projectPath, platforms: const PlatformsList())) {
    on<Init>((event, emit) => _init(event, emit));
    on<TabChange>((event, emit) => _tabChange(event, emit));
    on<ProjectNameChange>((event, emit) => _projectNameChange(event, emit));
    on<ProjectCheck>((event, emit) => _projectCheck(event, emit));
    on<ProjectPathChange>((event, emit) => _projectPathChange(event, emit));
    on<OrganizationChange>((event, emit) => _organizationChange(event, emit));
    on<FlavorizeChange>((event, emit) => _flavorizeChange(event, emit));
    on<FlavorsChange>((event, emit) => _flavorsChange(event, emit));
    on<RouterChange>((event, emit) => _routerChange(event, emit));
    on<LocalizationChange>((event, emit) => _localizationChange(event, emit));
    on<ThemingChange>((event, emit) => _themingChange(event, emit));
    on<GenerateSigningKeyChange>(
        (event, emit) => _generateSigningKeyChange(event, emit));
    on<UseSonarChange>((event, emit) => _useSonarChange(event, emit));
    on<IntegrateDevicePreviewChange>(
        (event, emit) => _integrateDevicePreviewChange(event, emit));
    on<SigningVarsChange>((event, emit) => _signingVarsChange(event, emit));
    on<PlatformsChange>((event, emit) => _platformsChange(event, emit));
    on<GenerateProject>((event, emit) => _generateProject(event, emit));
    on<GenerateComplete>((event, emit) => _generateComplete(event, emit));
    on<OnGenerateScreensWithProject>(
        (event, emit) => _onGenerateScreensWithProject(event, emit));
    on<OnGenerateRepositoriesWithProject>(
        (event, emit) => _onGenerateRepositoriesWithProject(event, emit));
    on<ProjectChange>((event, emit) => _projectChange(event, emit));
    on<ScreenAdd>((event, emit) => _screenAdd(event, emit));
    on<EntityAdd>((event, emit) => _entityAdd(event, emit));
    on<SourceAdd>((event, emit) => _sourceAdd(event, emit));
    on<ScreenDelete>((event, emit) => _screenDelete(event, emit));
    on<EntityDelete>((event, emit) => _entityDelete(event, emit));
    on<SourceDelete>((event, emit) => _sourceDelete(event, emit));
    on<StateUpdate>((event, emit) => _stateUpdate(event, emit));
    on<ScreensGenerate>((event, emit) => _screensGenerate(event, emit));
    on<EntitiesGenerate>((event, emit) => _entitiesGenerate(event, emit));
    on<ErrorClear>((event, emit) => _errorClear(event, emit));
    on<OpenProject>((event, emit) => _openProject(event, emit));
    on<SwaggerParse>((event, emit) => _swaggerParse(event, emit));
    add(const Init());
    add(const ProjectCheck());
  }

  FutureOr<void> _swaggerParse(
      SwaggerParse event, Emitter<AppState> emit) async {
    //'https://petstore.swagger.io/v2/swagger.json'
    //'https://vocadb.net/swagger/v1/swagger.json'
    //'https://onix-systems-ar-connect-backend.staging.onix.ua/storage/openapi.json'

    //'https://onix-systems-savii-api-mvp.staging.onix.ua/api-doc/savii-public'
    //'https://gist.githubusercontent.com/cozvtieg9/71b8c0be1a3d0b27ee390c726c2c5cbe/raw/6449c5fb25a4d161c357a396e3430f3b655ad1e2/.json'

    final url = event.url.isNotEmpty
        ? event.url
        : 'https://vocadb.net/swagger/v1/swagger.json';

    try {
      var response = await http.get(Uri.parse(url));

      var json = jsonDecode(response.body);

      final parsedData = await SwaggerParser.parse(
          data: json as Map<String, dynamic>, projectName: state.projectName);

      final entities = state.entities.toList()
        ..addAll(parsedData.entities)
        ..sort((a, b) => a.name.compareTo(b.name));

      // for (final entity in entities) {
      //   if (entity.isEnum) {
      //     logger.wtf(entity.entity);
      //   }
      // }

      final sources = state.sources.toList()
        ..addAll(parsedData.sources)
        ..sort((a, b) => a.name.compareTo(b.name));

      // for (final source in parsedData.sources) {
      //   source.generateFiles(
      //       projectName: state.projectName, projectPath: projectPath);
      // }

      emit(state.copyWith(
        entities: entities.toSet(),
        sources: sources.toSet(),
      ));
    } catch (e) {
      emit(state.copyWith(
        entityError: e.toString(),
      ));
    }
  }

  FutureOr<void> _init(_, Emitter<AppState> emit) {
    emit(
      state.copyWith(
        sources: state.sources.isEmpty
            ? {
                SourceWrapper(name: 'Time', exists: true, entities: [
                  EntityWrapper(
                    name: 'Time',
                    exists: true,
                    properties: [
                      Property(
                        name: 'currentDateTime',
                        type: 'DateTime',
                      ),
                    ],
                    entity: Entity(
                      name: 'Time',
                      properties: [
                        Property(
                          name: 'currentDateTime',
                          type: 'DateTime',
                        ),
                      ],
                    )..setSourceName('Time'),
                  ),
                ])
              }
            : state.sources,
        entities: state.entities.isEmpty
            ? {
                EntityWrapper(
                  name: 'Auth',
                  exists: true,
                  properties: [
                    Property(
                      name: 'accessToken',
                      type: 'String',
                    ),
                    Property(
                      name: 'refreshToken',
                      type: 'String',
                    ),
                  ],
                  entity: Entity(
                    name: 'Auth',
                    properties: [
                      Property(
                        name: 'accessToken',
                        type: 'String',
                      ),
                      Property(
                        name: 'refreshToken',
                        type: 'String',
                      ),
                    ],
                  ),
                ),
              }
            : state.entities,
        screens: state.screens.isEmpty
            ? {ScreenEntity(name: 'home', exists: true)}
            : state.screens,
      ),
    );
  }

  FutureOr<void> _tabChange(TabChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(tab: event.tabIndex));
    //add(const ProjectCheck());
  }

  FutureOr<void> _projectPathChange(
      ProjectPathChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(projectPath: event.projectPath));
  }

  FutureOr<void> _projectNameChange(
      ProjectNameChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(projectName: event.projectName.snakeCase));
    add(const ProjectCheck());
  }

  FutureOr<void> _projectCheck(
      ProjectCheck event, Emitter<AppState> emit) async {
    var projectExists =
        await Directory('${state.projectPath}/${state.projectName}').exists();
    var projectIsClean = false;

    if (projectExists) {
      try {
        File file =
            File('${state.projectPath}/${state.projectName}/pubspec.yaml');
        String content = await file.readAsString();
        if (content.contains('#generated with mason')) {
          projectIsClean = true;
        }

        final config = await _configSource.getConfig(
          configPath:
              '${state.projectPath}/${state.projectName}/.gen_config.json',
        );

        if (config != Config.empty()) {
          emit(state.copyWith(
            projectExists: projectExists,
            projectIsClean: projectIsClean,
            screens: config.screens.toSet(),
            entities: config.entities.toSet(),
            sources: config.sources.toSet(),
          ));
        }

        return;
      } catch (e) {
        logger.e(e);

        projectIsClean = false;
      }
    }
    emit(state.copyWith(
      projectExists: projectExists,
      projectIsClean: projectIsClean,
      sources: {
        SourceWrapper(
          name: 'Time',
          exists: true,
          entities: [
            EntityWrapper(
              name: 'Time',
              exists: true,
              properties: [
                Property(
                  name: 'currentDateTime',
                  type: 'DateTime',
                ),
              ],
              entity: Entity(
                name: 'Time',
                properties: [
                  Property(
                    name: 'currentDateTime',
                    type: 'DateTime',
                  ),
                ],
              )..setSourceName('Time'),
            ),
          ],
        )
      },
      entities: {
        EntityWrapper(
          name: 'Auth',
          exists: true,
          properties: [
            Property(
              name: 'accessToken',
              type: 'String',
            ),
            Property(
              name: 'refreshToken',
              type: 'String',
            ),
          ],
          entity: Entity(
            name: 'Auth',
            properties: [
              Property(
                name: 'accessToken',
                type: 'String',
              ),
              Property(
                name: 'refreshToken',
                type: 'String',
              ),
            ],
          ),
        ),
      },
      screens: {ScreenEntity(name: 'home', exists: true)},
    ));
  }

  FutureOr<void> _organizationChange(
      OrganizationChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(organization: event.organization.hostCase()));
  }

  FutureOr<void> _flavorizeChange(_, Emitter<AppState> emit) async {
    emit(state.copyWith(flavorize: !state.flavorize));
  }

  FutureOr<void> _flavorsChange(
      FlavorsChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(flavors: event.flavors));
  }

  FutureOr<void> _routerChange(_, Emitter<AppState> emit) async {
    if (state.router == ProjectRouter.goRouter) {
      emit(state.copyWith(router: ProjectRouter.autoRouter));
    } else {
      emit(state.copyWith(router: ProjectRouter.goRouter));
    }
  }

  FutureOr<void> _localizationChange(_, Emitter<AppState> emit) async {
    if (state.localization == ProjectLocalization.intl) {
      emit(state.copyWith(localization: ProjectLocalization.flutter_gen));
    } else {
      emit(state.copyWith(localization: ProjectLocalization.intl));
    }
  }

  FutureOr<void> _themingChange(_, Emitter<AppState> emit) async {
    if (state.theming == ProjectTheming.manual) {
      emit(state.copyWith(theming: ProjectTheming.theme_tailor));
    } else {
      emit(state.copyWith(theming: ProjectTheming.manual));
    }
  }

  FutureOr<void> _generateSigningKeyChange(_, Emitter<AppState> emit) async {
    emit(state.copyWith(generateSigningKey: !state.generateSigningKey));
  }

  FutureOr<void> _useSonarChange(_, Emitter<AppState> emit) async {
    emit(state.copyWith(useSonar: !state.useSonar));
  }

  FutureOr<void> _integrateDevicePreviewChange(
      _, Emitter<AppState> emit) async {
    emit(state.copyWith(integrateDevicePreview: !state.integrateDevicePreview));
  }

  FutureOr<void> _signingVarsChange(
      SigningVarsChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(signingVars: event.signingVars));
  }

  FutureOr<void> _platformsChange(
      PlatformsChange event, Emitter<AppState> emit) async {
    emit(state.copyWith(platforms: event.platforms));
  }

  FutureOr<void> _generateProject(
      GenerateProject event, Emitter<AppState> emit) async {
    emit(state.copyWith(generatingState: GeneratingState.generating));

    String genPass = '';

    if (state.generateSigningKey) {
      if (state.signingVars[6].isEmpty) {
        var chars =
            'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

        genPass = List.generate(20, (index) {
          return chars[(Random.secure().nextInt(chars.length))];
        }).join();
      } else {
        genPass = state.signingVars[6];
      }
    }

    if (!state.projectExists && state.projectName.isNotEmpty) {
      var configFile = await File('${state.projectPath}/config.json').create();

      var flavors = <String>{};

      if (state.flavors.isNotEmpty) {
        flavors = state.flavors.contains(' ')
            ? state.flavors
                .toLowerCase()
                .trim()
                .replaceAll(RegExp(' +'), ' ')
                .split(' ')
                .toSet()
            : {state.flavors.toLowerCase()};

        for (var flavor in flavors) {
          if (flavor.isEmpty || flavor == ' ') {
            flavors.remove(flavor);
          }
        }

        flavors
          ..remove('dev')
          ..remove('prod');
      }

      await configFile.writeAsString(jsonEncode({
        'signing_password': genPass,
        'project_name_dirt': state.projectName,
        'project_org': state.organization,
        'flavorizr': state.flavorize,
        'flavors': flavors.toList(),
        'navigation': state.router.name,
        'localization': state.localization.name,
        'use_keytool': state.generateSigningKey,
        'use_sonar': state.useSonar,
        'device_preview': state.integrateDevicePreview,
        'platforms': state.platforms.toString(),
        'theme_generate': state.theming.name == 'theme_tailor',
      }).toString());

      outputService.add('{#info}Getting mason & brick...');

      var mainProcess = await startProcess(workingDirectory: state.projectPath);

      mainProcess.stdin.writeln(
          'mason add -g flutter_clean_base --git-url git@gitlab.onix.ua:onix-systems/flutter-project-generator.git --git-path bricks/flutter_clean_base ${gitRef.isNotEmpty ? gitRef : ''}');
      mainProcess.stdin.writeln(
          'mason make flutter_clean_base -c config.json --on-conflict overwrite');

      await mainProcess.exitCode;
      configFile.delete();

      if (state.generateSigningKey) {
        outputService.add('{info}Keystore password: $genPass');

        var signingProcess = await startProcess(
            activateMason: false,
            workingDirectory:
                '${state.projectPath}/${state.projectName}/android/app/signing');

        signingProcess.stdin.writeln(
            'keytool -genkey -v -keystore upload-keystore.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000 -keypass $genPass -storepass $genPass -dname "CN=${state.signingVars[0]}, OU=${state.signingVars[1]}, O=${state.signingVars[2]}, L=${state.signingVars[3]}, S=${state.signingVars[4]}, C=${state.signingVars[5]}"');

        //var exitCode = await signingProcess.exitCode;
      }

      if (state.generateScreensWithProject && state.screens.isNotEmpty) {
        add(const ScreensGenerate());
      } else if (state.generateEntitiesWithProject &&
          state.entities.isNotEmpty) {
        add(const EntitiesGenerate());
      } else {
        Config.saveConfig(state);
        emit(state.copyWith(
            projectExists: true, generatingState: GeneratingState.waiting));
      }
    }
  }

  FutureOr<void> _generateComplete(
      GenerateComplete event, Emitter<AppState> emit) async {
    add(const ProjectCheck());
    emit(state.copyWith(generatingState: GeneratingState.init));
  }

  FutureOr<void> _onGenerateScreensWithProject(
      OnGenerateScreensWithProject event, Emitter<AppState> emit) async {
    emit(state.copyWith(
        generateScreensWithProject: event.generateScreensWithProject));
  }

  FutureOr<void> _onGenerateRepositoriesWithProject(
      OnGenerateRepositoriesWithProject event, Emitter<AppState> emit) async {
    emit(state.copyWith(
        generateEntitiesWithProject: event.generateRepositoriesWithProject));
  }

  FutureOr<void> _projectChange(
      ProjectChange event, Emitter<AppState> emit) async {
    var path = event.projectPath.split('/');
    var projectName = path.last;
    var projectPath = path.sublist(0, path.length - 1).join('/');

    emit(state.copyWith(projectPath: projectPath, projectName: projectName));
  }

  FutureOr<void> _screenAdd(ScreenAdd event, Emitter<AppState> emit) async {
    var screens = state.screens.toList();
    if (state.screens
        .where((element) => element.name == event.screen.name)
        .isNotEmpty) {
      emit(state.copyWith(
          screenError: '${event.screen.name.pascalCase}Screen already exists'));
      return;
    }
    if (!state.generateScreensWithProject && state.projectExists) {
      try {
        File file = File(
            '${state.projectPath}/${state.projectName}/lib/core/router/app_router.dart');
        String content = await file.readAsString();

        if (content.contains('${event.screen.name.pascalCase}Screen')) {
          emit(state.copyWith(
              screenError:
                  '${event.screen.name.pascalCase}Screen already exists'));
          return;
        }
      } catch (e) {
        logger.e(e);
      }
    }
    screens.add(event.screen);
    emit(state.copyWith(screens: screens.toSet()));
  }

  FutureOr<void> _entityAdd(EntityAdd event, Emitter<AppState> emit) async {
    if (state.entities
        .where((element) => element.name == event.entity.name)
        .isNotEmpty) {
      emit(state.copyWith(
          entityError:
              'Entity ${event.entity.name.pascalCase} already exists'));
      return;
    } else {
      for (var source in state.sources) {
        for (var entity in source.entities) {
          if (entity.name == event.entity.name) {
            emit(state.copyWith(
                entityError:
                    'Entity ${event.entity.name.pascalCase} already exists in ${source.name.titleCase}Source'));
            return;
          }
        }
      }
    }

    var entity = event.entity;

    entity.properties = [Property(name: 'name', type: 'string')];

    entity.entity = Entity(
      name: entity.name.pascalCase,
      properties: entity.properties,
    );

    if (event.source == null) {
      var entities = state.entities.toList();

      entities.add(event.entity);
      emit(state.copyWith(entities: entities.toSet()));
    } else {
      var entities = event.source?.entities.toList() ?? [];
      var entity = event.entity;
      entity.entity.sourceName = event.source?.name ?? '';
      entities.add(event.entity);
      var sources = state.sources.toList();

      sources.firstWhere((source) => source == event.source).entities =
          entities;
      emit(state.copyWith(sources: sources.toSet()));
      add(const StateUpdate());
    }
  }

  FutureOr<void> _sourceAdd(SourceAdd event, Emitter<AppState> emit) async {
    if (state.sources
        .where((element) => element.name == event.source.name)
        .isNotEmpty) {
      emit(state.copyWith(
          entityError: '${event.source.name.pascalCase}Source already exists'));
      return;
    }

    var sources = state.sources.toList();

    sources.add(event.source);
    emit(state.copyWith(sources: sources.toSet()));
  }

  FutureOr<void> _screenDelete(
      ScreenDelete event, Emitter<AppState> emit) async {
    var screens = state.screens.toList();
    screens.remove(event.screen);
    emit(state.copyWith(screens: screens.toSet()));
  }

  FutureOr<void> _entityDelete(
      EntityDelete event, Emitter<AppState> emit) async {
    if (event.source == null) {
      var entities = state.entities.toList();
      entities.remove(event.entity);
      emit(state.copyWith(entities: entities.toSet()));
    } else {
      var entities = event.source?.entities.toList() ?? [];
      entities.remove(event.entity);
      var sources = state.sources.toList();
      sources.firstWhere((source) => source == event.source).entities =
          entities;
      emit(state.copyWith(sources: sources.toSet()));
      add(const StateUpdate());
    }
    add(const StateUpdate());
  }

  FutureOr<void> _sourceDelete(
      SourceDelete event, Emitter<AppState> emit) async {
    var sources = state.sources.toList();
    sources.remove(event.source);
    emit(state.copyWith(sources: sources.toSet()));
  }

  FutureOr<void> _stateUpdate(_, Emitter<AppState> emit) async {
    emit(state.copyWith(stateUpdate: DateTime.now().millisecondsSinceEpoch));
  }

  FutureOr<void> _screensGenerate(
      ScreensGenerate event, Emitter<AppState> emit) async {
    if (state.screens.where((element) => !element.exists).isNotEmpty) {
      emit(state.copyWith(generatingState: GeneratingState.generating));
      var mainProcess = await startProcess(
          workingDirectory: '${state.projectPath}/${state.projectName}');

      for (var screen in state.screens.where((element) => !element.exists)) {
        outputService.add('{#info}Generating screen ${screen.name}...');

        await _generateScreenUseCase(
          screen: screen,
          projectPath: state.projectPath,
          projectName: state.projectName,
          router: state.router,
        );

        if (screen == state.screens.last) {
          mainProcess.stdin.writeln(
              'dart run build_runner build --delete-conflicting-outputs && echo "Complete with exit code: 0"');
          outputService.add('{#info}Complete with exit code: 0');
        }
      }

      await mainProcess.exitCode;
      outputService.add('{#info}Screens generated!');
    }

    if (state.generateEntitiesWithProject && state.entities.isNotEmpty) {
      add(const EntitiesGenerate());
    } else {
      Config.saveConfig(state);
      emit(state.copyWith(
          generatingState: GeneratingState.waiting,
          screens: {},
          generateScreensWithProject: false));
    }
  }

  FutureOr<void> _entitiesGenerate(
      EntitiesGenerate event, Emitter<AppState> emit) async {
    var needToGenerateEntities =
        state.entities.where((entity) => !entity.exists).isNotEmpty;

    var needToGenerateSources =
        state.sources.where((source) => !source.exists).isNotEmpty;

    if (!needToGenerateSources) {
      for (var source in state.sources) {
        if (source.entities.where((entity) => !entity.exists).isNotEmpty) {
          needToGenerateSources = true;
          break;
        }
      }
    }

    if (needToGenerateEntities || needToGenerateSources) {
      emit(state.copyWith(generatingState: GeneratingState.generating));

      if (needToGenerateEntities) {
        for (final entity in state.entities.where((e) => !e.exists)) {
          await entity.generateFiles(
            projectPath: projectPath,
            projectName: state.projectName,
          );
        }
      }

      if (needToGenerateSources) {
        final sources = state.sources
            .where((source) =>
                source.entities.where((entity) => entity.exists).isEmpty)
            .toList();
        for (var source in sources) {
          for (final entity in source.entities.where((e) =>
              !e.exists &&
              //TODO: fix this
              !source.paths.any((path) => path.methods.any((method) => method
                  .innerEnums
                  .any((innerEnum) => innerEnum.name == e.name))))) {
            await entity.generateFiles(
              projectPath: projectPath,
              projectName: state.projectName,
            );
          }

          await source.generateFiles(
            projectPath: projectPath,
            projectName: state.projectName,
            allSources: state.sources,
          );
        }
      }
      outputService.add('{#info}Generating entities!');

      final mainProcess = await Process.run('dart',
          ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
          workingDirectory: '${state.projectPath}/${state.projectName}');

      outputService.add(mainProcess.outText);
      outputService.add(mainProcess.errText);

      final sorterProcess = await Process.run(
          'flutter', ['pub', 'run', 'import_sorter:main', '--no-comments'],
          workingDirectory: '${state.projectPath}/${state.projectName}');

      outputService.add(sorterProcess.outText);
      outputService.add(sorterProcess.errText);

      final formatProcess = await Process.run(
        'dart',
        ['format', '.'],
        workingDirectory: '${state.projectPath}/${state.projectName}',
      );

      outputService.add(formatProcess.outText);
      outputService.add(formatProcess.errText);

      outputService.add('{#info}Entities generated!');
    }

    Config.saveConfig(state);
    emit(state.copyWith(
        generatingState: GeneratingState.waiting,
        entities: {},
        sources: {},
        generateEntitiesWithProject: false));
  }

  FutureOr<void> _errorClear(_, Emitter<AppState> emit) async {
    emit(state.copyWith(screenError: '', entityError: ''));
  }

  FutureOr<void> _openProject(OpenProject event, Emitter<AppState> emit) async {
    Process.run('studio', ['.'],
        workingDirectory: '${state.projectPath}/${state.projectName}');
  }

  Future<Process> startProcess(
      {required String workingDirectory,
      bool activateMason = true,
      bool exitOnSucceeded = false}) async {
    var mainProcess =
        await Process.start('zsh', [], workingDirectory: workingDirectory);

    mainProcess.log(exitOnSucceeded: exitOnSucceeded);
    mainProcess.stdin.writeln('source \$HOME/.zshrc');
    mainProcess.stdin.writeln('source \$HOME/.bash_profile');

    if (activateMason) {
      mainProcess.stdin.writeln('dart pub global activate mason_cli');
      mainProcess.stdin.writeln('mason cache clear');
    }

    return mainProcess;
  }
}

extension MyCase on String {
  String hostCase() {
    Iterable<String> strings = split('-');

    strings = strings.map((e) => e.dotCase);

    return strings.join('-');
  }
}
