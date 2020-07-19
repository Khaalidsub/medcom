import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/firestoreConverter.dart';

class GenericsProvider<T> {
  final CollectionReference dataCollection;
  FireStoreConverter<T> _converter;
  String id;
  String whereId;
  // Firestore.instance.collection('Appointments');
  GenericsProvider(this.dataCollection, {this.id, this.whereId});

  Stream<T> get data {
    return dataCollection.document(id).snapshots().map(_dataFromSnap);
  }

  Stream<List<T>> get dataList {
    return dataCollection.where(whereId, isEqualTo: id).snapshots().map(_list);
  }

  Stream<List<T>> get dataListArrayContains {
    return dataCollection
        .where(whereId, arrayContains: id)
        .snapshots()
        .map(_list);
  }

  Future setData(T data, String id) async {
    await dataCollection.document(id).setData(_converter.toFireStore());
  }

  //map it to an appoitment object
  T _dataFromSnap(DocumentSnapshot snap) {
    T t;
    t = _converter.fromFireStore(snap);

    return t;
  }

  ///map a list of patient
  List<T> _list(QuerySnapshot snapshots) {
    return snapshots.documents.map(_dataFromSnap).toList();
  }
}
