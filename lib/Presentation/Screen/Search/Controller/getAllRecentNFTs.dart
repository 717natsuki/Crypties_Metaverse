import 'package:crypties_app/exports.dart';
import 'package:http/http.dart' as http;
import 'package:crypties_app/Domain/NFT/OpenseaNFT.dart';
import 'dart:convert';


Future<List<OpenseaNFT>> getAllRecentNFTs(offset)async {
  var url = Uri.parse('https://api.opensea.io/api/v1/assets?order_by=sale_date&order_direction=desc&offset=$offset&limit=40');
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

Future<OpenseaNFT> getSingleNFT(address, token_id)async {
  var url = Uri.parse('https://api.opensea.io/api/v1/asset/$address/$token_id/');
  var response = await http.get(url);
  final body = json.decode(response.body);
  OpenseaNFT obj = OpenseaNFT.fromJson(body);

  return obj;
}


Future<List<OpenseaNFT>> getAllPopularNFTs(offset)async {
  List<OpenseaNFT> nfts = [];
  List collections = [
    'cryptopunks',
    'art-blocks',
    'mutant-ape-yacht-club',
    'lazy-lions',
    'superrare',
    'lostpoets',
    'cryptoadz-by-gremplin',
    'cool-cats-nft',
    'winterbears',
  ];
  collections.shuffle();
  List getCollection = collections.take(2).toList();

  for (int i = 0; getCollection.length > i; i++){
    var url = Uri.parse('https://api.opensea.io/api/v1/assets?offset=$offset&limit=20&collection=${collections[i]}');
    nfts.addAll(await getNft(url));
  }

  nfts.shuffle();
  return nfts;
}

Future getNft(url)async{
  List<OpenseaNFT> nfts = [];
  var response = await http.get(url);
  final body = json.decode(response.body);
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