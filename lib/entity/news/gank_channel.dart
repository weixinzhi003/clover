class GankChannel{
  String title;//显示的tab名称
  String param;//请求的参数名称

  NewsChannel(String title){
    this.title = title;
    this.param = title;
  }

  GankChannel.build(String title, String param){
    this.title = title;
    this.param = param;
  }

//  福利 | Android | iOS | 休息视频 | 拓展资源 | 前端 | all
  static const channelTitles = [
    '全部','Android','iOS','前端','拓展资源','休息视频','福利'
  ];
  static const channelParams = [
    'all','Android','iOS','前端','拓展资源','休息视频','福利'
  ];
}