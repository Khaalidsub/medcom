import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:health_app/src/models/user.dart';
import 'package:health_app/src/services/repository.dart';

class WelcomingScreenBloc extends BlocBase {
  String uid;
  Stream<User> get streamUser => Repository().user;
  Stream<User> get streamUserData => Repository(documentId: uid).userData;

  Future<User> userStream() async {
    try {
      User user = await streamUser.first;
      uid = user.id;
      return streamUserData.first;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  void dispose() async {
    await streamUser.drain();
    await streamUserData.drain();
    super.dispose();
  }
}
