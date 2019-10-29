class ApiUrl {
  static final String base = "https://apps.swufe-online.com/";

  // 用户登录
  static final String login = "m/Login/AppCheckUser";

  // 获取主页面的数据
  static final String getCourseList = "m/CoursePlan/getMainListNetedu";

  // 学生学籍信息
  static final String getStuInfo = "m/StuInfo/NetEduStuInfoXj";

  // 当前所有课程作业列表
  static final String getSubjecthomework = "m/Job/GetTermCourseOhVerStat";

  // 教材列表
  static final String getTeachBookList = "m/Pdf/GetPdfList";

  // 提交PDF阅读记录
  static final String submitPdfReadingLog = "m/Pdf/SubmitPdfReadingLog";

  // 提交PDF阅读记录 进入阅读时调用
  static final String submitPdfReadingLogInit = "m/Pdf/SubmitPdfReadingLogInit";

  // 学习指南流程图列表
  static final String getOsgList = "m/Osg/GetList";

  // 学习指南全数据
  static final String getOsgDataList = "m/Osg/GetDataList";

  // 新闻列表
  static final String getNewsList = "m/OA/GetNewsDataList";

  // 通知列表
  static final String getMsgList = "m/OA/GetMsgDataList";

  // 公告列表
  static final String getNoticeList = "m/Osg/GetNoticeDataList";

  // 所有课程所有作业，1000多条数据
  static final String getAllSubjecthomeworkList = "m/OnlineHomework/CacheOh";

  //最新通知
  static final String lastestNotice =
      "m/CourseInfo/GetCourseNotificationByUidKc";

  //获取视频播放列表
  static final String getVodListNetedu = "m/CourseInfo/getVodListNetedu";

  //获取作业列表

  // 改12.11
  static final String getHomeworkMainList = "m/job/GetCourseJobDetail";

  // 获取教材列表[教材]
  static final String getTeachBookPdfList = "m/Pdf/GetPdfList";
}
