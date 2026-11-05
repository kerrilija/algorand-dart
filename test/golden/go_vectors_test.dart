import 'dart:convert';
import 'dart:typed_data';

import 'package:algorand_dart/algorand_dart.dart';
import 'package:test/test.dart';

const addr = 'AOQQPP7TZYIL4HLQ3UMOOS6ATFT6JVRQTOSQ2XY53SDGIESVGG4MPFYUMQ';
const gid = 'V95L9hV4hTvX8qoiZkwdiEBvXkiSrRUTJN61G2RbNPE=';
const txid0 = 'JXFS3WA2TJJVDEO47M67PNDBMPSAVO4O3H6OGTIUT235QT323HKA';
const stx0 =
    'gqNzaWfEQLJRFvaKMSw8gib4y1WnToyrB2gSrsMZl/WGtPAhrTTIgv/21qab+lnY+is32TAXq74599SMmX+rXRO7rmfnAgijdHhuiqNhbXTOABLWh6NmZWXNA+iiZnbOAvrwgKNnZW6sbWFpbm5ldC12MS4womdoxCAAAwYJDA8SFRgbHiEkJyotMDM2OTw/QkVIS05RVFdaXaNncnDEIFfeS/YVeIU71/KqImZMHYhAb15Ikq0VEyTetRtkWzTxomx2zgL69GijcmN2xCDIycrLzM3Oz9DR0tPU1dbX2Nna29zd3t/g4eLj5OXm56NzbmTEIAOhB7/zzhC+HXDdGOdLwJln5NYwm6UNXx3chmQSVTG4pHR5cGWjcGF5';
const txid1 = 'CO5XNKXPBXCGHR524A2CZZE7X2NSXCY6AWF7VNDXYP76C3NQHGMA';
const stx1 =
    'gqNzaWfEQE77MxbQxLmrdJ+rB6zjwQBqzDNArlvOlG85ZXG8zrg3J4B5mNIMDmX51o2E9/1rcA8eqv0hZaSsZ4s+0pl8mAajdHhui6RhYW10zgAPQkCkYXJjdsQgyMnKy8zNzs/Q0dLT1NXW19jZ2tvc3d7f4OHi4+Tl5uejZmVlzQPoomZ2zgL68ICjZ2VurG1haW5uZXQtdjEuMKJnaMQgAAMGCQwPEhUYGx4hJCcqLTAzNjk8P0JFSEtOUVRXWl2jZ3JwxCBX3kv2FXiFO9fyqiJmTB2IQG9eSJKtFRMk3rUbZFs08aJsds4C+vRoo3NuZMQgA6EHv/POEL4dcN0Y50vAmWfk1jCbpQ1fHdyGZBJVMbikdHlwZaVheGZlcqR4YWlkzgHhq3A=';
const txid2 = 'P25MJWUDH5NTWIH7UZ7STVO3WRXVYZSOWNE5Y5XQEOAYSBPHGRUA';
const stx2 =
    'gqNzaWfEQKYIz6bUHp/dtxdCyr2+rcwTEWyMdprkC2N7dFSW+harefhUMaVqQSe3V8zjYohzWKtT9gVnFqXK6yqQri5blw6jdHhujKJhbJaBoWTEIMjJysvMzc7P0NHS09TV1tfY2drb3N3e3+Dh4uPk5ebngaFzzgHhq3CBoXDOIPCOWIGhaIKhZAGhcwKBoWyBoWQBgaFigqFpA6FuxARwb29spGFwYWGTxARzd2FwxAtmaXhlZC1pbnB1dMQIAAAAAAAPQkCkYXBpZM47wZMdpGFwcnYHo2ZlZc0LuKJmds4C+vCAo2dlbqxtYWlubmV0LXYxLjCiZ2jEIAADBgkMDxIVGBseISQnKi0wMzY5PD9CRUhLTlFUV1pdo2dycMQgV95L9hV4hTvX8qoiZkwdiEBvXkiSrRUTJN61G2RbNPGibHbOAvr0aKNzbmTEIAOhB7/zzhC+HXDdGOdLwJln5NYwm6UNXx3chmQSVTG4pHR5cGWkYXBwbA==';
const legacyTxid = 'QHWX5UKEP6WFCMR4X6YYMQSB2VO3HWZECT5QMUIICNBSNBHNTO2Q';
const legacyStx =
    'gqNzaWfEQKPM5MZGIrantywUwj9LqqjM+4sjiUvHnXnQp/1+3Q2QA3sww6rdp9+RaP5CWGZwfwZgklHFhOa/4EyclMVgrgyjdHhujKRhcGFhkcQEc3dhcKRhcGFzkc4B4atwpGFwYXSRxCDIycrLzM3Oz9DR0tPU1dbX2Nna29zd3t/g4eLj5OXm56RhcGZhkc4g8I5YpGFwaWTOO8GTHaNmZWXNB9CiZnbOAvrwgKNnZW6sbWFpbm5ldC12MS4womdoxCAAAwYJDA8SFRgbHiEkJyotMDM2OTw/QkVIS05RVFdaXaJsds4C+vRoo3NuZMQgA6EHv/POEL4dcN0Y50vAmWfk1jCbpQ1fHdyGZBJVMbikdHlwZaRhcHBs';
const simreq =
    'hLZhbGxvdy1lbXB0eS1zaWduYXR1cmVzw7dhbGxvdy11bm5hbWVkLXJlc291cmNlc8OzZXh0cmEtb3Bjb2RlLWJ1ZGdldM0CvKp0eG4tZ3JvdXBzkYGkdHhuc5OBo3R4boqjYW10zgAS1oejZmVlzQPoomZ2zgL68ICjZ2VurG1haW5uZXQtdjEuMKJnaMQgAAMGCQwPEhUYGx4hJCcqLTAzNjk8P0JFSEtOUVRXWl2jZ3JwxCBX3kv2FXiFO9fyqiJmTB2IQG9eSJKtFRMk3rUbZFs08aJsds4C+vRoo3JjdsQgyMnKy8zNzs/Q0dLT1NXW19jZ2tvc3d7f4OHi4+Tl5uejc25kxCADoQe/884Qvh1w3RjnS8CZZ+TWMJulDV8d3IZkElUxuKR0eXBlo3BheYGjdHhui6RhYW10zgAPQkCkYXJjdsQgyMnKy8zNzs/Q0dLT1NXW19jZ2tvc3d7f4OHi4+Tl5uejZmVlzQPoomZ2zgL68ICjZ2VurG1haW5uZXQtdjEuMKJnaMQgAAMGCQwPEhUYGx4hJCcqLTAzNjk8P0JFSEtOUVRXWl2jZ3JwxCBX3kv2FXiFO9fyqiJmTB2IQG9eSJKtFRMk3rUbZFs08aJsds4C+vRoo3NuZMQgA6EHv/POEL4dcN0Y50vAmWfk1jCbpQ1fHdyGZBJVMbikdHlwZaVheGZlcqR4YWlkzgHhq3CBo3R4boyiYWyWgaFkxCDIycrLzM3Oz9DR0tPU1dbX2Nna29zd3t/g4eLj5OXm54Ghc84B4atwgaFwziDwjliBoWiCoWQBoXMCgaFsgaFkAYGhYoKhaQOhbsQEcG9vbKRhcGFhk8QEc3dhcMQLZml4ZWQtaW5wdXTECAAAAAAAD0JApGFwaWTOO8GTHaRhcHJ2B6NmZWXNC7iiZnbOAvrwgKNnZW6sbWFpbm5ldC12MS4womdoxCAAAwYJDA8SFRgbHiEkJyotMDM2OTw/QkVIS05RVFdaXaNncnDEIFfeS/YVeIU71/KqImZMHYhAb15Ikq0VEyTetRtkWzTxomx2zgL69Gijc25kxCADoQe/884Qvh1w3RjnS8CZZ+TWMJulDV8d3IZkElUxuKR0eXBlpGFwcGw=';

Uint8List _bytes(int n, int Function(int) f) =>
    Uint8List.fromList(List<int>.generate(n, f));

void main() {
  late Account account;
  final other = Address(publicKey: _bytes(32, (i) => 200 + i % 50));
  final genesisHash = _bytes(32, (i) => i * 3);

  void header(RawTransactionBuilder b, int fee) {
    b
      ..sender = account.address
      ..flatFee = BigInt.from(fee)
      ..firstValid = BigInt.from(50000000)
      ..lastValid = BigInt.from(50001000)
      ..genesisId = 'mainnet-v1.0'
      ..genesisHash = genesisHash;
  }

  Future<RawTransaction> pay() async {
    final b = PaymentTransactionBuilder()
      ..receiver = other
      ..amount = BigInt.from(1234567);
    header(b, 1000);
    return b.build();
  }

  Future<RawTransaction> axfer() async {
    final b = AssetTransferTransactionBuilder()
      ..assetId = 31566704
      ..amount = BigInt.from(1000000)
      ..receiver = other;
    header(b, 1000);
    return b.build();
  }

  Future<RawTransaction> applWithAccess() async {
    final b = ApplicationCallTransactionBuilder()
      ..applicationId = 1002541853
      ..arguments = [
        Uint8List.fromList(utf8.encode('swap')),
        Uint8List.fromList(utf8.encode('fixed-input')),
        Uint8List.fromList([0, 0, 0, 0, 0, 0x0f, 0x42, 0x40]),
      ]
      ..access = [
        ResourceRef.address(other),
        const ResourceRef.asset(31566704),
        const ResourceRef.app(552635992),
        const ResourceRef.holding(addressIndex: 1, assetIndex: 2),
        const ResourceRef.locals(addressIndex: 1, appIndex: 0),
        ResourceRef.box(
          appIndex: 3,
          name: Uint8List.fromList(utf8.encode('pool')),
        ),
      ]
      ..rejectVersion = 7;
    header(b, 3000);
    return b.build();
  }

  setUpAll(() async {
    account = await Account.fromSeed(List<int>.generate(32, (i) => i));
  });

  test('address from seed matches Go', () {
    expect(account.publicAddress, addr);
  });

  test('legacy app call (foreign arrays) matches Go', () async {
    final b = ApplicationCallTransactionBuilder()
      ..applicationId = 1002541853
      ..arguments = [Uint8List.fromList(utf8.encode('swap'))]
      ..accounts = [other]
      ..foreignAssets = [31566704]
      ..foreignApps = [552635992];
    header(b, 2000);
    final tx = await b.build();
    final stx = await tx.sign(account);
    expect(tx.id, legacyTxid);
    expect(base64Encode(stx.toBytes()), legacyStx);
  });

  test(
    'group id, txids and signed group (pay, axfer, appl+access) match Go',
    () async {
      final group = [await pay(), await axfer(), await applWithAccess()];
      expect(base64Encode(AtomicTransfer.computeGroupId(group)), gid);
      AtomicTransfer.group(group);

      final ids = [txid0, txid1, txid2];
      final stxs = [stx0, stx1, stx2];
      for (var i = 0; i < group.length; i++) {
        final signed = await group[i].sign(account);
        expect(group[i].id, ids[i], reason: 'txid $i');
        expect(base64Encode(signed.toBytes()), stxs[i], reason: 'stx $i');
      }
    },
  );

  test('simulate request msgpack matches Go', () async {
    final group = [await pay(), await axfer(), await applWithAccess()];
    AtomicTransfer.group(group);
    final request = SimulateRequest.group(
      group.map((t) => SignedTransaction(transaction: t)).toList(),
      allowEmptySignatures: true,
      allowUnnamedResources: true,
      extraOpcodeBudget: 700,
    );
    final bytes = Encoder.encodeMessagePack(request.toMessagePack());
    expect(base64Encode(bytes), simreq);
  });

  test('access list cannot be mixed with foreign arrays', () async {
    final b = ApplicationCallTransactionBuilder()
      ..applicationId = 1
      ..foreignApps = [2]
      ..access = [const ResourceRef.app(2)];
    header(b, 1000);
    expect(b.build(), throwsA(isA<AlgorandException>()));
  });

  test(
    'flat fee 0 is kept for fee pooling; no flat fee enforces min',
    () async {
      final pooled = PaymentTransactionBuilder()
        ..receiver = other
        ..amount = BigInt.one;
      header(pooled, 0);
      expect((await pooled.build()).fee, BigInt.zero);

      final unset = PaymentTransactionBuilder()
        ..sender = account.address
        ..receiver = other
        ..amount = BigInt.one
        ..firstValid = BigInt.one
        ..lastValid = BigInt.two
        ..genesisHash = genesisHash;
      expect((await unset.build()).fee, RawTransaction.MIN_TX_FEE_UALGOS);
    },
  );
}
