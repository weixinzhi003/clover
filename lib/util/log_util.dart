class LogUtil{

  static String TAG = "Clover";

  static void log(String content){
    print('$TAG $content');
  }

  static void logTag(String tag, String content){
    print('$tag $content');
  }

}