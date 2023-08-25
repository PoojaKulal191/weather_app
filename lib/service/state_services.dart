class StateService {
  static final List<String> states = [
    'Mangalore',
    'Udupi',
    'Hubballi',
    'Bangalore',
    'Dharwad',
    'Gulbarga',
    'Bidar',
    'London',
    'Australia',
    'Tamilnadu',

  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}