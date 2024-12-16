class PacoteFutebol {
  late int id;
  late String urlImage;
  late String titulo;
  late String descricao;
  late String detalhesExtras;

  PacoteFutebol({
    required this.titulo,
    required this.urlImage,
    required this.descricao,
    required this.detalhesExtras, 
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'url_imagem': urlImage,
      'descricao': descricao,
      'detalhes': detalhesExtras,
    };
  }

  factory PacoteFutebol.fromJson(Map<String, dynamic> json) {
    return PacoteFutebol(
      urlImage: json['url_imagem'] as String,
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      detalhesExtras: json['detalhes'] as String,
    );
  }


}
