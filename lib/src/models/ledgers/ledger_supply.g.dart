// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_supply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LedgerSupply _$LedgerSupplyFromJson(Map<String, dynamic> json) => LedgerSupply(
  currentRound: (json['current_round'] as num).toInt(),
  onlineMoney: (json['online-money'] as num).toInt(),
  totalMoney: (json['total-money'] as num).toInt(),
);

Map<String, dynamic> _$LedgerSupplyToJson(LedgerSupply instance) =>
    <String, dynamic>{
      'current_round': instance.currentRound,
      'online-money': instance.onlineMoney,
      'total-money': instance.totalMoney,
    };
