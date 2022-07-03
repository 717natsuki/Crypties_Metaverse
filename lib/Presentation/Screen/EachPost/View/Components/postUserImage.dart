import 'package:crypties_app/Presentation/Template/nftBadge.dart';
import 'package:crypties_app/exports.dart';

class PostUserProfile extends StatelessWidget {
  final userdata;
  PostUserProfile(this.userdata);

  @override

  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        HapticFeedback.selectionClick();

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile(
                userId: userdata.userId,
              )),
        );
      },
      child: (userdata.profileNFT == null || userdata.profileNFT.length < 5)
          ? profileNFT(userdata.profileImage, 48) :
      Stack(
        children: [
          profileNFT(userdata.profileNFT, 48),
          Padding(
            padding: const EdgeInsets.only(left:24.0,top: 30),
            child: Container(

                child: nftBadgeSmall()),
          )
        ],
      )
    );
  }
}
