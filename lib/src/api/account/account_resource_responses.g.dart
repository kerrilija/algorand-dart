// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_resource_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountApplicationResponse _$AccountApplicationResponseFromJson(
  Map<String, dynamic> json,
) => AccountApplicationResponse(
  round: (json['round'] as num).toInt(),
  appLocalState: json['app-local-state'] == null
      ? null
      : ApplicationLocalState.fromJson(
          json['app-local-state'] as Map<String, dynamic>,
        ),
  createdApp: json['created-app'] == null
      ? null
      : ApplicationParams.fromJson(json['created-app'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AccountApplicationResponseToJson(
  AccountApplicationResponse instance,
) => <String, dynamic>{
  'round': instance.round,
  'app-local-state': instance.appLocalState,
  'created-app': instance.createdApp,
};

AccountAssetResponse _$AccountAssetResponseFromJson(
  Map<String, dynamic> json,
) => AccountAssetResponse(
  round: (json['round'] as num).toInt(),
  assetHolding: json['asset-holding'] == null
      ? null
      : AssetHolding.fromJson(json['asset-holding'] as Map<String, dynamic>),
  createdAsset: json['created-asset'] == null
      ? null
      : AssetParameters.fromJson(json['created-asset'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AccountAssetResponseToJson(
  AccountAssetResponse instance,
) => <String, dynamic>{
  'round': instance.round,
  'asset-holding': instance.assetHolding,
  'created-asset': instance.createdAsset,
};
