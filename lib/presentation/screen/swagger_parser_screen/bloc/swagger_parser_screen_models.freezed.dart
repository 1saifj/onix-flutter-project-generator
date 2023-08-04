// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swagger_parser_screen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SwaggerParserScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectName) init,
    required TResult Function(String url) parse,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectName)? init,
    TResult? Function(String url)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectName)? init,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwaggerParserScreenEventCopyWith<$Res> {
  factory $SwaggerParserScreenEventCopyWith(SwaggerParserScreenEvent value,
          $Res Function(SwaggerParserScreenEvent) then) =
      _$SwaggerParserScreenEventCopyWithImpl<$Res, SwaggerParserScreenEvent>;
}

/// @nodoc
class _$SwaggerParserScreenEventCopyWithImpl<$Res,
        $Val extends SwaggerParserScreenEvent>
    implements $SwaggerParserScreenEventCopyWith<$Res> {
  _$SwaggerParserScreenEventCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventInitCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventInitCopyWith(
          _$SwaggerParserScreenEventInit value,
          $Res Function(_$SwaggerParserScreenEventInit) then) =
      __$$SwaggerParserScreenEventInitCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectName});
}

/// @nodoc
class __$$SwaggerParserScreenEventInitCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventInit>
    implements _$$SwaggerParserScreenEventInitCopyWith<$Res> {
  __$$SwaggerParserScreenEventInitCopyWithImpl(
      _$SwaggerParserScreenEventInit _value,
      $Res Function(_$SwaggerParserScreenEventInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
  }) {
    return _then(_$SwaggerParserScreenEventInit(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SwaggerParserScreenEventInit implements SwaggerParserScreenEventInit {
  const _$SwaggerParserScreenEventInit({required this.projectName});

  @override
  final String projectName;

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.init(projectName: $projectName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenEventInit &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenEventInitCopyWith<_$SwaggerParserScreenEventInit>
      get copyWith => __$$SwaggerParserScreenEventInitCopyWithImpl<
          _$SwaggerParserScreenEventInit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectName) init,
    required TResult Function(String url) parse,
  }) {
    return init(projectName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectName)? init,
    TResult? Function(String url)? parse,
  }) {
    return init?.call(projectName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectName)? init,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(projectName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenEventInit
    implements SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEventInit(
      {required final String projectName}) = _$SwaggerParserScreenEventInit;

  String get projectName;
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenEventInitCopyWith<_$SwaggerParserScreenEventInit>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwaggerParserScreenEventParseCopyWith<$Res> {
  factory _$$SwaggerParserScreenEventParseCopyWith(
          _$SwaggerParserScreenEventParse value,
          $Res Function(_$SwaggerParserScreenEventParse) then) =
      __$$SwaggerParserScreenEventParseCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$SwaggerParserScreenEventParseCopyWithImpl<$Res>
    extends _$SwaggerParserScreenEventCopyWithImpl<$Res,
        _$SwaggerParserScreenEventParse>
    implements _$$SwaggerParserScreenEventParseCopyWith<$Res> {
  __$$SwaggerParserScreenEventParseCopyWithImpl(
      _$SwaggerParserScreenEventParse _value,
      $Res Function(_$SwaggerParserScreenEventParse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$SwaggerParserScreenEventParse(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SwaggerParserScreenEventParse implements SwaggerParserScreenEventParse {
  const _$SwaggerParserScreenEventParse({required this.url});

  @override
  final String url;

  @override
  String toString() {
    return 'SwaggerParserScreenEvent.parse(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenEventParse &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenEventParseCopyWith<_$SwaggerParserScreenEventParse>
      get copyWith => __$$SwaggerParserScreenEventParseCopyWithImpl<
          _$SwaggerParserScreenEventParse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectName) init,
    required TResult Function(String url) parse,
  }) {
    return parse(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectName)? init,
    TResult? Function(String url)? parse,
  }) {
    return parse?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectName)? init,
    TResult Function(String url)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenEventInit value) init,
    required TResult Function(SwaggerParserScreenEventParse value) parse,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenEventInit value)? init,
    TResult? Function(SwaggerParserScreenEventParse value)? parse,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenEventInit value)? init,
    TResult Function(SwaggerParserScreenEventParse value)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenEventParse
    implements SwaggerParserScreenEvent {
  const factory SwaggerParserScreenEventParse({required final String url}) =
      _$SwaggerParserScreenEventParse;

  String get url;
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenEventParseCopyWith<_$SwaggerParserScreenEventParse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SwaggerParserScreenSR {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onError,
    required TResult Function() onContinue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? onError,
    TResult? Function()? onContinue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onError,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnError value) onError,
    required TResult Function(_OnContinue value) onContinue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnError value)? onError,
    TResult? Function(_OnContinue value)? onContinue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnError value)? onError,
    TResult Function(_OnContinue value)? onContinue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwaggerParserScreenSRCopyWith<$Res> {
  factory $SwaggerParserScreenSRCopyWith(SwaggerParserScreenSR value,
          $Res Function(SwaggerParserScreenSR) then) =
      _$SwaggerParserScreenSRCopyWithImpl<$Res, SwaggerParserScreenSR>;
}

/// @nodoc
class _$SwaggerParserScreenSRCopyWithImpl<$Res,
        $Val extends SwaggerParserScreenSR>
    implements $SwaggerParserScreenSRCopyWith<$Res> {
  _$SwaggerParserScreenSRCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_OnErrorCopyWith<$Res> {
  factory _$$_OnErrorCopyWith(
          _$_OnError value, $Res Function(_$_OnError) then) =
      __$$_OnErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_OnErrorCopyWithImpl<$Res>
    extends _$SwaggerParserScreenSRCopyWithImpl<$Res, _$_OnError>
    implements _$$_OnErrorCopyWith<$Res> {
  __$$_OnErrorCopyWithImpl(_$_OnError _value, $Res Function(_$_OnError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_OnError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnError implements _OnError {
  const _$_OnError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SwaggerParserScreenSR.onError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnErrorCopyWith<_$_OnError> get copyWith =>
      __$$_OnErrorCopyWithImpl<_$_OnError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onError,
    required TResult Function() onContinue,
  }) {
    return onError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? onError,
    TResult? Function()? onContinue,
  }) {
    return onError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onError,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnError value) onError,
    required TResult Function(_OnContinue value) onContinue,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnError value)? onError,
    TResult? Function(_OnContinue value)? onContinue,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnError value)? onError,
    TResult Function(_OnContinue value)? onContinue,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class _OnError implements SwaggerParserScreenSR {
  const factory _OnError({required final String message}) = _$_OnError;

  String get message;
  @JsonKey(ignore: true)
  _$$_OnErrorCopyWith<_$_OnError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnContinueCopyWith<$Res> {
  factory _$$_OnContinueCopyWith(
          _$_OnContinue value, $Res Function(_$_OnContinue) then) =
      __$$_OnContinueCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnContinueCopyWithImpl<$Res>
    extends _$SwaggerParserScreenSRCopyWithImpl<$Res, _$_OnContinue>
    implements _$$_OnContinueCopyWith<$Res> {
  __$$_OnContinueCopyWithImpl(
      _$_OnContinue _value, $Res Function(_$_OnContinue) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnContinue implements _OnContinue {
  const _$_OnContinue();

  @override
  String toString() {
    return 'SwaggerParserScreenSR.onContinue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnContinue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onError,
    required TResult Function() onContinue,
  }) {
    return onContinue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? onError,
    TResult? Function()? onContinue,
  }) {
    return onContinue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onError,
    TResult Function()? onContinue,
    required TResult orElse(),
  }) {
    if (onContinue != null) {
      return onContinue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnError value) onError,
    required TResult Function(_OnContinue value) onContinue,
  }) {
    return onContinue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnError value)? onError,
    TResult? Function(_OnContinue value)? onContinue,
  }) {
    return onContinue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnError value)? onError,
    TResult Function(_OnContinue value)? onContinue,
    required TResult orElse(),
  }) {
    if (onContinue != null) {
      return onContinue(this);
    }
    return orElse();
  }
}

abstract class _OnContinue implements SwaggerParserScreenSR {
  const factory _OnContinue() = _$_OnContinue;
}

/// @nodoc
mixin _$SwaggerParserScreenState {
  String get projectName => throw _privateConstructorUsedError;
  Set<DataComponent> get dataComponents => throw _privateConstructorUsedError;
  Set<Source> get sources => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectName,
            Set<DataComponent> dataComponents, Set<Source> sources)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectName, Set<DataComponent> dataComponents,
            Set<Source> sources)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectName, Set<DataComponent> dataComponents,
            Set<Source> sources)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwaggerParserScreenStateCopyWith<SwaggerParserScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwaggerParserScreenStateCopyWith<$Res> {
  factory $SwaggerParserScreenStateCopyWith(SwaggerParserScreenState value,
          $Res Function(SwaggerParserScreenState) then) =
      _$SwaggerParserScreenStateCopyWithImpl<$Res, SwaggerParserScreenState>;
  @useResult
  $Res call(
      {String projectName,
      Set<DataComponent> dataComponents,
      Set<Source> sources});
}

/// @nodoc
class _$SwaggerParserScreenStateCopyWithImpl<$Res,
        $Val extends SwaggerParserScreenState>
    implements $SwaggerParserScreenStateCopyWith<$Res> {
  _$SwaggerParserScreenStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? dataComponents = null,
    Object? sources = null,
  }) {
    return _then(_value.copyWith(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      dataComponents: null == dataComponents
          ? _value.dataComponents
          : dataComponents // ignore: cast_nullable_to_non_nullable
              as Set<DataComponent>,
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as Set<Source>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwaggerParserScreenStateDataCopyWith<$Res>
    implements $SwaggerParserScreenStateCopyWith<$Res> {
  factory _$$SwaggerParserScreenStateDataCopyWith(
          _$SwaggerParserScreenStateData value,
          $Res Function(_$SwaggerParserScreenStateData) then) =
      __$$SwaggerParserScreenStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectName,
      Set<DataComponent> dataComponents,
      Set<Source> sources});
}

/// @nodoc
class __$$SwaggerParserScreenStateDataCopyWithImpl<$Res>
    extends _$SwaggerParserScreenStateCopyWithImpl<$Res,
        _$SwaggerParserScreenStateData>
    implements _$$SwaggerParserScreenStateDataCopyWith<$Res> {
  __$$SwaggerParserScreenStateDataCopyWithImpl(
      _$SwaggerParserScreenStateData _value,
      $Res Function(_$SwaggerParserScreenStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? dataComponents = null,
    Object? sources = null,
  }) {
    return _then(_$SwaggerParserScreenStateData(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      dataComponents: null == dataComponents
          ? _value._dataComponents
          : dataComponents // ignore: cast_nullable_to_non_nullable
              as Set<DataComponent>,
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as Set<Source>,
    ));
  }
}

/// @nodoc

class _$SwaggerParserScreenStateData implements SwaggerParserScreenStateData {
  const _$SwaggerParserScreenStateData(
      {this.projectName = '',
      final Set<DataComponent> dataComponents = const {},
      final Set<Source> sources = const {}})
      : _dataComponents = dataComponents,
        _sources = sources;

  @override
  @JsonKey()
  final String projectName;
  final Set<DataComponent> _dataComponents;
  @override
  @JsonKey()
  Set<DataComponent> get dataComponents {
    if (_dataComponents is EqualUnmodifiableSetView) return _dataComponents;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_dataComponents);
  }

  final Set<Source> _sources;
  @override
  @JsonKey()
  Set<Source> get sources {
    if (_sources is EqualUnmodifiableSetView) return _sources;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_sources);
  }

  @override
  String toString() {
    return 'SwaggerParserScreenState.data(projectName: $projectName, dataComponents: $dataComponents, sources: $sources)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwaggerParserScreenStateData &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            const DeepCollectionEquality()
                .equals(other._dataComponents, _dataComponents) &&
            const DeepCollectionEquality().equals(other._sources, _sources));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectName,
      const DeepCollectionEquality().hash(_dataComponents),
      const DeepCollectionEquality().hash(_sources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwaggerParserScreenStateDataCopyWith<_$SwaggerParserScreenStateData>
      get copyWith => __$$SwaggerParserScreenStateDataCopyWithImpl<
          _$SwaggerParserScreenStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectName,
            Set<DataComponent> dataComponents, Set<Source> sources)
        data,
  }) {
    return data(projectName, dataComponents, sources);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectName, Set<DataComponent> dataComponents,
            Set<Source> sources)?
        data,
  }) {
    return data?.call(projectName, dataComponents, sources);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectName, Set<DataComponent> dataComponents,
            Set<Source> sources)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(projectName, dataComponents, sources);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SwaggerParserScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SwaggerParserScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SwaggerParserScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class SwaggerParserScreenStateData
    implements SwaggerParserScreenState {
  const factory SwaggerParserScreenStateData(
      {final String projectName,
      final Set<DataComponent> dataComponents,
      final Set<Source> sources}) = _$SwaggerParserScreenStateData;

  @override
  String get projectName;
  @override
  Set<DataComponent> get dataComponents;
  @override
  Set<Source> get sources;
  @override
  @JsonKey(ignore: true)
  _$$SwaggerParserScreenStateDataCopyWith<_$SwaggerParserScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
