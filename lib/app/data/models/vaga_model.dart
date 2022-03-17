import 'dart:convert';

class VagaModel {
  int id;
  String name;
  bool occupied;
  DateTime enterAtl;
  DateTime leftAt;
  VagaModel({
    required this.id,
    required this.name,
    required this.occupied,
    required this.enterAtl,
    required this.leftAt,
  });

  VagaModel copyWith({
    int? id,
    String? name,
    bool? occupied,
    DateTime? enterAtl,
    DateTime? leftAt,
  }) {
    return VagaModel(
      id: id ?? this.id,
      name: name ?? this.name,
      occupied: occupied ?? this.occupied,
      enterAtl: enterAtl ?? this.enterAtl,
      leftAt: leftAt ?? this.leftAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'occupied': occupied,
      'enterAtl': enterAtl.millisecondsSinceEpoch,
      'leftAt': leftAt.millisecondsSinceEpoch,
    };
  }

  factory VagaModel.fromMap(Map<String, dynamic> map) {
    return VagaModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      occupied: map['occupied'] ?? false,
      enterAtl: DateTime.fromMillisecondsSinceEpoch(map['enterAtl']),
      leftAt: DateTime.fromMillisecondsSinceEpoch(map['leftAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VagaModel.fromJson(String source) =>
      VagaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VagaModel(id: $id, name: $name, occupied: $occupied, enterAtl: $enterAtl, leftAt: $leftAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VagaModel &&
        other.id == id &&
        other.name == name &&
        other.occupied == occupied &&
        other.enterAtl == enterAtl &&
        other.leftAt == leftAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        occupied.hashCode ^
        enterAtl.hashCode ^
        leftAt.hashCode;
  }
}
