class Student {
  final int id;
  final String kode;
  final String name;
  final int sks;
  final int semester;
  final int dosen;

  Student({this.id, this.kode, this.name, this.sks, this.semester, this.dosen});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      kode: json['kode'],
      name: json['name'],
      sks: json['sks'],
      semester: json['semester'],
      dosen: json['dosen'],
    );
  }

  Map<String, dynamic> toJson() => {
    'kode': kode,
    'name': name,
    'sks': sks,
    'semester': semester,
    'dosen': dosen,
  };
}