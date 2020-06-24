import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:health_app/src/models/patient.dart';
import 'package:health_app/src/screens/hospitalScreens/add_medicine.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';


class MedicineBloc extends BlocBase {
   Repository _repository = new Repository();

  //sink and streams object
  final _name = BehaviorSubject<String>();
  final _start = BehaviorSubject<DateTime>();
  final _end = BehaviorSubject<DateTime>();
  final _time = BehaviorSubject<String>();

  final _isAdded = BehaviorSubject<bool>();


  //onChanged Functions

  Function(String) get changename => _name.sink.add;
  Function(DateTime) get changedatestart => _start.sink.add;
  Function(DateTime) get changedateend => _end.sink.add;
  Function(String) get changetime => _time.sink.add;
  Function(bool) get showifadded => _isAdded.sink.add;

  //stream functions
  Stream<String> get name => _name.stream;
  Stream<DateTime> get start => _start.stream;
  Stream<DateTime> get end => _end.stream;
  Stream<String> get time => _time.stream;
  Stream<bool> get ifaddedStatus => _isAdded.stream;

  //add medicine
  Future<Medicine> addMedicine(){
    Medicine medicine = new Medicine(
        name: _name.value,
        dateStart: _start.value,
        dateEnd: _end.value,
        daily: _time.value,
        );

    //return _repository.addAppoitment(medicine);
  }




  @override
  void dispose() async {
    super.dispose();
    await _name.drain();
    _name.close();
    await _time.drain();
    _time.close();
    await _start.drain();
    _start.close();
    await _end.drain();
    _end.close();
    

  }

}