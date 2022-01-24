//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:taxi/helpers/constants.dart';
import 'package:taxi/models/driver_m.dart';

class DriverService {
  String collection = 'drivers';

  //Stream<List<DriverModel>> return value of next fun
  getDrivers() {
    //return firebaseFiretore.collection(collection).snapshots().map((event) =>
      //  event.documents.map((e) => DriverModel.fromSnapshot(e)).toList());

  }

  //Future<DriverModel> return val of next fun
getDriverById(String id) {
    //firebaseFiretore.collection(collection).document(id).get().then((doc) {
    //return DriverModel.fromSnapshot(doc);
    // });
  }
  /*Stream<QuerySnapshot> driverStream() {
    CollectionReference reference = Firestore.instance.collection(collection);
    return reference.snapshots();
  }*/
}
