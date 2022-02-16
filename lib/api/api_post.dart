import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:prueba_app/modelo/mod_post.dart';

class PostApi {
  Future<List<Post>> consultaApi() async {
    var respuesta =
        await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));

    Iterable objeto = convert.json.decode(respuesta.body)["results"];

    if (respuesta.statusCode == 200) {
      return objeto.map((PostRecibido) => Post.fromJson(PostRecibido)).toList();
    } else {
      throw Exception("No se logro cargar el api");
    }
  }
}
