import 'dart:typed_data';

import 'package:algorand_dart/src/models/addresses/address_model.dart';
import 'package:algorand_dart/src/utils/message_packable.dart';

sealed class ResourceRef implements MessagePackable {
  const ResourceRef();

  const factory ResourceRef.address(Address address) = AddressRef;

  const factory ResourceRef.asset(int assetId) = AssetRef;

  const factory ResourceRef.app(int appId) = AppRef;

  const factory ResourceRef.holding({
    required int addressIndex,
    required int assetIndex,
  }) = HoldingRef;

  const factory ResourceRef.locals({
    required int addressIndex,
    required int appIndex,
  }) = LocalsRef;

  const factory ResourceRef.box({
    required int appIndex,
    required Uint8List name,
  }) = BoxRef;
}

class AddressRef extends ResourceRef {
  final Address address;
  const AddressRef(this.address);

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{
    'd': address.publicKey,
  };
}

class AssetRef extends ResourceRef {
  final int assetId;
  const AssetRef(this.assetId);

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{'s': assetId};
}

class AppRef extends ResourceRef {
  final int appId;
  const AppRef(this.appId);

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{'p': appId};
}

class HoldingRef extends ResourceRef {
  final int addressIndex;

  final int assetIndex;

  const HoldingRef({required this.addressIndex, required this.assetIndex});

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{
    'h': <String, dynamic>{'d': addressIndex, 's': assetIndex},
  };
}

class LocalsRef extends ResourceRef {
  final int addressIndex;

  final int appIndex;

  const LocalsRef({required this.addressIndex, required this.appIndex});

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{
    'l': <String, dynamic>{'d': addressIndex, 'p': appIndex},
  };
}

class BoxRef extends ResourceRef {
  final int appIndex;
  final Uint8List name;

  const BoxRef({required this.appIndex, required this.name});

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{
    'b': <String, dynamic>{'i': appIndex, 'n': name},
  };
}
