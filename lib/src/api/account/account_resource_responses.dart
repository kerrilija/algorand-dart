import 'package:algorand_dart/src/api/application/application_local_state_model.dart';
import 'package:algorand_dart/src/api/application/application_params_model.dart';
import 'package:algorand_dart/src/api/asset/asset_holding_model.dart';
import 'package:algorand_dart/src/api/asset/asset_parameters_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_resource_responses.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class AccountApplicationResponse {
  final int round;

  final ApplicationLocalState? appLocalState;

  final ApplicationParams? createdApp;

  AccountApplicationResponse({
    required this.round,
    this.appLocalState,
    this.createdApp,
  });

  factory AccountApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountApplicationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountApplicationResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.kebab)
class AccountAssetResponse {
  final int round;

  final AssetHolding? assetHolding;

  final AssetParameters? createdAsset;

  AccountAssetResponse({
    required this.round,
    this.assetHolding,
    this.createdAsset,
  });

  factory AccountAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountAssetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountAssetResponseToJson(this);
}
