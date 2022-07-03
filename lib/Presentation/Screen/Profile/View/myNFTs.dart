import 'package:crypties_app/Domain/NFT/MoralisNFT.dart';
import 'package:crypties_app/exports.dart';
import 'dart:convert';

class MyNFTs extends StatefulWidget {
  final nfts;

  MyNFTs(this.nfts);
  @override
  _MyNFTsState createState() => _MyNFTsState();
}

class _MyNFTsState extends State<MyNFTs> {
  // List nfts = [];
  // @override
  // void initState() {
  //
  //   initFunc();
  //   super.initState();
  // }
  // void initFunc()async{
  //   for(int i = 0; i< widget.moralisNFT.length; i++){
  //     OpenseaNFT nft = await getSingleNFT(widget.moralisNFT[i].token_address, widget.moralisNFT[i].token_id);
  //     nfts.add(nft);
  //     print(nft);
  //
  //   }
  //   setState(() {
  //     nfts = nfts;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.nfts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return  GestureDetector(
            onTap: (){
              HapticFeedback.selectionClick();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailNFT(
                          widget.nfts[index]
                      ))
              );
            },
            child: CachedNetworkImage(
              imageUrl: widget.nfts[index].image_url.toString(),
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
              widget. nfts[index].image_url.substring(widget.nfts[index].image_url.length - 3) == 'svg' ?
              SvgPicture.network(
                widget. nfts[index].image_url,
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
              ) :
              Container(),
              fit: BoxFit.cover,
            ),
          );
        }
    );
  }
}
Widget profileNFT(nft_image_url, size){
  return  ClipRRect(
    borderRadius: BorderRadius.circular(180.0),

    child: Container(
      width:size.toDouble(),
      height:size.toDouble(),
      child: CachedNetworkImage(
        imageUrl:nft_image_url.toString(),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Shimmer.fromColors(
                baseColor: ColorsConst.gray,
                highlightColor: ColorsConst.whiteGrey,
                child: Container(
                  width:size.toDouble(),
                  height:size.toDouble(),
                  color: Colors.grey,
                )
            ),
        errorWidget: (context, url, error) =>
         nft_image_url.substring(nft_image_url.image_url.length - 3) == 'svg' ?
        Container(
          width:100,
          height:100,
          child: SvgPicture.network(
            nft_image_url,
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator()),
          ),
        ) :
        Container(),
        fit: BoxFit.cover,
      ),
    ),
  );
}