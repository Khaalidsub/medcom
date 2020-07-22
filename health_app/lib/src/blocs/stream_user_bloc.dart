import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

abstract class StreamUserBloc extends BlocBase {
  // ignore: missing_required_param
  Stream<User> get streamUserData => Repository().userData.asStream();
  Future<User> userStream() async {
    try {
      return streamUserData.first;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  // ignore: must_call_super
  void dispose() async {
    await streamUserData.drain();
    // super.dispose();
  }
}
