class University {
  final String name;
  final String country;
  final String webpage;

  University(
      {required this.name, required this.country, required this.webpage});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      country: json['country'],
      webpage: json['web_pages'][0],
    );
  }
}
