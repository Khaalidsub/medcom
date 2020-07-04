import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/user.dart';

class Medicine extends User {
  String name;
  DateTime dateStart;
  DateTime dateEnd;
  String prescription;
  String daily;
  String ownerId;
  Medicine(
      {this.name,
      this.dateStart,
      this.prescription,
      this.dateEnd,
      this.daily,
      this.ownerId,
      String documentId});
  Medicine.copy(Medicine from)
      : this(
            name: from.name,
            dateStart: from.dateStart,
            dateEnd: from.dateEnd,
            daily: from.daily);
  fromFirestore(DocumentSnapshot snaps) {
    if (snaps.data['medicines'] != null) {
      List<Medicine> medicines = List.from(snaps.data['medicines']).map((map) {
        return Medicine.fromFirestore(map);
      }).toList();
      return medicines;
    }
    return null;
  }

  Medicine.fromFirestore(Map<String, dynamic> map)
      : this(
            name: map['name'],
            dateStart: DateTime.parse(map['dateStart']),
            dateEnd: DateTime.parse(map['dateEnd']),
            daily: map['daily']);

  toFirestore() {
    return {
      'name': this.name,
      'dateStart': this.dateStart.toString(),
      'dateEnd': this.dateEnd.toString(),
      'daily': this.daily
    };
  }
}
