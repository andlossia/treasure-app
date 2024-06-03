class Media {
  late int mediaTaskID;
  late String fileName;
  late String mediaPath;
  late String mediaType;
  late int fileSize;
  late DateTime uploadedDate;

  Media({
    required this.mediaTaskID,
    required this.fileName,
    required this.mediaPath,
    required this.mediaType,
    required this.fileSize,
    required this.uploadedDate,
  });
}
