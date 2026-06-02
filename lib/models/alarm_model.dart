class AlarmModel {
  String id;
  int hour;
  int minute;
  String label;
  bool isEnabled;

  bool mathChallenge;
  bool readyPhotoChallenge;
  bool selfieChallenge;

  AlarmModel({
    required this.id,
    required this.hour,
    required this.minute,
    required this.label,
    this.isEnabled = true,
    this.mathChallenge = false,
    this.readyPhotoChallenge = false,
    this.selfieChallenge = false,
  });

  //  Convert object → Map (for storage)
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "hour": hour,
      "minute": minute,
      "label": label,
      "isEnabled": isEnabled,
      "mathChallenge": mathChallenge,
      "readyPhotoChallenge": readyPhotoChallenge,
      "selfieChallenge": selfieChallenge,
    };
  }

  // Convert Map → object (for loading)
  factory AlarmModel.fromMap(Map data) {
    return AlarmModel(
      id: data["id"],
      hour: data["hour"],
      minute: data["minute"],
      label: data["label"],
      isEnabled: data["isEnabled"] ?? true,
      mathChallenge: data["mathChallenge"] ?? false,
      readyPhotoChallenge: data["readyPhotoChallenge"] ?? false,
      selfieChallenge: data["selfieChallenge"] ?? false,
    );
  }
}