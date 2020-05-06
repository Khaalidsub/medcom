class Medicine {
  String name;
  DateTime dateStart;
  DateTime dateEnd;
  String prescription;
  String daily;
  Medicine(
      {this.name, this.dateStart, this.prescription, this.dateEnd, this.daily});
  Medicine.copy(Medicine from)
      : this(
            name: from.name,
            dateStart: from.dateStart,
            prescription: from.prescription,
            dateEnd: from.dateEnd,
            daily: from.daily);
}
