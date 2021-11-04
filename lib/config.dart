class Environments {
  static const String PRODUCTION = 'prod';
  static const String DEV = 'dev';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.DEV;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'url': 'anrsjt7yp9.execute-api.us-east-2.amazonaws.com/Beta',
    }
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }

  static String getUrl() {
    String resp = 'no environment selected';
    String? url = _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    )['url'];
    if (url != null) {
      resp = url;
    }
    return resp;
  }
}
