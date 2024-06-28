class ApiEndPoints {
  static final String baseUrl = 'http://194.31.53.102/21090096';
  static final String apiKey =
      '763ca8a11759c50fff3071bdb81b3282e4bb3906425e04507f393caf48d116e518bb01e469e8ed4ecc3671368bb5b9cd5a2f99aaf830f8bb56d588cb306763a5';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'registration';
  final String loginEmail = 'login';
}
