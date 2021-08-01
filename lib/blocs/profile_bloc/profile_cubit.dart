import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/blocs/profile_bloc/profile_state.dart';
import 'package:vstore_appl/data/models/profile_model.dart';
import 'package:vstore_appl/settings/my_shared_preferences.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(ProfileState state) : super(state);

  Future<void> pullToken() async {
    String token = await MySharedPreferences().getSharedToken();

    if (token != null) {
      if (token == '')
        emit(ProfileLoadedState(token: token, model: ProfileModel()));
      else
        pullProfile(token);
    }
  }

  void pullProfile(String token) async {
    try {
      FirebaseFirestore.instance
          .collection('Person')
          .doc(token)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          var value = documentSnapshot.data();
          ProfileModel profileModel = ProfileModel(
              email: value['email'],
              fullName: value['fullName'],
              gender: value['gender'],
              phoneNumber: value['phoneNumber'],
              photeUrl: value['photeURL'],
              token: token,
              doYouHaveAStore: value['doYouHaveAStore']);

          emit(ProfileLoadedState(token: token, model: profileModel));
        }
      });
    } on FirebaseException catch (error) {
      emit(ProfileErrorState(error.message));
    }
  }
}
