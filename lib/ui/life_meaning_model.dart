import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class LifeMeaningModel extends ChangeNotifier {
  static const String contractname = "LifeMeaning";
  static const String ip = "192.168.1.10";
  static const String port = "7545";
  final String _rpcURL = "http://$ip:$port";
  final String _wsURL = "ws://$ip:$port/";
  final String _privateKey =
      "0xb004912d2ef25e3f78b079d6e2ae22cbc9ce4d527fc89cbe99cd9ffcb5ed2add";
  late Web3Client _client;
  late Credentials _credentials;
  late DeployedContract _contract;

  late ContractFunction _getLifeMeaning;
  late ContractFunction _setLifeMeaning;

  BigInt? lifeMeaning;
  bool loading = true;

  // LifeMeaningModel(BuildContext context);

  LifeMeaningModel(context) {
    initialize(context);
  }

  initialize(context) async {
    _client = Web3Client(
      
      _rpcURL,
      Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsURL).cast<String>();
      },
    );

    final abiStringFile = await DefaultAssetBundle.of(context)
        .loadString("truffle-artifacts/$contractname.json");
    final abiJson = jsonDecode(abiStringFile);
    final abi = jsonEncode(abiJson["abi"]);
    final contractAddress =
        EthereumAddress.fromHex(abiJson["networks"]["5777"]["address"]);
    _credentials = EthPrivateKey.fromHex(_privateKey);
    _contract = DeployedContract(
        ContractAbi.fromJson(abi, contractname), contractAddress);

    _getLifeMeaning = _contract.function("get");
    _setLifeMeaning = _contract.function("set");
    getMeaning();
  }

  Future<void> getMeaning() async {
    final result = await _client
        .call(contract: _contract, function: _getLifeMeaning, params: []);
    lifeMeaning = result[0];
    loading = false;
    notifyListeners();
  }

  Future<void> setMeaning(BigInt value) async {
    loading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _setLifeMeaning,
            parameters: [value]));
   
   getMeaning();
  }
}
