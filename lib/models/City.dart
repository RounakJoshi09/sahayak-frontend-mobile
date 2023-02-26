// ignore_for_file: file_names

class City {
  String stateId;
  String cityName;
  String cityId;

  City({required this.stateId, required this.cityName, required this.cityId});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      stateId: json['state_id'],
      cityId: json['id'],
      cityName: json['city_name'],
    );
  }
}

class CityList {
  List<City> cityList = [];

  CityList(this.cityList);

  factory CityList.fromJson(List<dynamic> json) {
    List<City> citiesList;

    citiesList = json.map((i) => City.fromJson(i)).toList();

    return CityList(citiesList);
  }
}
