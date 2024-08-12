extension MapExtension on Map<String, dynamic> {
  String get toQueryParams {
    return Uri(queryParameters: this).query;
  }

  Map<String, dynamic> get removeNullValues {
    final Map<String, dynamic> filteredMap = Map<String, dynamic>.from(this);

    filteredMap.removeWhere((String key, dynamic value) => value == null);

    return filteredMap;
  }
}
