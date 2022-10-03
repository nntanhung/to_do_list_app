class AppRole {
  static const String basic = 'MEGA_PRODUCER';
  static const String leader = 'MEGA_LEADER';
  static const String admin = 'MEGA_SYS_ADMIN';
  static const String content = 'MEGA_CONTENT';
  static const String reportActivity = 'MEGA_REPORT_ACTIVITY';
  static const String reportMeeting = 'MEGA_REPORT_MEETING';
  static const String aiaoneLogin = 'AIAONE_LOGIN';
}

class AppPermission {
  static const String filter = 'MEGA_TEAM_MEMBER_FILTER_CONTROL_VIEW';
  static const String news = 'MEGA_NEWS_VIEW';
  static const String teamActivity = 'MEGA_SALES_REVIEW_TEAM_ACTIVITY_VIEW';
  static const String sale = 'MEGA_SALES_PIPELINE_VIEW';

  static const String calendar = 'CALENDAR_READ';
  static const String meetingCreate = 'MEGA_ONLINE_MEETING_CREATE';
  static const String meetingCancel = 'MEGA_ONLINE_MEETING_CANCEL';
  static const String meetingUpdate = 'MEGA_ONLINE_MEETING_UPDATE';
  static const String meetingJoin = 'MEGA_ONLINE_MEETING_JOIN';
  static const String meetingRead = 'MEGA_ONLINE_MEETING_READ';
  static const String meetingNoteRead = 'MEGA_ONLINE_MEETING_NOTE_READ';
  static const String meetingNoteCreate = 'MEGA_ONLINE_MEETING_NOTE_CREATE';
  static const String meetingNoteUpdate = 'MEGA_ONLINE_MEETING_NOTE_UPDATE';
}

class Authorization {
  List<String> roles;
  List<String> permissions;

  Authorization(this.roles, this.permissions);
}

enum FeatureKey {
  news,
  teamActivity,
  salesPipeline,
  login,
  personalsSalesPipeline,
  groupsSalesPipeline,
  personalFilter,
  leaderFilter,
  activity,
  plan,
  ilead
}

class AuthorizationBuilder {
  static Map<FeatureKey, Authorization> map = {
    FeatureKey.news:
        Authorization([AppRole.basic, AppRole.leader], [AppPermission.news]),
    FeatureKey.teamActivity:
        Authorization([AppRole.leader], [AppPermission.teamActivity]),
    FeatureKey.groupsSalesPipeline:
        Authorization([AppRole.leader], [AppPermission.teamActivity]),
    FeatureKey.personalsSalesPipeline:
        Authorization([AppRole.basic], [AppPermission.sale]),
    FeatureKey.personalFilter:
        Authorization([AppRole.basic, AppRole.leader], [AppPermission.sale]),
    FeatureKey.leaderFilter:
        Authorization([AppRole.leader], [AppPermission.filter]),
    FeatureKey.activity: Authorization([AppRole.basic, AppRole.leader], []),
    FeatureKey.plan: Authorization([
      AppRole.basic,
      AppRole.leader
    ], [
      AppPermission.calendar,
      AppPermission.meetingRead,
      AppPermission.meetingCreate,
      AppPermission.meetingCancel,
      AppPermission.meetingUpdate,
      AppPermission.meetingJoin,
      AppPermission.meetingNoteRead,
      AppPermission.meetingNoteCreate,
      AppPermission.meetingNoteUpdate
    ])
  };
}
