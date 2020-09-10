class Result {
  double rate;
  double lastprice;
  String lastpricestr;
  double hacim;
  String hacimstr;
  double min;
  String minstr;
  double max;
  String maxstr;
  String time;
  String text;
  String code;

  Result(
      {this.rate,
      this.lastprice,
      this.lastpricestr,
      this.hacim,
      this.hacimstr,
      this.min,
      this.minstr,
      this.max,
      this.maxstr,
      this.time,
      this.text,
      this.code});

  String userAsString() {
    return 'Deneme';
  }

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    return Result(
      rate: double.parse(parsedJson['rate'].toString()),
      lastprice: double.parse(parsedJson['lastprice'].toString()),
      lastpricestr: parsedJson['lastpricestr'].toString(),
      hacim: double.parse(parsedJson['hacim'].toString()),
      hacimstr: parsedJson['hacimstr'].toString(),
      min: double.parse(parsedJson['min'].toString()),
      minstr: parsedJson['minstr'].toString(),
      max: double.parse(parsedJson['max'].toString()),
      maxstr: parsedJson['maxstr'].toString(),
      time: parsedJson['time'].toString(),
      text: parsedJson['text'].toString(),
      code: parsedJson['code'].toString(),
    );
  }
}

class HisseJson {
  bool success;
  List<Result> result;

  HisseJson(this.success, this.result);

  //JSON'dan gelen veriler parse edildi.
  HisseJson.fromjson(Map<String, dynamic> json) {
    success = json['success'];
    result = converterObject(json, 'result');
  }

  //JSON içerisindeki dynamic veriyi kendi nesnemize çevirmek için kullanıyoruz.
  List<Result> converterObject(Map<String, dynamic> json, String code) {
    var list = json[code] as List;
    return list.map((i) => Result.fromJson(i)).toList();
  }
}
