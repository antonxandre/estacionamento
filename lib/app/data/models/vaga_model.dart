import 'dart:convert';

class VagaModel {
  String name;
  bool occupied;
  DateTime enterAtl;
  DateTime leftAt;
  VagaModel({
    required this.name,
    required this.occupied,
    required this.enterAtl,
    required this.leftAt,
  });

  VagaModel copyWith({
    String? name,
    bool? occupied,
    DateTime? enterAtl,
    DateTime? leftAt,
  }) {
    return VagaModel(
      name: name ?? this.name,
      occupied: occupied ?? this.occupied,
      enterAtl: enterAtl ?? this.enterAtl,
      leftAt: leftAt ?? this.leftAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'occupied': occupied,
      'enterAtl': enterAtl.millisecondsSinceEpoch,
      'leftAt': leftAt.millisecondsSinceEpoch,
    };
  }

  factory VagaModel.fromMap(Map<String, dynamic> map) {
    return VagaModel(
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
    return 'VagaModel(name: $name, occupied: $occupied, enterAtl: $enterAtl, leftAt: $leftAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VagaModel &&
        other.name == name &&
        other.occupied == occupied &&
        other.enterAtl == enterAtl &&
        other.leftAt == leftAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        occupied.hashCode ^
        enterAtl.hashCode ^
        leftAt.hashCode;
  }
}
