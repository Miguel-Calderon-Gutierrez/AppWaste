import 'package:appwasteio/domain/entities/message.dart';

class Model {
  String label;
  double score;

double redondearNum(double numero) {
  return (numero * 100).truncateToDouble() / 100;
}


  Model({
    required this.label,
    required this.score,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        label: json["label"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "score": score,
      };

  Message toMessageEntity() => Message(
      text:
          "La imagen muestra residuos de tipo: ${label == 'O' ? 'Organico' : 'Inorganico'}, con una confianza del ${redondearNum(score*100)}%",
      imageUrl:
          "https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg",
      fromWho: FromWho.hers);
}
