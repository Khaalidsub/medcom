import 'package:health_app/src/models/user.dart';

class Medicine extends User {
  String name;
  DateTime dateStart;
  DateTime dateEnd;
  String prescription;
  String daily;
  String ownerId;
  Medicine(
      {this.name, this.dateStart, this.prescription, this.dateEnd, this.daily, this.ownerId, String documentId});
  Medicine.copy(Medicine from)
      : this(
            name: from.name,
            dateStart: from.dateStart,
            prescription: from.prescription,
            dateEnd: from.dateEnd,
            daily: from.daily);
}
