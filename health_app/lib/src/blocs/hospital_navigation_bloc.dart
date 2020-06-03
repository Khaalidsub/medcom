import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class HospitalNavigationBloc extends BlocBase {
  String uid;
  Stream<User> get streamUserData => Repository().userData.asStream();
  @override
  void dispose() async {
    await streamUserData.drain();
    super.dispose();
  }
}
