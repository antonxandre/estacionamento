import 'dart:convert';

class VagaModel {
  String name;

  bool hasLeft;
  bool finalized;
  DateTime enterAt;
  DateTime? leftAt;
  VagaModel({
    required this.name,
    required this.hasLeft,
    required this.finalized,
    required this.enterAt,
    required this.leftAt,
  });

  VagaModel copyWith({
    int? id,
    String? name,
    num? valor,
    bool? hasLeft,
    bool? finalized,
    DateTime? enterAt,
    DateTime? leftAt,
  }) {
    return VagaModel(
      name: name ?? this.name,
      hasLeft: hasLeft ?? this.hasLeft,
      finalized: finalized ?? this.finalized,
      enterAt: enterAt ?? this.enterAt,
      leftAt: leftAt ?? this.leftAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hasLeft': hasLeft,
      'finalized': finalized,
      'enterAt': enterAt.millisecondsSinceEpoch,
      'leftAt': leftAt?.millisecondsSinceEpoch,
    };
  }

  factory VagaModel.fromMap(Map<String, dynamic> map) {
    return VagaModel(
      name: map['name'] ?? '',
      hasLeft: map['hasLeft'] ?? false,
      finalized: map['finalized'] ?? false,
      enterAt: DateTime.fromMillisecondsSinceEpoch(map['enterAt']),
      leftAt: map['leftAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['leftAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VagaModel.fromJson(String source) =>
      VagaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VagaModel(name: $name, hasLeft: $hasLeft, finalized: $finalized, enterAt: $enterAt, leftAt: $leftAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VagaModel &&
        other.name == name &&
        other.hasLeft == hasLeft &&
        other.finalized == finalized &&
        other.enterAt == enterAt &&
        other.leftAt == leftAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        hasLeft.hashCode ^
        finalized.hashCode ^
        enterAt.hashCode ^
        leftAt.hashCode;
  }
}
