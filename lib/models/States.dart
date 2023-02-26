// ignore_for_file: file_names

class States {
  String stateId;
  String stateName;

  States({required this.stateId, required this.stateName});

  factory States.fromJson(Map<String, dynamic> json) {
    return States(
      stateId: json['id'],
      stateName: json['stateName'],
    );
  }
}

class StateList {
  List<States> stateList = [];

  StateList(this.stateList);

  factory StateList.fromJson(List<dynamic> json) {
    List<States> stateList;

    stateList = json.map((i) => States.fromJson(i)).toList();

    return StateList(stateList);
  }
}
