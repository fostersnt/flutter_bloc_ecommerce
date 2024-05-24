class UserModel {
  final String name;
  final int age;
  final String address;

  UserModel({required this.name, required this.age, required this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'], age: json['age'], address: json['address']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age, 'address': address};
  }
}
