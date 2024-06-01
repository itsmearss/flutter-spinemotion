class ApiEndPoints {
  static final String baseUrl = 'http://127.0.0.1:5000/user/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'registration';
  final String loginEmail = 'login';

}