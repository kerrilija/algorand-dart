import 'package:algorand_dart/src/models/models.dart';
import 'package:algorand_dart/src/utils/message_packable.dart';

class SimulateRequest implements MessagePackable {
  final List<SimulateRequestTransactionGroup> txnGroups;

  final bool allowEmptySignatures;

  final bool allowMoreLogging;

  final bool allowUnnamedResources;

  final int extraOpcodeBudget;

  final bool fixSigners;

  final int round;

  final SimulateTraceConfig? execTraceConfig;

  const SimulateRequest({
    required this.txnGroups,
    this.allowEmptySignatures = false,
    this.allowMoreLogging = false,
    this.allowUnnamedResources = false,
    this.extraOpcodeBudget = 0,
    this.fixSigners = false,
    this.round = 0,
    this.execTraceConfig,
  });

  factory SimulateRequest.group(
    List<SignedTransaction> transactions, {
    bool allowEmptySignatures = false,
    bool allowUnnamedResources = false,
    int extraOpcodeBudget = 0,
    int round = 0,
    SimulateTraceConfig? execTraceConfig,
  }) => SimulateRequest(
    txnGroups: [SimulateRequestTransactionGroup(transactions)],
    allowEmptySignatures: allowEmptySignatures,
    allowUnnamedResources: allowUnnamedResources,
    extraOpcodeBudget: extraOpcodeBudget,
    round: round,
    execTraceConfig: execTraceConfig,
  );

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{
    'allow-empty-signatures': allowEmptySignatures,
    'allow-more-logging': allowMoreLogging,
    'allow-unnamed-resources': allowUnnamedResources,
    'exec-trace-config': execTraceConfig?.toMessagePack(),
    'extra-opcode-budget': extraOpcodeBudget,
    'fix-signers': fixSigners,
    'round': round,
    'txn-groups': txnGroups.map((g) => g.toMessagePack()).toList(),
  };
}

class SimulateRequestTransactionGroup implements MessagePackable {
  final List<SignedTransaction> txns;

  const SimulateRequestTransactionGroup(this.txns);

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{
    'txns': txns.map((t) => t.toMessagePack()).toList(),
  };
}

class SimulateTraceConfig implements MessagePackable {
  final bool enable;
  final bool scratchChange;
  final bool stackChange;
  final bool stateChange;

  const SimulateTraceConfig({
    this.enable = false,
    this.scratchChange = false,
    this.stackChange = false,
    this.stateChange = false,
  });

  @override
  Map<String, dynamic> toMessagePack() => <String, dynamic>{
    'enable': enable,
    'scratch-change': scratchChange,
    'stack-change': stackChange,
    'state-change': stateChange,
  };
}
