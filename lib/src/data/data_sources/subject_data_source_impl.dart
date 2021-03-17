import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proffy/src/data/data_sources/contracts/subject_data_source.dart';
import 'package:proffy/src/data/models/subject.dart';

class SubjectDataSourceImpl implements SubjectDataSource {
  final FirebaseFirestore _firestore;

  SubjectDataSourceImpl(this._firestore);

  @override
  Future<List<Subject>> getAll() async {
    final snapshot = await this._firestore.collection('subjects').get();
    return snapshot.docs.map((doc) => Subject.fromJson(doc.data())).toList();
  }
}
