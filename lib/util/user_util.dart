import 'package:clover/entity/user/user.dart';

class UserUtil{

  static User getLoginUser(){
    User user = new User(
      username:"餐桌清道夫",
      avatar: 'https://upload-images.jianshu.io/upload_images/15781245-4219a73993bb7a7d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/500/format/webp',
      fansCount: 20,
      followCount: 30,
      postCount: 40,
      favoriteCount: 50,
    );
    return user;
  }

}