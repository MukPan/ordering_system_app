import 'package:cash_register_app/main.dart';
import 'package:firebase_database/firebase_database.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

final ref = FirebaseDatabase.instance.ref();
final snapshot = await ref.child('users/$userId').get();
if (snapshot.exists) {
print(snapshot.value);
} else {
print('No data available.');
}