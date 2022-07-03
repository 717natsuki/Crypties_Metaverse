import 'package:crypties_app/Domain/NFT/MoralisNFT.dart';
import 'package:crypties_app/exports.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List> getNFTCount(walletAddress)async{
  List<MoralisNFT> nfts = [];

  var url = Uri.parse('https://deep-index.moralis.io/api/v2/${walletAddress}/nft');
  var url2 = Uri.parse('https://deep-index.moralis.io/api/v2/${walletAddress}/nft?chain=polygon');

   var response = await http.get(url,headers: {
     'accept': 'application/json',
     'X-API-Key':'ViUuOIBhXkvMcV9mkksf0CBEEDZWUg0y6vtOv138yYxqV6zz5FRIipyArzD8ZnAC'
   });
  var response2 = await http.get(url2,headers: {
    'accept': 'application/json',
    'X-API-Key':'ViUuOIBhXkvMcV9mkksf0CBEEDZWUg0y6vtOv138yYxqV6zz5FRIipyArzD8ZnAC'
  });

  final body = json.decode(response.body);
  final body2 = json.decode(response2.body);

  AssetsMoralis assetsClass = AssetsMoralis.fromJson(body);
  AssetsMoralis assetsClass2 = AssetsMoralis.fromJson(body2);
  print(assetsClass2.assets.toString());
  for (int i = 0; assetsClass.assets.length > i; i++){
    MoralisNFT obj = MoralisNFT.fromJson(assetsClass.assets[i]);
    // if (obj.image_url == null || obj.image_url.length < 5 || obj.image_url.substring(obj.image_url.length - 3) == 'mp4'){
    // } else {
      nfts.add(obj );
    // }
  }
  for (int i = 0; assetsClass2.assets.length > i; i++){
    MoralisNFT obj = MoralisNFT.fromJson(assetsClass2.assets[i]);
    // if (obj.image_url == null || obj.image_url.length < 5 || obj.image_url.substring(obj.image_url.length - 3) == 'mp4'){
    // } else {
    nfts.add(obj );
    // }
  }
  print((body['total'] + body2['total']).toString() + 'asdfasdjfoids');

 return [body['total'] + body2['total'], nfts];
}

Future<List<OpenseaNFT>> getNFTOwened(address)async{
  var url = Uri.parse('https://api.opensea.io/api/v1/assets?owner=$address&order_direction=desc&offset=0&limit=20');
  var response = await http.get(url);
  final body = json.decode(response.body);
  List<OpenseaNFT> nfts = [];
  print(body.toString());
  print('asdfoiasdjfoiasdf');

  Assets assetsClass = Assets.fromJson(body);
  for (int i = 0; assetsClass.assets.length > i; i++){
    OpenseaNFT obj = OpenseaNFT.fromJson(assetsClass.assets[i]);
    if(obj.last_sale != null){
      if (obj.image_url == null || obj.image_url.length < 5 || obj.image_url.substring(obj.image_url.length - 3) == 'mp4'){
      } else {
        nfts.add(obj );
      }
    }
  }
  return nfts;
}