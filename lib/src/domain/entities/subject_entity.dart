class SubjectEntity {
  String _uid;
  String _title;

  SubjectEntity({String uid, String title}) {
    this.uid = uid;
    this.title = title;
  }

  String get uid => this._uid;
  String get title => this._title;

  set uid(String uid) => this._uid = uid;
  set title(String title) => this._title = title;
}
