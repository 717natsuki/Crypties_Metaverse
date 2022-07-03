import 'package:crypties_app/Model/User/updateEachField.dart';
import 'package:crypties_app/Utility/getNFTCount.dart';
import 'package:crypties_app/exports.dart';

class ProfileNFT extends StatefulWidget {
  @override
  _ProfileNFTState createState() => _ProfileNFTState();
}

class _ProfileNFTState extends State<ProfileNFT> {
  List<OpenseaNFT> nfts = [];
  UserDomain providerUser;

  bool loaded = false;

  @override
  void initState() {
    // TODO: implement initState
    initFunc();
    super.initState();
  }

  void initFunc()async{
    Entity userE =  Provider.of<Entity>(context, listen: false);
    providerUser = Provider.of<UserDomain>(context, listen: false);

    nfts = await getNFTOwened(userE.walletAddress);
    setState(() {
      loaded = true;
      providerUser = providerUser;
      nfts = nfts;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingAppbar(context, 'Profile NFT'),
        backgroundColor: Colors.white,
        body:
      ! loaded ? nftShimmer() :

    GridView.builder(
            itemCount: nfts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return  GestureDetector(
                onTap: ()async{
                bool isOk = await  okCancelAlert('Select as your NFT avatar?', '', 'Select', 'Cancel', false, context);
                if(isOk){
                  providerUser.setProfileNFT(nfts[index].image_url);
                  updateUser(FirebaseAuth.instance.currentUser.uid, 'profileNFT', nfts[index].image_url);

                }
                },
                child: CachedNetworkImage(
                  imageUrl:nfts[index].image_url.toString(),
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
                  nfts[index].image_url.substring(nfts[index].image_url.length - 3) == 'svg' ?
                  SvgPicture.network(
                     nfts[index].image_url,
                    placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(30.0),
                        child: const CircularProgressIndicator()),
                  ) :
                  Container(),
                  fit: BoxFit.cover,
                ),
              );
            }
        ));
  }
}
