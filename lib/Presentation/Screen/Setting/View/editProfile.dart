import 'package:crypties_app/Model/User/updateEachField.dart';
import 'package:crypties_app/exports.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final UserDomain providerUser = Provider.of<UserDomain>(context);
    final Entity providerEntity = Provider.of<Entity>(context);


    return Scaffold(
        appBar: settingAppbar(context, 'Edit Profile'),

        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {

                      // HapticFeedback.selectionClick();
                      // Navigator.pushNamed(context, kNavigatorString.profileNft);
                      HapticFeedback
                          .selectionClick();
                      bool result =
                      await showModalBottomSheet<
                          bool>(
                        context: context,
                        builder: (BuildContext
                        context) {
                          return StatefulBuilder(
                              builder:
                                  (BuildContext
                              context,
                                  setState) {
                                return Column(
                                  mainAxisSize:
                                  MainAxisSize
                                      .min,
                                  children: <
                                      Widget>[
                                    ListTile(
                                      title:
                                      Row(
                                        children: [
                                          ShaderMask(
                                            shaderCallback: (bounds) => GradientConst.themeGradientLine.createShader(
                                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                            ),
                                            child: Text(
                                              providerEntity.walletAddress == null || providerEntity.walletAddress.length < 4?
                                                  'Use your NFT as avatar':
                                              'Choose NFT', style: TextStyle(
                                              fontSize: 16, fontWeight: FontWeight.w700,
                                              color: Colors.white

                                            ),),
                                          ),
                                        ],
                                      ),

                                      onTap: ()async{
                                        HapticFeedback.selectionClick();
                                       if( providerEntity.walletAddress == null || providerEntity.walletAddress.length < 4){
                                         Navigator.pushNamed(context, kNavigatorString.metamaskSetting);

                                       }else{
                                         Navigator.pushNamed(context, kNavigatorString.profileNft);

                                       }

                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => LikedUsers(
                                        //   postId: widget.postInfo['postId'],
                                        // )),
                                        // );


                                      },
                                    ),
                                    ListTile(
                                      title: Text('Choose from photo library', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                      onTap: ()async{
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => LikedUsers(
                                        //   postId: widget.postInfo['postId'],
                                        // )),
                                        // );
                                        File imageFile = await getImageAvatar(context );
                                        try{
                                          showProgressBar(context);
                                          String url;
                                          if (imageFile != null){
                                            url = await uploadPic(imageFile);
                                            providerUser.setProfileImage(url);
                                            updateUser(FirebaseAuth.instance.currentUser.uid, 'profileNFT', '');
                                            updateUser(FirebaseAuth.instance.currentUser.uid, 'profileImage', url);
                                          }

                                          Navigator.pop(context);

                                        }catch(e){
                                          Navigator.pop(context);

                                        }



                                      },
                                    ),
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                );
                              });
                        },
                      );
                    },
                    child:settingEditProfileImage(kProfileInfo.profileImage, 'Natsuki Kataoka', providerUser)
                ),
              ),
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                      Navigator.pushNamed(context, kNavigatorString.nickname);

                    },
                    child:settingInputButton(kProfileInfo.nickname, providerUser.nickname.toString())
                ),
              ),
              Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                      Navigator.pushNamed(context, kNavigatorString.screenName
                      );

                    },
                    child:settingInputButton(kProfileInfo.username, '@${providerUser.screenName.toString()}')
                ),
              ),   Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                      Navigator.pushNamed(context, kNavigatorString.bio);

                    },
                    child:settingInputButton(kProfileInfo.bio, providerUser.bio.toString())
                ),
              ),   Container(
                color: Colors.white,
                child: TextButton(
                    onPressed: () async {
                      HapticFeedback.selectionClick();
                      Navigator.pushNamed(context, kNavigatorString.website);

                    },
                    child:settingInputButton(kProfileInfo.website,providerUser.url == null ? '' : providerUser.url.toString())
                ),
              ),
            ],
          ),
        ));
  }
}
