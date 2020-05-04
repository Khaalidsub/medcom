class Appointment {
  DateTime _date;
  String day;
  String _description;
  String _ownerId; //storing the owner of this appointment.
  String status; // latest or history

  Appointment(
      this._date, this.day, this._description, this._ownerId, this.status);

//copy constructor
  Appointment.copy(Appointment from)
      : this(from._date, from.day, from._description, from._ownerId,
            from.status) ;
//usual
  get date => this._date;
  get description => this._description;
  get id => this._ownerId;
}

//mock data to test the appointment fucntionality
