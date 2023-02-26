// ignore_for_file: file_names, avoid_function_literals_in_foreach_calls, avoid_print

class Hospital {
  String id;
  String imageId;
  String hospitalName;
  String description;
  String email;
  String cityName;
  String stateName;
  String area;
  String street;

  Hospital(
      {required this.area,
      required this.cityName,
      required this.stateName,
      required this.street,
      required this.description,
      required this.email,
      required this.hospitalName,
      required this.id,
      required this.imageId});

  factory Hospital.fromJson(Map<String, dynamic> data) {
    return Hospital(
        area: data['address']['area'],
        cityName: data['address']['city_name'],
        stateName: data['address']['state_name'],
        street: data['address']['street'],
        description: data['description'],
        email: data['email'],
        hospitalName: data['hospital_name'],
        id: data['id'],
        imageId: data['image_id']);
  }
}

class HospitalList {
  List<Hospital> hospitalList = [];

  HospitalList(this.hospitalList);

  factory HospitalList.fromJson(List<dynamic> json) {
    List<Hospital> hospitals;

    hospitals = json.map((i) => Hospital.fromJson(i)).toList();

    hospitals.forEach(
      (element) => print(element.toString()),
    );

    return HospitalList(hospitals);
  }
}
