class Card_model {
  String imgurl;
  String title;
  String duration;
  String description;
  bool audio;
  bool video;
  bool textual;
  bool isfav;
  bool isChecked = false;
  String courseId = "";
  String courseDay = "";
  String videoUrl = "";
  String priceWithoutDiscount;
  String priceWithDiscount;
  String statusTiming;
  String videoId = "";
  String productId = "";
  String priceId = "";
  List images = [];
  int countAdded = 0;
  String address = "";
  String cartId = "";
  String bodyPart;
  Card_model(
      {this.audio,
        this.video,
        this.textual,
        this.imgurl,
        this.isChecked,
        this.countAdded,
        this.title,
        this.duration,
        this.description,
        this.isfav,
        this.courseId,
        this.courseDay,
        this.videoUrl,
        this.videoId,
        this.priceWithoutDiscount,
        this.priceWithDiscount,
        this.statusTiming,
        this.productId,
        this.images,
        this.address,
        this.priceId,
        this.cartId,
        this.bodyPart});
}
