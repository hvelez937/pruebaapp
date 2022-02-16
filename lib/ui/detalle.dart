import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_app/constantes.dart';

import 'package:prueba_app/modelo/mod_post.dart';
import 'package:prueba_app/provider/post_provider.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  @override
  Widget build(BuildContext context) {
    var postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
        appBar:
            AppBar(backgroundColor: primaryColor, title: const Text("alfred")),
        body: Container(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(3.0),
              color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    ' DETALLE',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Image.network(widget.post.image,
                      height: 300, width: 300, fit: BoxFit.fill),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    widget.post.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.post.gender,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    ' ORIGIN',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  Text(
                    widget.post.origin!.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    ' LOCATIONS',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  Text(
                    widget.post.location!.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )));
  }
}
