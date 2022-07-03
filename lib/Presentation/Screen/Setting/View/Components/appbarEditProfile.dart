import 'package:crypties_app/Model/User/checkUniqueScreenName.dart';
import 'package:crypties_app/Model/User/updateEachField.dart';
import 'package:crypties_app/exports.dart';
import 'package:http/http.dart' as http;


Widget editProfileAppbar(context, title, provider, content){
  return AppBar(
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    backgroundColor: Colors.white,
    title:Text(title,style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),),
    elevation: 0,
    actions: [
      TextButton(onPressed: () async {
        HapticFeedback.selectionClick();

        if (title == kProfileInfo.website){
        String urlLaunch = content.toString();
        if (await canLaunch(urlLaunch) || urlLaunch.length < 2) {
          content = content.trim().toLowerCase();

          provider.setUrl(content);

          updateUser(FirebaseAuth.instance.currentUser.uid, 'url', content);
          Navigator.pop(context);
        } else {
          errorPopup('Error','URL is invalid',context);
          throw 'Could not launch $urlLaunch';
        }



      } else if(title == kProfileInfo.nickname){
        provider.setNickname(content);
        Map unigram = {};
        for (int i = 0; content.length > i; i++){
          unigram[content[i]] = true;
        }
        updateUser(FirebaseAuth.instance.currentUser.uid, 'nickname', content);
        updateUser(FirebaseAuth.instance.currentUser.uid, 'nicknameUnigram', unigram);

        print(unigram.toString());

        Navigator.pop(context);

      } else if (title == kProfileInfo.username){
        bool existScreenName = await isExistScreenName(FirebaseAuth.instance.currentUser.uid, content);
        if (content.length < 4){
          errorPopup('Error', 'Username should be longer than 4 letters.', context);

        } else if(existScreenName){
          errorPopup('Error', 'This username is already taken.', context);

        } else {
          provider.setScreenName(content);
          Map unigram = {};
          for (int i = 0; content.length > i; i++){
            unigram[content[i]] = true;
          }
          updateUser(FirebaseAuth.instance.currentUser.uid, 'screenNameUnigram', unigram);
          updateUser(FirebaseAuth.instance.currentUser.uid, 'screenName', content);
          Navigator.pop(context);
        }




      } else if (title == kProfileInfo.bio){
        provider.setBio(content);
        updateUser(FirebaseAuth.instance.currentUser.uid, 'bio', content);
        Navigator.pop(context);
      }
      }, child: Text('Save'))
    ],
  );
}
