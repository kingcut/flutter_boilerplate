T? parseJson<T>(String key, Map<String, dynamic>? json, {T? defaultValue}) {
  if (json == null) return defaultValue;
  try {
    return json.containsKey(key) && json[key] is T ? json[key] : defaultValue;
  } catch (e) {
    return defaultValue;
  }
}

int? parseJsonToInt(String key, Map<String, dynamic>? json) {
  if (json != null) {
    final value = parseJson(key, json);
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
  }
}

double? parseJsonToDouble(String key, Map<String, dynamic>? json) {
  if (json != null) {
    final value = parseJson(key, json);
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
  }
}

List<T> parseJsonToList<T>(
  String key,
  Map<String, dynamic>? json,
  T Function(Map<String, dynamic>) factoryFunction,
) {
  if (json == null) return <T>[];
  final list = parseJson<List>(key, json) ?? <T>[];
  return listFromJson(list, factoryFunction);
}

List<T> listFromJson<T>(
    List json, T Function(Map<String, dynamic>) factoryFunction) {
  final list = <T>[];
  for (var element in json) {
    if (element is Map<String, dynamic>) {
      final value = factoryFunction(element);
      list.add(value);
    }
  }
  return list;
}

/// Travel a nested Map object to get value
R? lookup<R>(Map map, Iterable keys) {
  dynamic current = map;

  for (final key in keys) {
    if (current is Map) {
      current = current[key];
    } else if (key is int && current is Iterable && current.length > key) {
      current = current.elementAt(key);
    } else {
      return null;
    }
  }

  try {
    if (current is! R) {
      switch (R) {
        case DateTime:
          current = DateTime.tryParse(current?.toString() ?? '')?.toLocal();
          break;
        case num:
          current = num.tryParse(current?.toString() ?? '');
          break;
        case String:
          current = current?.toString();
          break;
      }
    }

    return current as R;
  } catch (e) {
    return null;
  }

  // // return null as default
  // return null;
}
