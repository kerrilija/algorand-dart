import 'package:algorand_dart/algorand_dart.dart';
import 'package:algorand_dart/src/api/account/account_resource_responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'account_algod_service.g.dart';

@RestApi()
abstract class AccountAlgodService {
  factory AccountAlgodService(Dio dio, {String baseUrl}) = _AccountAlgodService;

  @GET('/v2/accounts/{address}')
  Future<AccountInformation> getAccountByAddress({
    @Path('address') required String address,
    @Query('exclude') Exclude? exclude,
    @CancelRequest() CancelToken? cancelToken,
    @SendProgress() ProgressCallback? onSendProgress,
    @ReceiveProgress() ProgressCallback? onReceiveProgress,
  });

  @GET('/v2/accounts/{address}/applications/{applicationId}')
  Future<AccountApplicationResponse> getAccountApplication({
    @Path('address') required String address,
    @Path('applicationId') required int applicationId,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET('/v2/accounts/{address}/assets/{assetId}')
  Future<AccountAssetResponse> getAccountAsset({
    @Path('address') required String address,
    @Path('assetId') required int assetId,
    @CancelRequest() CancelToken? cancelToken,
  });
}
