class Data {
  final int id;
  String country;
  int confirmed;
  int deaths;
  int recoveries;

  Data(this.id, this.country, this.confirmed, this.deaths, this.recoveries);

  static List<Data> getData() {
    return <Data> [
      Data(1, 'Vietnam', 16, 0, 15),
      Data(2, 'China', 85000, 2500, 25000),
      Data(3, 'Korea', 1000, 8, 100),
      Data(4, 'Iran', 43, 12, 0),
      Data(5, 'Philippines', 3, 1, 2),
      Data(6, 'Japan', 850, 5, 30),
    ];
  }
}