class Dictionary {
  final String language;
  final Map<String, List<String>> easyCategory;
  final Map<String, List<String>> mediumCategory;
  final Map<String, List<String>> hardCategory;

  Dictionary({
    required this.language,
    required this.easyCategory,
    required this.mediumCategory,
    required this.hardCategory,
  });

  factory Dictionary.fromJson(Map<String, dynamic> json) {
    return Dictionary(
      language: json['language'],
      easyCategory: Map<String, List<String>>.from(json['easyCategory']),
      mediumCategory: Map<String, List<String>>.from(json['mediumCategory']),
      hardCategory: Map<String, List<String>>.from(json['hardCategory']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'easyCategory': easyCategory,
      'mediumCategory': mediumCategory,
      'hardCategory': hardCategory,
    };
  }
}
