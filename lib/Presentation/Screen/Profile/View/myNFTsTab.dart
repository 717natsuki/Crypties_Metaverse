import 'package:crypties_app/Domain/NFT/MoralisNFT.dart';
import 'package:crypties_app/exports.dart';
import 'dart:convert';

class MyNFTsTab extends StatefulWidget {
  final nfts;

  MyNFTsTab(this.nfts);
  @override
  _MyNFTsTabState createState() => _MyNFTsTabState();
}

class _MyNFTsTabState extends State<MyNFTsTab> {
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
    return Scaffold(
      appBar: settingAppbar(context, 'NFTs'),
      backgroundColor: Colors.white,
      body: GridView.builder(
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
      ),
    );
  }
}
