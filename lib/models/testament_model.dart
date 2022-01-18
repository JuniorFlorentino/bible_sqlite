class TestamentModel {
  late int id;
  late String name;

  TestamentModel({
    required this.id,
    required this.name,
  });

  TestamentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
