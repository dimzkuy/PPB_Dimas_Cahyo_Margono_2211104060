class Student {
  int? id;
  String name;
  String nim;
  String address;
  String hobby;

  Student({
    this.id,
    required this.name,
    required this.nim,
    required this.address,
    required this.hobby,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nim': nim,
      'address': address,
      'hobby': hobby,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      nim: map['nim'],
      address: map['address'],
      hobby: map['hobby'],
    );
  }
}