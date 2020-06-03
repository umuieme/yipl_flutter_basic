class User {
  String name;
  String position;
  String company;
  String image;
  User(this.name, this.position, this.company, this.image);

  static List<User> getDummyUser() {
    return List.generate(
        20,
        (index) => User(
            "Umesh $index",
            "mobile developer",
            "Young Innovations Pvt. Ltd",
            "https://storage.googleapis.com/yipl-site/staffs/Umesh.jpg"));
  }
}
