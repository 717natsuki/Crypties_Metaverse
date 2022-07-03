import 'package:crypties_app/exports.dart';


class AssetsMoralis {
  List assets;

  AssetsMoralis.fromJson(Map<dynamic, dynamic> json):
        assets = json['result'] as List;
}

class MoralisNFT extends ChangeNotifier {
  String token_address;
  String token_id;
  String amount;
  String owner_of;
  String block_number;
  String contract_type;
  String token_uri;
  String metadata;
  String name;
  String symbol;

  MoralisNFT.fromJson(Map<dynamic, dynamic> json)
      : token_address = json['token_address'] as String,
        token_id = json['token_id'] as String,
        amount = json['amount'] as String,
        owner_of = json['owner_of'] as String,
        block_number = json['block_number'] as String,
        contract_type = json['contract_type'] as String,
        token_uri = json['token_uri'] as String,
        metadata = json['metadata'] as String,
        name = json['name'] as String,
        symbol = json['symbol'] as String
  ;

  MoralisNFT({
    this.token_address,
    this.token_id,
    this.amount,
    this.owner_of,
    this.block_number,
    this.contract_type,
    this.token_uri,
    this.metadata,
    this.name,
    this.symbol,
  });
}
