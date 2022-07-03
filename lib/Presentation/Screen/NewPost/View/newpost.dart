import 'package:crypties_app/exports.dart';
import 'package:hashtagable/hashtagable.dart';

import 'Components/appbar.dart';
import 'Components/newPostProfileIcon.dart';
class NewPost extends StatefulWidget {
  final postInfo;
  final postedUserInfo;
  final communityId;
  final communityData;
  final letterReceiverUid;
  final isRetweet;
  final isReply;
  final isQuote;

  NewPost(
      {this.postInfo,
      this.postedUserInfo,
      this.communityId,
      this.communityData,
      this.letterReceiverUid,
      this.isRetweet,
      this.isReply,
      this.isQuote});
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  String postText = '';
  File selectedImage;

  @override
  Widget build(BuildContext context) {
    final UserDomain providerUser = Provider.of<UserDomain>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.white,
        appBar: newPostAppbar(postText, context, widget.isQuote, widget.postInfo,
        widget.isReply != null && widget.isReply ? 'Reply':
            widget.isQuote != null && widget.isQuote ? 'Quote':'Post',
          widget.isReply,
            selectedImage
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16,left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        (providerUser.profileNFT == null || providerUser.profileNFT.length < 5)
                            ? profileNFT(providerUser.profileImage, 48) :
                        profileNFT(providerUser.profileNFT, 48),
                        SizedBox(width: 16,),


                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.isReply != true ? SizedBox():
                              Row(
                                children: [
                                  Text('Replying to '),
                        // Text('@${widget.postInfo['userInfo'].screenName}')
                                  Text('@${widget.postInfo['userInfo'].screenName}',style: ThemeTextConst.mentionStyle,),
                                ],
                              ),
                              HashTagTextField(
                                maxLength: 280,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                // maxLines: 20,
                                textInputAction: TextInputAction.newline,
                                autofocus: true,
                                decoratedStyle: TextStyle(color: Colors.blue),
                                basicStyle: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'What’s happening?',
                                    counter: SizedBox(
                                      width: 0,
                                      height: 0,
                                    )),
                                onChanged: (value) {
                                  postText = value;
                                  setState(() {
                                    postText = postText;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    widget.isQuote != null && widget.isQuote == true ?
                    QuotedPost(widget.postInfo, widget.postedUserInfo) : SizedBox(),
                    selectedImage!= null
                        ? Row(
                      children: [
                        Container(
                            width: 200,
                            height: 200,
                            child: Image.file(
                              selectedImage,
                              fit: BoxFit.contain,
                            )),
                      ],
                    )
                        : SizedBox(),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).viewInsets.bottom + 14,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(width: 8,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Container(
                        // width: 20,
                        height: 20,
                        child: FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(0.0),
                          onPressed: () async {
                            HapticFeedback.selectionClick();

                            print('clicked');
                              HapticFeedback.selectionClick();
                              selectedImage = await getImage(context);
                              setState(() {
                                selectedImage = selectedImage;
                              });

                          },
                          child: Icon(
                            Icons.image,
                            color: Colors.black87,
                            size: 29,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
