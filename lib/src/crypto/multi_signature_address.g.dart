// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_signature_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiSigAddress _$MultiSigAddressFromJson(Map<String, dynamic> json) =>
    MultiSigAddress(
      version: (json['version'] as num?)?.toInt() ?? 1,
      threshold: (json['threshold'] as num?)?.toInt() ?? 2,
      publicKeys: json['addrs'] == null
          ? []
          : const ListAddressConverter().fromJson(json['addrs']),
    );

Map<String, dynamic> _$MultiSigAddressToJson(MultiSigAddress instance) =>
    <String, dynamic>{
      'version': instance.version,
      'threshold': instance.threshold,
      'addrs': const ListAddressConverter().toJson(instance.publicKeys),
    };
