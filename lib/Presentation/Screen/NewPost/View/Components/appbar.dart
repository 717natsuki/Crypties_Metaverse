import 'package:crypties_app/Model/Quote/createQuoteModel.dart';
import 'package:crypties_app/Model/Reply/createReply.dart';
import 'package:crypties_app/exports.dart';
Widget newPostAppbar(text, context, isQuote, quotingPostInfo, title, isReply,selectedImage){
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 8,bottom: 8,right: 16),
        child: GestureDetector(
          child: text.length < 1 ? buttonStylePostNoContent(title) : buttonStylePost(title),
          onTap: () async {
            HapticFeedback.selectionClick();

            showProgressBar(context);
            String url;
            if (selectedImage != null){
              url = await uploadPic(selectedImage);
            }

            if (text.length> 0){
                  bool isOk = false;
                  if(isQuote != null && isQuote){
                    isOk = await createQuotePost(FirebaseAuth.instance.currentUser.uid, text, quotingPostInfo,url,quotingPostInfo['userInfo']);
                  }
                  else if (isReply != null && isReply ){
                    // print(quotingPostInfo['userInfo'].toString());

                    isOk = await  createReplyModel(FirebaseAuth.instance.currentUser.uid,text,quotingPostInfo, url);

                    // createQuotePost(FirebaseAuth.instance.currentUser.uid, text, quotingPostInfo,null,quotingPostInfo['userInfo']);
                  } else {
                    isOk = await createPostModel(FirebaseAuth.instance.currentUser.uid, text, url,);
                  }
                  if (!isOk){
                    print('ERROR -----------------------------------------------');
                    errorPopup('Error', 'This post is invalid. Please check again.', context);
                  }else{
                    Navigator.pop(context);
                  }
            }
            Navigator.pop(context);
          },
        ),
      ),
    ],
  );
}