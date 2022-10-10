class AppRole {
  static const String basic = 'TODO_PRODUCER';
  static const String leader = 'TODO_LEADER';
  static const String admin = 'TODO_SYS_ADMIN';
  static const String content = 'TODO_CONTENT';
  static const String reportActivity = 'TODO_REPORT_ACTIVITY';
  static const String reportMeeting = 'TODO_REPORT_MEETING';
  static const String todoLogin = 'TODO_LOGIN';
}

class AppPermission {
  static const String filter = 'TODO_TEAM_MEMBER_FILTER_CONTROL_VIEW';
  static const String news = 'TODO_NEWS_VIEW';
  static const String teamActivity = 'TODO_SALES_REVIEW_TEAM_ACTIVITY_VIEW';
  static const String sale = 'TODO_SALES_PIPELINE_VIEW';

  static const String calendar = 'CALENDAR_READ';
  static const String meetingCreate = 'TODO_ONLINE_MEETING_CREATE';
  static const String meetingCancel = 'TODO_ONLINE_MEETING_CANCEL';
  static const String meetingUpdate = 'TODO_ONLINE_MEETING_UPDATE';
  static const String meetingJoin = 'TODO_ONLINE_MEETING_JOIN';
  static const String meetingRead = 'TODO_ONLINE_MEETING_READ';
  static const String meetingNoteRead = 'TODO_ONLINE_MEETING_NOTE_READ';
  static const String meetingNoteCreate = 'TODO_ONLINE_MEETING_NOTE_CREATE';
  static const String meetingNoteUpdate = 'TODO_ONLINE_MEETING_NOTE_UPDATE';
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
