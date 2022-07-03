import 'package:crypties_app/exports.dart';

class UserDomain extends ChangeNotifier {
  String userId;
  String profileImage;
  String nickname;
  String bio;
  DateTime createdAt;
  DateTime updatedAt;
  String pinnedPost;
  bool isNotifyLikeTimelinePost;
  bool isNotifyLikeCommunityPost;
  bool isNotifyReplyTimelinePost;
  bool isNotifyReplyCommunityPost;
  bool isNotifyChat;
  bool isNotifyFollower;
  String location;
  bool protected;
  String url;
  int postCount;
  String screenName;
  bool isAcceptChat;
  String profileNFT;
  bool isVerified;
  bool isBanned;
  int status;

  void setBio(String newBio) {
    bio = newBio;
    notifyListeners();
  }

  void setNickname(String newNickname) {
    nickname = newNickname;
    notifyListeners();
  }

  void setProfileNFT(String profileNFTUrl) {
    profileNFT = profileNFTUrl;
    notifyListeners();
  }
  void setProfileImage(String url) {
    profileImage = url;
    notifyListeners();
  }

  void setScreenName(String newName) {
    screenName = newName;
    notifyListeners();
  }

  void setUrl(String newUrl) {
    url = newUrl;
    notifyListeners();
  }

  void setUser(Map<dynamic, dynamic> json) {
    createdAt = (json['createdAt'] as Timestamp).toDate();
    userId = json['userId'] as String;
    profileImage = json['profileImage'] as String;
    nickname = json['nickname'] as String;
    bio = json['bio'] as String;
    updatedAt = (json['updatedAt'] as Timestamp).toDate();
    pinnedPost = json['pinnedPost'] as String;
    isNotifyLikeTimelinePost = json['isNotifyLikeTimelinePost'] as bool;
    isNotifyLikeCommunityPost = json['isNotifyLikeCommunityPost'] as bool;
    isNotifyReplyTimelinePost = json['isNotifyReplyTimelinePost'] as bool;
    isNotifyReplyCommunityPost = json['isNotifyReplyCommunityPost'] as bool;
    isNotifyChat = json['isNotifyChat'] as bool;
    isNotifyFollower = json['isNotifyFollower'] as bool;
    location = json['location'] as String;
    protected = json['protected'] as bool;
    isAcceptChat = json['isAcceptChat'] as bool;
    url = json['url'] as String;
    screenName = json['screenName'] as String;
    postCount = json['postCount'] as int;
    profileNFT = json['profileNFT'] as String;

    isVerified = json['isVerified'] as bool;
    isBanned = json['isBanned'] as bool;
    status = json['status'] as int;
    notifyListeners();
  }

  UserDomain.fromJson(Map<dynamic, dynamic> json)
      : createdAt = (json['createdAt'] as Timestamp).toDate(),
        userId = json['userId'] as String,
        profileImage = json['profileImage'] as String,
        nickname = json['nickname'] as String,
        bio = json['bio'] as String,
        updatedAt = (json['updatedAt'] as Timestamp).toDate(),
        pinnedPost = json['pinnedPost'] as String,
        isNotifyLikeTimelinePost = json['isNotifyLikeTimelinePost'] as bool,
        isNotifyLikeCommunityPost = json['isNotifyLikeCommunityPost'] as bool,
        isNotifyReplyTimelinePost = json['isNotifyReplyTimelinePost'] as bool,
        isNotifyReplyCommunityPost = json['isNotifyReplyCommunityPost'] as bool,
        isNotifyChat = json['isNotifyChat'] as bool,
        isNotifyFollower = json['isNotifyFollower'] as bool,
        location = json['location'] as String,
        protected = json['protected'] as bool,
        isAcceptChat = json['isAcceptChat'] as bool,
        url = json['url'] as String,
        screenName = json['screenName'] as String,
        profileNFT = json['profileNFT'] as String,
        postCount = json['postCount'] as int,
        isVerified = json['isVerified'] as bool,
        isBanned = json['isBanned'] as bool,
        status = json['status'] as int;
  // Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  //   'createdAt': createdAt.toString(),
  //   'text': text,
  //   'image': image,
  //   'imageOpened': imageOpened,
  //   'messageId': messageId,
  //   'receiver': receiver,
  //   'sender': sender,
  //   'type': type,
  //   'chatId': chatId,
  // };

  UserDomain({
    this.createdAt,
    this.userId,
    this.profileImage,
    this.nickname,
    this.bio,
    this.updatedAt,
    this.pinnedPost,
    this.isNotifyLikeTimelinePost,
    this.isNotifyLikeCommunityPost,
    this.isNotifyReplyTimelinePost,
    this.isNotifyReplyCommunityPost,
    this.isNotifyChat,
    this.isNotifyFollower,
    this.location,
    this.protected,
    this.isAcceptChat,
    this.url,
    this.screenName,
    this.postCount,
    this.profileNFT,
    this.isVerified,
    this.isBanned,
    this.status
  });
}

// 更新可能なデータ
class PublicMetrics extends ChangeNotifier {
  int follower;
  int following;

  void setFollowing(int followingNum) {
    following = followingNum;
    notifyListeners();
  }

  void setFollower(int followerNum) {
    follower = followerNum;
    notifyListeners();
  }

  void setPublicMetrics(Map<dynamic, dynamic> json) {
    following = json['following'] as int;
    follower = json['follower'] as int;

    notifyListeners();
  }

  PublicMetrics.fromJson(Map<dynamic, dynamic> json)
      : following = json['following'] as int,
        follower = json['follower'] as int;

  PublicMetrics({this.following, this.follower});

}

class Entity extends ChangeNotifier {
  bool isBanned;
  bool isVerified;
  String walletAddress;
  int status;
  String walletAddress2;
  String walletAddress3;
  String walletAddress4;

  void setEntity(Map<dynamic, dynamic> json) {
    walletAddress4 = json['walletAddress4'] as String;
    walletAddress3 = json['walletAddress3'] as String;
    walletAddress2 = json['walletAddress2'] as String;
    status = json['status'] as int;
    walletAddress = json['walletAddress'] as String;
    isVerified = json['isVerified'] as bool;
    isBanned = json['isBanned'] as bool;

    notifyListeners();
  }

  Entity.fromJson(Map<dynamic, dynamic> json)
      : isBanned = json['isBanned'] as bool,
        isVerified = json['isVerified'] as bool,
        walletAddress = json['walletAddress'] as String,
        status = json['status'] as int,
        walletAddress2 = json['walletAddress2'] as String,
        walletAddress3 = json['walletAddress3'] as String,
        walletAddress4 = json['walletAddress4'] as String
  ;

  Entity({this.isBanned,this.isVerified,this.walletAddress,this.status,this.walletAddress2,this.walletAddress3,this.walletAddress4});
}
