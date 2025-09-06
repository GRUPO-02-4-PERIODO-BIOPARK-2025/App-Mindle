import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> entrarUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          return 'Senha Incorreta';
      }
      return e.code;
    }
    return null;
  }

  Future<String?> cadastrarUsuario({
  required String email,
  required String senha,
  required String nome,
  required String idade,
  required String estudaTrabalha,
  required String tipoUsuario,
  required String qualidadeSono,
  required String moraSozinho,
  required String hobbies,
}) async {
  try {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: senha);

    await userCredential.user?.updateDisplayName(nome);

    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(userCredential.user!.uid)
        .set({
          'uid': userCredential.user!.uid,
          'nome': nome,
          'email': email,
          'idade': idade,
          'estudaTrabalha': estudaTrabalha,
          'tipoUsuario': tipoUsuario,
          'qualidadeSono': qualidadeSono,
          'moraSozinho': moraSozinho,
          'hobbies': hobbies,
          'dataCadastro': FieldValue.serverTimestamp(),
        });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      return 'Email já existe';
    }
    return e.code;
  } catch (e) {
    return 'Erro inesperado: $e';
  }
  return null;
}

  Future<String?> redefinicaoSenha({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Usuario nao encontrado';
      }
      return e.code;
    }
    return null;
  }

  Future<String?> deslogar() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }

  Future<String?> excluirConta({required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: _firebaseAuth.currentUser!.email!,
        password: senha,
      );
      await _firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }
}
