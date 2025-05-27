class MessageModel {
  String? message;
  String time;
  bool isMe;
  bool isImage ;
  String? imagePath;

  MessageModel({ this.message, required this.time, required this.isMe, this.isImage = false, this.imagePath});
}
