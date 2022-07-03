import 'package:crypties_app/exports.dart';
import 'package:http/http.dart' as http;
import 'package:crypties_app/Domain/NFT/OpenseaNFT.dart';
import 'dart:convert';

Future<List<OpenseaNFT>> getCreatorNFTs(address, offset)async {
  var url = Uri.parse('https://api.opensea.io/api/v1/assets?asset_contract_address=${address}&order_by=sale_date&order_direction=desc&offset=$offset&limit=25');
  var response = await http.get(url);
  final body = json.decode(response.body);
  List<OpenseaNFT> nfts = [];
  Assets assetsClass = Assets.fromJson(body);
  for (int i = 0; assetsClass.assets.length > i; i++){
    OpenseaNFT obj = OpenseaNFT.fromJson(assetsClass.assets[i]);
    if (obj.image_url == null || obj.image_url.length < 5 || obj.image_url.substring(obj.image_url.length - 3) == 'mp4'){
    } else {
      nfts.add(obj );
    }
  }
  return nfts;
}
