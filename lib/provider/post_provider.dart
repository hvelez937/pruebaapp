import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:prueba_app/api/api_post.dart';
import 'package:prueba_app/modelo/mod_post.dart';

class PostProvider extends ChangeNotifier {
  late String mensaje;
  var listaPost = [];

  void init() async {
    if (listaPost.isEmpty) {
      cargarlista();
    }
    notifyListeners();
  }

  insert(Post post) {
    listaPost.add(post);
    notifyListeners();
  }

  Future retornaDatos() async {
    if (listaPost.isNotEmpty) {
      return listaPost;
    }
  }

  cargarlista() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    //Se valida conexion a internet
    if (connectivityResult != ConnectivityResult.none) {
      mensaje = "Enviando datos";
      notifyListeners();
      //Se llama el api
      PostApi().consultaApi().then((lista) {
        lista.forEach((post) => insert(post));
        mensaje = "Se realizo la sincronizacion correctamente!";
        notifyListeners();
      }).catchError((e) {
        mensaje = "No se lograron enviar los datos de la api";
        notifyListeners();
      });
    }
  }
}
