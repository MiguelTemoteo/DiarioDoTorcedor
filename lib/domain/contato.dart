class Contato {
  final String title;
  final String description;
  final String logoUrl;

  Contato({
    required this.title,
    required this.description,
    required this.logoUrl,
  });

  factory Contato.fromJson(Map<String, dynamic> json) {
    return Contato(
      title: json['title'] as String,
      description: json['description'] as String,
      logoUrl: json['logoUrl'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'logoUrl': logoUrl,
    };
  }
}
