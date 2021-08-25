import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Models/user_model.dart';

class MyDatabase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createUser(UserModel userModel) async {
    try {
      await _firestore.collection('myUsers').doc(userModel.id).set({
        'name': userModel.name,
        'email': userModel.email,
        'phoneNo': userModel.phoneNo,
        'password': userModel.password,
        'id': userModel.id,
      });
      return true;
    } catch (e) {
      Get.snackbar('Error', e.message.toString());
      return false;
    }
  }
  Future<UserModel> getUser(String uid)async{
   try{
     DocumentSnapshot doc=await _firestore.collection('myUsers').doc(uid).get();
     return UserModel.fromDucumentSnapshot(doc);
   }catch(e){
     print(e);
     rethrow;
   }




  }
}
