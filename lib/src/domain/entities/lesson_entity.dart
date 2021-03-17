import 'package:proffy/src/domain/entities/subject_entity.dart';
import 'package:proffy/src/domain/entities/teacher_entity.dart';

class LessonEntity {
  SubjectEntity _subject;
  TeacherEntity _teacher;
  double _price;

  LessonEntity({SubjectEntity subject, TeacherEntity teacher, double price}) {
    this.subject = subject;
    this.teacher = teacher;
    this.price = price;
  }

  SubjectEntity get subject => this._subject;
  TeacherEntity get teacher => this._teacher;
  double get price => this._price;

  set subject(SubjectEntity subject) => this._subject = subject;
  set teacher(TeacherEntity teacher) => this._teacher = teacher;
  set price(double price) => this._price = price;
}
