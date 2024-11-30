class Student {
  final int? id;
  final String name;
  final String phone;
  final String email;
  final String location;

  Student(
      {this.id, required this.name, required this.phone, required this.email, required this.location});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'location': location,
    };
  }
}