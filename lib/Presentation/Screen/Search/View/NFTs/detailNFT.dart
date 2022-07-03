import 'package:crypties_app/Domain/NFT/OpenseaNFT.dart';
import 'package:crypties_app/Presentation/Screen/EachPost/View/ImageView.dart';
import 'package:crypties_app/Presentation/Screen/NFTCreatorPage/View/creatorPage.dart';
import 'package:crypties_app/exports.dart';

class DetailNFT extends StatefulWidget {
  OpenseaNFT nft;

  DetailNFT(this.nft);

  @override
  _DetailNFTState createState() => _DetailNFTState();
}

class _DetailNFTState extends State<DetailNFT> {
  bool showOpenseaURL = false;

  @override
  void initState() {
    initFunc();
    super.initState();
  }

  void initFunc()async{
    final RemoteConfig remoteConfig = RemoteConfig.instance;
    remoteConfig.setDefaults(<String, dynamic>{
      'showOpenseaURL': false,
    });
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(seconds: 11),
    ));
    await remoteConfig.fetchAndActivate();

    showOpenseaURL = remoteConfig.getBool('showOpenseaURL');
    setState(() {
      showOpenseaURL = showOpenseaURL;
    });

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
        settingAppbar(context,widget.nft.name != null ? widget.nft.name.toString():widget.nft.collection['name'].toString())
        ,body: Builder(
        builder: (context) =>
          SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    HapticFeedback.selectionClick();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageViewPage(
                            url: widget.nft.image_url.toString(),
                          )),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl:widget.nft.image_url.toString(),
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Shimmer.fromColors(
                            baseColor: ColorsConst.gray,
                            highlightColor: ColorsConst.whiteGrey,
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey,
                            )
                        ),
                    errorWidget: (context, url, error) =>
                    widget.nft.image_url.substring(widget.nft.image_url.length - 3) == 'svg' ?
                    SvgPicture.network(
                      widget.nft.image_url,
                      placeholderBuilder: (BuildContext context) => Container(
                          padding: const EdgeInsets.all(30.0),
                          child: const CircularProgressIndicator()),
                    ) :
                    Container(),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:(){
                HapticFeedback.selectionClick();

                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => CreatorPage(widget.nft)
                ));
                },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(280.0),
                              child: Container(
                                width: 55,
                                height: 55,
                                child: CachedNetworkImage(
                                  imageUrl:widget.nft.asset_contract['image_url'].toString(),
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      Shimmer.fromColors(
                                          baseColor: ColorsConst.gray,
                                          highlightColor: ColorsConst.whiteGrey,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            color: Colors.grey,
                                          )
                                      ),
                                  errorWidget: (context, url, error) =>
                                  widget.nft.creator['profile_img_url'].toString().substring(widget.nft.creator['profile_img_url'].length - 3) == 'svg' ?
                                  SvgPicture.network(
                                    widget.nft.creator['profile_img_url'].toString(),
                                    placeholderBuilder: (BuildContext context) => Container(
                                        padding: const EdgeInsets.all(30.0),
                                        child: const CircularProgressIndicator()),
                                  ) :
                                  Container(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            SizedBox(width: 8,),
                            Flexible(child: Text(widget.nft.collection['name'].toString(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)),
                            SizedBox(width: 8,),
                            widget.nft.collection['safelist_request_status'] == 'verified' ?
                            Icon(Icons.verified, color: Colors.blue,) : SizedBox(),
                          ],
                        ),
                      ),

                     // Text(showOpenseaURL.toString()),
                      !showOpenseaURL ? SizedBox() :
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.nft.collection['description'] == null ? SizedBox() :

                          Column(
                            children: [
                              SizedBox(height: 16,),
                              Text(widget.nft.collection['description'].toString(), style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700, color: Colors.black26),),
                            ],
                          ),
                        SizedBox(height: 32,),

                        // Text('Sale', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black54),),
                        SizedBox(height: 0,),

                        if(showOpenseaURL)
                          chainInfo('Opensea URL', widget.nft.permalink.toString(),context),
                        if(showOpenseaURL)
                          SizedBox(height: 16,),

                        widget.nft.last_sale == null ? SizedBox():
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title('Sale'),

                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                widget.nft.last_sale['payment_token']['symbol'] == 'ETH' ?
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset('Assets/Images/eth_symbol.png',
                                      fit: BoxFit.contain,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      colorBlendMode: BlendMode.modulate),
                                ) : SizedBox(),
                                Text(( double.parse('${widget.nft.last_sale['payment_token']['eth_price']}')).toStringAsFixed(3) .toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.w900), ),
                                Text('(\$${double.parse(widget.nft.last_sale['payment_token']['usd_price']).toStringAsFixed(1)})',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black54),),

                              ],
                            ),
                            SizedBox(height: 24,),
                          ],
                        ),

                        title('Chain Info'),
                        // Text('Chain Info', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black54),),
                        chainInfo('Contract address', widget.nft.asset_contract['address'].toString(),context),
                        chainInfo('Schema', widget.nft.asset_contract['schema_name'].toString(),context),
                        widget.nft.asset_contract['external_link'] == null ? SizedBox() :
                        chainInfo('External link', widget.nft.asset_contract['external_link'].toString(),context),
                        chainInfo('Blockchain', 'Ethereum'.toString(),context, copy: false),
                        SizedBox(height: 32,),
                      ],)


                    ],
                  ),
                ),

                Container(),
              ],
            ),
          ),
        ));
  }
}
Widget chainInfo(title, object, context, {copy}){
  return  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,color: Colors.black38),
      ),
      SizedBox(height: 8,),
      Row(
        children: [
          Flexible(
            child: Text(object.toString(),      overflow: TextOverflow.ellipsis,
              maxLines: 1,),
          ),
          SizedBox(width: 4,),
          if(copy == null)
          GestureDetector(
              onTap: (){
                HapticFeedback.selectionClick();

                Clipboard.setData(
                    new ClipboardData(
                        text:object.toString()))
                    .then((_) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(
                      content: Text(
                          "Copied")));
                });
              },
              child: Icon(Icons.copy,size: 16,color: Colors.black38,)),
        ],
      ),
      SizedBox(height: 16,),

    ],
  );
}
Widget title(title){
  return                           Column(
    children: [

      Text(title.toString(), style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black54),),
      SizedBox(height: 16,),

    ],
  );
}