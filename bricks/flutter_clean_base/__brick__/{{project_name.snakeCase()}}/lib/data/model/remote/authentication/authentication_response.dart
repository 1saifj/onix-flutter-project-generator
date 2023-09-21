import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';

part 'auth_response.g.dart';

@freezed
class AuthenticationResponse with _$AuthenticationResponse {
  const factory AuthenticationResponse(
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  ) = _AuthenticationhResponse;

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  factory AuthenticationResponse.empty() => const AuthenticationResponse(
        '',
        '',
      );
}
