class NotificationData {
  static const String idField = 'id';
  static const String notificationIdField = 'notificationId';
  static const String subtitle1Field = 'subtitle1';
  static const String descriptionField = 'description';
  static const String hourField = 'hour';
  static const String minuteField = 'minute';

  String id;
  int notificationId;
  String subtitle1;
  String description;
  int hour;
  int minute;

  NotificationData(this.subtitle1, this.description, this.hour, this.minute);

  NotificationData.fromDb(Map<String, dynamic> json, String id) {
    this.id = id;
    this.notificationId = json[notificationIdField];
    this.subtitle1 = json[subtitle1Field];
    this.description = json[descriptionField];
    this.hour = json[hourField];
    this.minute = json[minuteField];
  }

  Map<String, dynamic> toJson() {
    return {
      notificationIdField: this.notificationId,
      subtitle1Field: this.subtitle1,
      descriptionField: this.description,
      hourField: this.hour,
      minuteField: this.minute,
    };
  }

  @override
  String toString() {
    return 'subtitle1: $subtitle1, notificationId: $notificationId, hour: $hour, minute: $minute';
  }
}
