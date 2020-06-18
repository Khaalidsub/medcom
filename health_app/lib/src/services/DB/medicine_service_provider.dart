import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/models/medicine.dart';

class MedicineServiceProvider {
  final CollectionReference medicineCollection =
      Firestore.instance.collection('Medicine');
  String documentId;
  String patientId;
 MedicineServiceProvider ({this.documentId, this.patientId});



 ///get the appoitment
  Stream<Medicine> get appointment {
    return medicineCollection
        .document(documentId)
        .snapshots()
        .map(_medicineDataFromSnap);
  }

  


///get the patients for a specific medicine
  Stream<List<Medicine>> get patient {
    return medicineCollection
        .where('patientId', isEqualTo: patientId)
        .snapshots()
        .map(_patientListFromSnap);
  }

///add Medicine to the firestore
  Future createMedicine(Medicine medicine) async {
    final appRef = await medicineCollection.add({
      'daily': medicine.daily,
      'prescription' : medicine.prescription,
      'dateEnd' : medicine.dateEnd,
      'dateStart' : medicine.dateStart,
      'ownerID ' : patientId,
      'name' : medicine.name
    });
    return appRef.documentID;
  }

  ///
 //map it to an medicine object
  Medicine _medicineDataFromSnap(DocumentSnapshot snap) {
    Medicine medicine = new Medicine (
      daily : snap.data['daily'],
      prescription :snap.data['prescription'],
      dateStart : snap.data['dateStart'],
      dateEnd : snap.data['dateEnd'],
      ownerId : snap.data['ownerID'],
      name : snap.data['name'],
      documentId: snap.documentID,
    );
    return medicine ;
  }

  ///map a list of patient
  List<Medicine> _patientListFromSnap(QuerySnapshot snapshots) {
    return snapshots.documents.map(_medicineDataFromSnap).toList();
  }
  
}