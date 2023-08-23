import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/bloc/splash_screen_bloc_imports.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreenBloc
    extends BaseBloc<SplashScreenEvent, SplashScreenState, SplashScreenSR> {
  SplashScreenBloc() : super(const SplashScreenState.data()) {
    on<SplashScreenEventInit>(_onInit);
    on<SplashScreenEventOnAnimationFinished>(_onAnimationFinished);
    add(const SplashScreenEvent.init());
  }

  FutureOr<void> _onInit(
    SplashScreenEventInit event,
    Emitter<SplashScreenState> emit,
  ) async {
    emit(state.copyWith(logoVisible: true));
  }

  FutureOr<void> _onAnimationFinished(
    SplashScreenEventOnAnimationFinished event,
    Emitter<SplashScreenState> emit,
  ) async {
    final packageInfo = await PackageInfo.fromPlatform();

    final localVersion = packageInfo.version;

    var mainProcess = await Process.start('zsh', []);

    String remoteVersion = '';

    mainProcess.stdout.transform(utf8.decoder).listen((event) {
      if (event.contains('version: ')) {
        remoteVersion = event.replaceAll('version: ', '').split('+').first;
        mainProcess.kill();
      }
    });

    mainProcess.stderr.transform(utf8.decoder).listen((event) {
      if (event.contains('git@gitlab.onix.ua: Permission denied (publickey)')) {
        mainProcess.kill();
      }
    });

    mainProcess.stdin.writeln('source \$HOME/.zshrc');
    mainProcess.stdin.writeln('source \$HOME/.bash_profile');
    mainProcess.stdin.writeln(
        'git archive --remote=ssh://gitlab.onix.ua/onix-systems/flutter-project-generator.git HEAD README.md | tar xO');

    mainProcess.stdin.writeln(
        'git archive --remote=${AppConsts.gitUri} ${AppConsts.gitBranch} pubspec.yaml | tar xO | grep version && exit');

    await mainProcess.exitCode;

    if (remoteVersion.isEmpty) {
      addSr(const SplashScreenSR.onPermissions());
      return;
    }

    if (localVersion != remoteVersion) {
      addSr(const SplashScreenSR.onNeedUpdate());
    } else {
      addSr(const SplashScreenSR.onContinue());
    }

    emit(state.copyWith(
      remoteVersion: remoteVersion,
      localVersion: localVersion,
    ));
  }
}
