import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/features/auth/infrastructure/DTO/user_DTO.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseUserMock extends Mock implements User {}

class DocumentMock extends Mock implements DocumentSnapshot {}

void main() {
  var firebaseUser;
  var userDoc;

  final uid = "XMCmdskafdPMSfasDS";
  final name = "John Doe";
  final email = "john.doe@gmail.com";
  final isVerified = false;
  final photoUrl = "www.google.com";

  // Reset mock objects before each test.
  setUp(() {
    firebaseUser = FirebaseUserMock();
    userDoc = DocumentMock();

    when(() => firebaseUser.uid).thenReturn(uid);
    when(() => firebaseUser.displayName).thenReturn(name);
    when(() => firebaseUser.email).thenReturn(email);
    when(() => firebaseUser.emailVerified).thenReturn(isVerified);
    when(() => firebaseUser.photoURL).thenReturn(photoUrl);
  });

  test("[fromFirebaseUser] should return 'UserDTO' without user data if no connection is found.", () async {
    final userDTO = UserDTO.fromFirebaseUser(firebaseUser);

    expect(uid, userDTO.uid);
    expect(name, userDTO.name);
    expect(email, userDTO.email);
    expect(isVerified, userDTO.isVerified);
    expect(true, userDTO.profilePictureUrl.isPresent);
    expect(photoUrl, userDTO.profilePictureUrl.value);
    expect({USER_ROLE}, userDTO.roles);
    expect(Set<String>(), userDTO.favoriteTechniques);
    expect(Set<String>(), userDTO.purchasedTechniques);
  });

  test("[fromFirebaseUser] should return 'UserDTO' with user data if connected to the internet.", () async {
    final roles = {USER_ROLE, ADMIN_ROLE};
    final favorites = {USER_ROLE, ADMIN_ROLE};
    final purchases = {"technique1", "technique2"};
    when(() => userDoc["roles"]).thenReturn(roles);
    when(() => userDoc["favoriteTechniques"]).thenReturn(favorites);
    when(() => userDoc["purchasedTechniques"]).thenReturn(purchases);

    final userDTO = UserDTO.fromFirebaseUser(firebaseUser, userDoc: userDoc);

    expect(uid, userDTO.uid);
    expect(name, userDTO.name);
    expect(email, userDTO.email);
    expect(isVerified, userDTO.isVerified);
    expect(true, userDTO.profilePictureUrl.isPresent);
    expect(photoUrl, userDTO.profilePictureUrl.value);
    expect(roles, userDTO.roles);
    expect(favorites, userDTO.favoriteTechniques);
    expect(purchases, userDTO.purchasedTechniques);
  });
}
