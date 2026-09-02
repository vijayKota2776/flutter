void main() {
  Map<String, String> userProfiles = {
    'id': '101',
    'name': 'John Doe',
    'email': 'john@example.com',
    'role': 'Admin',
    'status': 'Active',
  };

  List<String> keysList = userProfiles.keys.toList();
  List<String> valuesList = userProfiles.values.toList();
  int totalEntries = userProfiles.length;

  print('Keys List: $keysList');
  print('Values List: $valuesList');
  print('Map Length: $totalEntries');
}
