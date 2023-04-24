class LocalService{
  static List<String> commentContainerImages = [
    "assets/images/person_girl1.jpg",
    "assets/images/person_girl2.jpg",
    "assets/images/person_man1.jpg",
    "assets/images/person_man2.jpg",
    "assets/images/person_man3.jpg",
    "assets/images/person_girl3.jpg",
    "assets/images/person_man4.jpg",
    "assets/images/person_man5.jpg",
    "assets/images/person_girl5.jpg",
    "assets/images/person_man6.jpg",
  ];
  static List<String> commentContainerTimes = [
    "3m",
    "37m",
    "1h",
    "5h",
    "10h",
    "18h",
    "1d",
    "1d",
    "2d",
    "5d",
  ];
}

class CustomCommentContainerImageUrl{
  final String url;
  CustomCommentContainerImageUrl({required this.url});
}
class CustomCommentContainerTime{
  final String time;
  CustomCommentContainerTime({required this.time});
}

