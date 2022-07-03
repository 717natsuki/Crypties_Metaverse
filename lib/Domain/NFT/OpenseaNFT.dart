import 'package:crypties_app/exports.dart';

class Assets {
  List assets;

  Assets.fromJson(Map<dynamic, dynamic> json):
      assets = json['assets'] as List;
}

class OpenseaNFT extends ChangeNotifier {
  int id;
  String token_id;
  int num_sales;
  String background_color;
  String image_url;
  String image_preview_url;
  String image_thumbnail_url;
  String image_original_url;
  String animation_url;
  String animation_original_url;
  String name;
  String description;
  String external_url;
  Map asset_contract;
  String permalink;
  Map collection;
  Map owner;
  Map creator;
  Map last_sale;





  OpenseaNFT.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as int,
        num_sales = json['num_sales'] as int,
        token_id = json['token_id'] as String,
        background_color = json['background_color'] as String,
        image_url = json['image_url'] as String,
        image_preview_url = json['image_preview_url'] as String,
        image_thumbnail_url = json['image_thumbnail_url'] as String,
        image_original_url = json['image_original_url'] as String,
        animation_url = json['animation_url'] as String,
        animation_original_url = json['animation_original_url'] as String,
        name = json['name'] as String,
        description = json['description'] as String,
        external_url = json['external_url'] as String,
        permalink = json['permalink'] as String,
        asset_contract = json['asset_contract'] as Map,
        collection = json['collection'] as Map,
        owner = json['owner'] as Map,
        creator = json['creator'] as Map,
        last_sale = json['last_sale'] as Map

  ;

  OpenseaNFT({
    this.id,
    this.num_sales,
    this.token_id,
    this.background_color,
    this.image_url,
    this.image_preview_url,
    this.image_thumbnail_url,
    this.image_original_url,
    this.animation_url,
    this.animation_original_url,
    this.name,
    this.description,
    this.external_url,
    this.permalink,
    this.asset_contract,
    this.collection,
    this.owner,
    this.creator,
    this.last_sale

  });
}
