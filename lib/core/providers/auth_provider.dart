import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _user != null;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<bool> signInWithEmail(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? "Authentication error (${e.code})";
      debugPrint("FirebaseAuthException: ${e.code} - ${e.message}");
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = "Unexpected error: ${e.toString()}";
      debugPrint("Unexpected Auth Error: $e");
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> registerWithEmail(
    String email,
    String password,
    String name,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Update display name
      await result.user?.updateDisplayName(name);
      _isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? "Authentication error (${e.code})";
      debugPrint("FirebaseAuthException: ${e.code} - ${e.message}");
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = "Unexpected error: ${e.toString()}";
      debugPrint("Unexpected Auth Error: $e");
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
