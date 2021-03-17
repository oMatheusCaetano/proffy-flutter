class SubjectEntity {
  String _title;

  SubjectEntity({String title}) {
    this.title = title;
  }

  String get title => this._title;

  set title(String title) => this._title = title;
}
