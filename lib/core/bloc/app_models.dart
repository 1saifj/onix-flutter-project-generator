import 'dart:async';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/data/model/local/colored_line.dart';
import 'package:onix_flutter_bricks/data/model/local/screen_entity.dart';
import 'package:onix_flutter_bricks/presentation/screens/main_page/utils/platforms_list.dart';

part 'app_models.freezed.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.init({
    required String projectPath,
  }) = Init;

  const factory AppEvent.onTabChange({
    required int tabIndex,
  }) = TabChange;

  const factory AppEvent.onProjectPathChange({
    required String projectPath,
  }) = ProjectPathChange;

  const factory AppEvent.onProjectNameChange({
    required String projectName,
    required TextPosition textPosition,
  }) = ProjectNameChange;

  const factory AppEvent.projectCheck() = ProjectCheck;

  const factory AppEvent.onOrganizationChange({
    required String organization,
  }) = OrganizationChange;

  const factory AppEvent.onFlavorizeChange() = FlavorizeChange;

  const factory AppEvent.onFlavorsChange({
    required String flavors,
  }) = FlavorsChange;

  const factory AppEvent.onRouterChange() = RouterChange;

  const factory AppEvent.onLocalizationChange() = LocalizationChange;

  const factory AppEvent.onGenerateSigningKeyChange() =
      GenerateSigningKeyChange;

  const factory AppEvent.onUseSonarChange() = UseSonarChange;

  const factory AppEvent.onIntegrateDevicePreviewChange() =
      IntegrateDevicePreviewChange;

  const factory AppEvent.onSigningVarsChange({
    required List<String> signingVars,
  }) = SigningVarsChange;

  const factory AppEvent.onPlatformsChange({
    required PlatformsList platforms,
  }) = PlatformsChange;

  const factory AppEvent.onThemingChange() = ThemingChange;

  const factory AppEvent.onGenerateProject(
          {required StreamController<ColoredLine> outputStreamController}) =
      GenerateProject;

  const factory AppEvent.onGenerateComplete() = GenerateComplete;

  const factory AppEvent.onScreenProjectChange({
    required String screenProjectPath,
  }) = ScreenProjectChange;

  const factory AppEvent.onScreenAdd({
    required ScreenEntity screen,
  }) = ScreenAdd;

  const factory AppEvent.onScreenDelete({
    required ScreenEntity screen,
  }) = ScreenDelete;

  const factory AppEvent.onStateUpdate() = StateUpdate;

  const factory AppEvent.onScreensGenerate({
    required StreamController<ColoredLine> outputStreamController,
  }) = ScreensGenerate;

  const factory AppEvent.onErrorClear() = ErrorClear;
}

@freezed
class AppState with _$AppState {
  const factory AppState.data({
    required String projectPath,
    @Default('new_project')
        String projectName,
    @Default(false)
        bool projectExists,
    @Default(false)
        bool projectIsClean,
    @Default('com.example')
        String organization,
    @Default(false)
        bool flavorize,
    @Default({})
        Set<String> flavors,
    @Default(ProjectRouter.goRouter)
        ProjectRouter router,
    @Default(ProjectLocalization.intl)
        ProjectLocalization localization,
    @Default(true)
        bool generateSigningKey,
    @Default(true)
        bool useSonar,
    @Default(false)
        bool integrateDevicePreview,
    @Default([
      'Some developer',
      'Flutter dep',
      'Onix-Systems',
      'Kropyvnytskyi',
      'Kirovohrad oblast',
      'UA'
    ])
        List<String> signingVars,
    required PlatformsList platforms,
    @Default(0)
        int tab,
    @Default(GeneratingState.init)
        GeneratingState generatingState,
    @Default(ProjectTheming.manual)
        ProjectTheming theming,
    @Default({})
        Set<ScreenEntity> screens,
    @Default('')
        String screenError,
    @Default(0)
        int stateUpdate,
  }) = Data;
}

enum ProjectRouter { goRouter, autoRouter }

enum ProjectLocalization { intl, flutter_gen }

enum ProjectTheming { manual, theme_tailor }

enum GeneratingState { init, generating, waiting }
