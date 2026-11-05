// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingTransaction _$PendingTransactionFromJson(
  Map<String, dynamic> json,
) => PendingTransaction(
  transaction: SignedTransaction.fromJson(json['txn'] as Map<String, dynamic>),
  poolError: json['pool-error'] as String? ?? '',
  globalStateDelta:
      (json['global-state-delta'] as List<dynamic>?)
          ?.map((e) => EvalDeltaKeyValue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  localStateDelta:
      (json['local-state-delta'] as List<dynamic>?)
          ?.map((e) => AccountStateDelta.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  innerTxns:
      (json['inner-txns'] as List<dynamic>?)
          ?.map((e) => PendingTransaction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  logs:
      (json['logs'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
  applicationIndex: (json['application-index'] as num?)?.toInt(),
  assetIndex: (json['asset-index'] as num?)?.toInt(),
  closeRewards: (json['close-rewards'] as num?)?.toInt(),
  closingAmount: (json['closing-amount'] as num?)?.toInt(),
  confirmedRound: (json['confirmed-round'] as num?)?.toInt(),
  receiverRewards: (json['receiver-rewards'] as num?)?.toInt(),
  senderRewards: (json['sender-rewards'] as num?)?.toInt(),
  assetClosingAmount: (json['asset-closing-amount'] as num?)?.toInt(),
);

Map<String, dynamic> _$PendingTransactionToJson(PendingTransaction instance) =>
    <String, dynamic>{
      'application-index': instance.applicationIndex,
      'asset-closing-amount': instance.assetClosingAmount,
      'asset-index': instance.assetIndex,
      'close-rewards': instance.closeRewards,
      'closing-amount': instance.closingAmount,
      'confirmed-round': instance.confirmedRound,
      'global-state-delta': instance.globalStateDelta,
      'inner-txns': instance.innerTxns,
      'local-state-delta': instance.localStateDelta,
      'logs': instance.logs,
      'pool-error': instance.poolError,
      'receiver-rewards': instance.receiverRewards,
      'sender-rewards': instance.senderRewards,
      'txn': instance.transaction,
    };
