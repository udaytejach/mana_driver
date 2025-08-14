import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mana_driver/models/loginState.dart';

import '../services/repository.dart';

class LoginViewModel extends ChangeNotifier {
  final RepositoryData _repository;
  Map<String, dynamic>? _loggedInUser;
  Map<String, dynamic>? get loggedInUser => _loggedInUser;
  LoginViewModel(this._repository);

  LoginState _state = LoginState();
  LoginState get state => _state;

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "India",
    e164Key: "",
  );

  void setCountry(Country country) {
    selectedCountry = country;
    notifyListeners();
  }

  Future<void> checkPhoneAndSendOtp({
    required String phoneNumber,
    required BuildContext context,
    required void Function(String verificationId) onCodeSent,
    required void Function(String error) onError,
  }) async {
    if (phoneNumber.isEmpty || phoneNumber.length < 10) {
      _state = _state.copyWith(
        errorMessage: "Please enter a valid phone number",
      );
      notifyListeners();
      return;
    }

    _state = _state.copyWith(isLoading: true, errorMessage: '');
    notifyListeners();

    final exists = await _repository.checkUserExists(phoneNumber);

    if (!exists) {
      _state = _state.copyWith(
        isLoading: false,
        isNumberValid: false,
        errorMessage: "User not found. Please register first.",
      );
      notifyListeners();
      return;
    }

    // User exists → send OTP
    final fullPhoneNumber = "+${selectedCountry.phoneCode}$phoneNumber";

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: fullPhoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        debugPrint("✅ verificationCompleted (auto-retrieved)");
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(" verificationFailed: ${e.code} - ${e.message}");
        _state = _state.copyWith(isLoading: false);
        notifyListeners();
        onError(e.message ?? "Verification failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        _state = _state.copyWith(isLoading: false, isNumberValid: true);
        notifyListeners();
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("⏱️ Auto-retrieval timed out");
      },
    );
  }

  Future<void> fetchLoggedInUser(String phoneNumber) async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .where('phone', isEqualTo: phoneNumber)
            .limit(1)
            .get();

    if (snapshot.docs.isNotEmpty) {
      final userData = snapshot.docs.first.data();
      _loggedInUser = userData;
      notifyListeners();
    }
  }

  void updateUser(Map<String, dynamic> newUserData) {
    _loggedInUser = newUserData;
    notifyListeners();
  }
}
