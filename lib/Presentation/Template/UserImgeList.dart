import 'package:crypties_app/exports.dart';

class UserImageList extends StatelessWidget {
  final userdata;
  UserImageList(this.userdata);

  @override
  Widget build(BuildContext context) {
    return

    FlatButton(
      onPressed: (){
        HapticFeedback.selectionClick();

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile(
                userId: userdata.userId,
              )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 8),
        child: Row(
          children: [
        (userdata.profileNFT == null ||userdata.profileNFT.length < 5)
            ? profileNFT(userdata.profileImage, 58) :
        profileNFT(userdata.profileNFT, 58),
             SizedBox(width: 16,),
             // UserImageList(posts[index]['userInfo'].profileImage),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(userdata.nickname.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                  Text(userdata.bio.toString(), maxLines: 2,style: TextStyle(color: ColorsConst.gray),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
