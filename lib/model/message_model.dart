class MessageModel {
  String imagePath;
  String name;
  String message;
  String time;
  bool isOnline;

  MessageModel(
      {required this.imagePath,
      required this.name,
      required this.message,
      required this.time,
      required this.isOnline});
}
