import 'package:algorand_dart/algorand_dart.dart';
import 'package:algorand_dart/src/api/account/account_algod_service.dart';
import 'package:algorand_dart/src/api/account/account_resource_responses.dart';
import 'package:dio/dio.dart';

class AccountsAlgodApi {
  final AlgorandApi _api;
  final AccountAlgodService _service;

  AccountsAlgodApi({
    required AlgorandApi api,
    required AccountAlgodService service,
  })  : _api = api,
        _service = service;

  /// Get the account information of the given address.
  /// Given a specific account public key, this call returns the accounts
  /// status, balance and spendable amounts
  ///
  /// Throws an [AlgorandException] if there is an HTTP error.
  /// Returns the account information.
  Future<AccountInformation> getAccountByAddress(
    String address, {
    Exclude? exclude,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _api.execute<AccountInformation>(
      () => _service.getAccountByAddress(
        address: address,
        exclude: exclude,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<AccountApplicationResponse> getAccountApplication(
    String address,
    int applicationId, {
    CancelToken? cancelToken,
  }) async {
    return _api.execute<AccountApplicationResponse>(
      () => _service.getAccountApplication(
        address: address,
        applicationId: applicationId,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<AccountAssetResponse> getAccountAsset(
    String address,
    int assetId, {
    CancelToken? cancelToken,
  }) async {
    return _api.execute<AccountAssetResponse>(
      () => _service.getAccountAsset(
        address: address,
        assetId: assetId,
        cancelToken: cancelToken,
      ),
    );
  }
}
