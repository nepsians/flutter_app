class AppBaseError {
  final int code;
  final String description;
  final StackTrace? stack;

  AppBaseError({this.code = 1000, this.description = '', this.stack});
}
