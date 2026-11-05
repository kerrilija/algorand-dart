// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_registration_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyRegistrationTransactionResponse _$KeyRegistrationTransactionResponseFromJson(
  Map<String, dynamic> json,
) => KeyRegistrationTransactionResponse(
  nonParticipation: json['non-participation'] as bool?,
  selectionParticipationKey: json['selection-participation-key'] as String?,
  stateProofKey: json['state-proof-key'] as String?,
  voteFirstValid: (json['vote-first-valid'] as num?)?.toInt(),
  voteLastValid: (json['vote-last-valid'] as num?)?.toInt(),
  voteKeyDilution: (json['vote-key-dilution'] as num?)?.toInt(),
  voteParticipationKey: json['vote-participation-key'] as String?,
);

Map<String, dynamic> _$KeyRegistrationTransactionResponseToJson(
  KeyRegistrationTransactionResponse instance,
) => <String, dynamic>{
  'non-participation': instance.nonParticipation,
  'selection-participation-key': instance.selectionParticipationKey,
  'state-proof-key': instance.stateProofKey,
  'vote-first-valid': instance.voteFirstValid,
  'vote-last-valid': instance.voteLastValid,
  'vote-key-dilution': instance.voteKeyDilution,
  'vote-participation-key': instance.voteParticipationKey,
};
