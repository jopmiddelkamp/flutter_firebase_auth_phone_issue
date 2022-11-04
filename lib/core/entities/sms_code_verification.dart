import 'package:freezed_annotation/freezed_annotation.dart';

part 'sms_code_verification.freezed.dart';

@freezed
class SmsCodeVerificationEntity with _$SmsCodeVerificationEntity {
  const factory SmsCodeVerificationEntity({
    required String id,
    required String code,
  }) = _SmsCodeVerificationEntity;
}
