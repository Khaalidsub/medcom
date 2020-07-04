import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/medicine.dart';
import 'package:rxdart/rxdart.dart';

class MedicineBloc extends BlocBase {
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
  Stream<String> get name => _name.stream.transform(_validateName);
  Stream<DateTime> get start => _start.stream;
  Stream<DateTime> get end => _end.stream;
  Stream<String> get time => _time.stream.transform(_validateTimesDaily);
  Stream<bool> get ifaddedStatus => _isAdded.stream;

  //validators
  final _validateTimesDaily = StreamTransformer<String, String>.fromHandlers(
      handleData: (timesDaily, sink) {
    if (timesDaily.length > 0) {
      sink.add(timesDaily.trim());
    } else {
      sink.addError('Enter a proper number!');
    }
  });
  final _validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length > 1) {
      sink.add(name.trim());
    } else {
      sink.addError('Enter a proper name!');
    }
  });
  bool validateFields() {
    if (_name.value != null &&
        _name.value.isNotEmpty &&
        _time.value != null &&
        _time.value.isNotEmpty) {
      return true;
    }
    return false;
  }

  //add medicine
  Medicine addMedicine() {
    Medicine medicine = new Medicine(
      name: _name.value,
      dateStart: _start.value,
      dateEnd: _end.value,
      daily: _time.value,
    );

    return medicine;
  }

  @override
  void dispose() async {
    await _name.drain();
    _name.close();
    await _time.drain();
    _time.close();
    await _start.drain();
    _start.close();
    await _end.drain();
    _end.close();
    await _isAdded.drain();
    _isAdded.close();
    super.dispose();
  }
}
