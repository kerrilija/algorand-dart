import 'package:algorand_dart/src/models/models.dart';

class SimulateResponse {
  final int version;

  final int lastRound;

  final List<SimulateTransactionGroupResult> txnGroups;

  final Map<String, dynamic>? evalOverrides;

  final Map<String, dynamic>? execTraceConfig;

  final Map<String, dynamic>? initialStates;

  const SimulateResponse({
    required this.version,
    required this.lastRound,
    required this.txnGroups,
    this.evalOverrides,
    this.execTraceConfig,
    this.initialStates,
  });

  bool get wouldSucceed => txnGroups.every((g) => g.succeeded);

  factory SimulateResponse.fromJson(Map<String, dynamic> json) =>
      SimulateResponse(
        version: _int(json['version']),
        lastRound: _int(json['last-round']),
        txnGroups: _list(
          json['txn-groups'],
        ).map(SimulateTransactionGroupResult.fromJson).toList(),
        evalOverrides: json['eval-overrides'] as Map<String, dynamic>?,
        execTraceConfig: json['exec-trace-config'] as Map<String, dynamic>?,
        initialStates: json['initial-states'] as Map<String, dynamic>?,
      );
}

class SimulateTransactionGroupResult {
  final List<SimulateTransactionResult> txnResults;

  final String failureMessage;

  final List<int> failedAt;

  final int appBudgetAdded;

  final int appBudgetConsumed;

  final Map<String, dynamic>? unnamedResourcesAccessed;

  const SimulateTransactionGroupResult({
    required this.txnResults,
    required this.failureMessage,
    required this.failedAt,
    required this.appBudgetAdded,
    required this.appBudgetConsumed,
    this.unnamedResourcesAccessed,
  });

  bool get succeeded => failureMessage.isEmpty;

  factory SimulateTransactionGroupResult.fromJson(Map<String, dynamic> json) =>
      SimulateTransactionGroupResult(
        txnResults: _list(
          json['txn-results'],
        ).map(SimulateTransactionResult.fromJson).toList(),
        failureMessage: json['failure-message'] as String? ?? '',
        failedAt: (json['failed-at'] as List<dynamic>? ?? const [])
            .map(_int)
            .toList(),
        appBudgetAdded: _int(json['app-budget-added']),
        appBudgetConsumed: _int(json['app-budget-consumed']),
        unnamedResourcesAccessed:
            json['unnamed-resources-accessed'] as Map<String, dynamic>?,
      );
}

class SimulateTransactionResult {
  final PendingTransaction txnResult;

  final int appBudgetConsumed;
  final int logicSigBudgetConsumed;

  final Map<String, dynamic>? execTrace;

  final Map<String, dynamic>? unnamedResourcesAccessed;

  final String? fixedSigner;

  const SimulateTransactionResult({
    required this.txnResult,
    required this.appBudgetConsumed,
    required this.logicSigBudgetConsumed,
    this.execTrace,
    this.unnamedResourcesAccessed,
    this.fixedSigner,
  });

  factory SimulateTransactionResult.fromJson(Map<String, dynamic> json) =>
      SimulateTransactionResult(
        txnResult: PendingTransaction.fromJson(
          json['txn-result'] as Map<String, dynamic>,
        ),
        appBudgetConsumed: _int(json['app-budget-consumed']),
        logicSigBudgetConsumed: _int(json['logic-sig-budget-consumed']),
        execTrace: json['exec-trace'] as Map<String, dynamic>?,
        unnamedResourcesAccessed:
            json['unnamed-resources-accessed'] as Map<String, dynamic>?,
        fixedSigner: json['fixed-signer'] as String?,
      );
}

int _int(Object? v) => v == null ? 0 : (v as num).toInt();

Iterable<Map<String, dynamic>> _list(Object? v) =>
    (v as List<dynamic>? ?? const []).cast<Map<String, dynamic>>();
