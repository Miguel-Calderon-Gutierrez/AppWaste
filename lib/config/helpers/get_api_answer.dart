import 'package:appwasteio/domain/entities/message.dart';
import 'package:appwasteio/infrastructure/models/api_model.dart';
import 'package:dio/dio.dart';

class GetApiAnswer {
  final _dio = Dio();
  final _baseApi = "http://152.204.255.236:8001";

  Future<Message> getAnswer() async {
    final response = await _dio.get('$_baseApi/getDataPrueba');

    final model = Model.fromJson(response.data);

    return model.toMessageEntity();
  }

  Future<Message> getAnswerClasification(image) async {

      String fileName = image!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image!.path, filename: fileName),
      });

      // Realiza la solicitud POST utilizando Dio
      Response response = await _dio.post(
        '$_baseApi/clasificarImagen',
        data: formData,
      );

      final model = Model.fromJson(response.data);   

    return model.toMessageEntity();
  }
}
