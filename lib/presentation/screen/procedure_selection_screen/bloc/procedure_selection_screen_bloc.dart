import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_signing_config_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/util/extension/project_config_extension.dart';

class ProcedureSelectionScreenBloc extends BaseBloc<
    ProcedureSelectionScreenEvent,
    ProcedureSelectionScreenState,
    ProcedureSelectionScreenSR> {
  final GenerateSigningConfigUseCase _generateSigningConfigUseCase;

  ProcedureSelectionScreenBloc(
    this._generateSigningConfigUseCase,
  ) : super(const ProcedureSelectionScreenStateData(config: Config())) {
    on<ProcedureSelectionScreenEventInit>(_onInit);
    on<ProcedureSelectionScreenEventOnProjectOpen>(_onProjectOpen);
    on<ProcedureSelectionScreenEventOnNewProject>(_onNewProject);
    on<ProcedureSelectionScreenEventOnLocaleChange>(_onLocaleChange);
    on<ProcedureSelectionScreenEventOnAndroidSigning>(_onnAndroidSigning);
  }

  FutureOr<void> _onInit(
    ProcedureSelectionScreenEventInit event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) {
    emit(state.copyWith(
      config: event.config,
      language: Intl.getCurrentLocale(),
    ));
  }

  FutureOr<void> _onNewProject(
    ProcedureSelectionScreenEventOnNewProject event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    sourceRepository.empty();
    dataComponentRepository.empty();
    screenRepository.empty();

    emit(state.copyWith(
      config: Config(
        projectPath: event.projectPath,
        localVersion: state.config.localVersion,
        remoteVersion: state.config.remoteVersion,
      ),
    ));

    addSr(const ProcedureSelectionScreenSR.onNewProject());
  }

  FutureOr<void> _onProjectOpen(
    ProcedureSelectionScreenEventOnProjectOpen event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    final config = await configSource.getConfig(
        configPath: '${event.projectURI}/.gen_config.json');

    if (config == Config.empty()) {
      addSr(const ProcedureSelectionScreenSR.emptyConfig());
      return;
    }

    final projectName = event.projectURI.split('/').last;
    final projectPath = event.projectURI.replaceAll('/$projectName', '');

    sourceRepository.empty();
    sourceRepository.addAll(sources: config.sources);

    dataComponentRepository.empty();
    dataComponentRepository.addAll(dataComponents: config.dataComponents);

    screenRepository.empty();
    screenRepository.addAll(screens: config.screens);

    emit(state.copyWith(
      config: config.copyWith(
        projectName: projectName,
        projectPath: projectPath,
        projectExists: true,
        localVersion: state.config.localVersion,
        remoteVersion: state.config.remoteVersion,
      ),
    ));

    addSr(const ProcedureSelectionScreenSR.loadFinished());
  }

  FutureOr<void> _onLocaleChange(
    ProcedureSelectionScreenEventOnLocaleChange event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    S.load(Locale(event.language));

    emit(state.copyWith(
      language: event.language,
    ));
  }

  FutureOr<void> _onnAndroidSigning(
    ProcedureSelectionScreenEventOnAndroidSigning event,
    Emitter<ProcedureSelectionScreenState> emit,
  ) async {
    showProgress();
    String signingPassword = state.config.getSigningPassword(
      ignoreSetting: true,
    );

    final result = await _generateSigningConfigUseCase(
      params: SingingGeneratorParams(
        projectFolder: event.directory.path,
        signingVars: event.signingVars,
        signingPassword: signingPassword,
        separateFromBrick: true,
      ),
    );
    hideProgress();
    if (!result.success) {
      onFailure(result.error.failure);
      return;
    }

    addSr(
      const ProcedureSelectionScreenSR.onAndroidSigningCreated(),
    );
  }
}
