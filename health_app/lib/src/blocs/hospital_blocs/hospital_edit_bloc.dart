import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/hospital.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class HospitalEditBloc extends BlocBase {
  final _repository = Repository();
  Stream<User> get streamUserData => _repository.userData.asStream();
  final _name = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _numOfBeds = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _isSubmit = BehaviorSubject<bool>();
  //onChange
  Function(String) get changeName => _name.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(String) get changeNumOfBeds => _numOfBeds.sink.add;
  Function(String) get changeAddress => _address.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(bool) get showProgressBar => _isSubmit.sink.add;
  //streams
  Stream<String> get name => _name.stream;
  Stream<String> get phoneNumber => _phoneNumber.stream;
  Stream<String> get numOfBeds => _numOfBeds.stream;
  Stream<String> get address => _address.stream;
  Stream<String> get email => _email.stream;
  Stream<bool> get submitStatus => _isSubmit.stream;

  Future<Hospital> editHospital(Hospital hospital) {
    //do wonders here

    return null;
  }
}
