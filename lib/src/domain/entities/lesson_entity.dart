import 'package:proffy/src/domain/entities/subject_entity.dart';
import 'package:proffy/src/domain/entities/teacher_entity.dart';

class LessonEntity {
  String _uid;
  SubjectEntity _subject;
  TeacherEntity _teacher;
  String _weekDay;
  double _price;

  LessonEntity({
    String uid,
    SubjectEntity subject,
    TeacherEntity teacher,
    String weekDay,
    double price,
  }) {
    this.uid = uid;
    this.subject = subject;
    this.teacher = teacher;
    this.weekDay = weekDay;
    this.price = price;
  }

  String get uid => this._uid;
  SubjectEntity get subject => this._subject;
  TeacherEntity get teacher => this._teacher;
  String get weekDay => this._weekDay;
  double get price => this._price;

  set uid(String uid) => this._uid = uid;
  set subject(SubjectEntity subject) => this._subject = subject;
  set teacher(TeacherEntity teacher) => this._teacher = teacher;
  set weekDay(String weekDay) => this._weekDay = weekDay;
  set price(double price) => this._price = price;
}
