import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_app/constantes.dart';
import 'package:prueba_app/modelo/mod_post.dart';
import 'package:prueba_app/provider/post_provider.dart';
import 'package:prueba_app/ui/detalle.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    var postProvider = Provider.of<PostProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("alfred"),
          backgroundColor: primaryColor,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(3.0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: postProvider.retornaDatos(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Expanded(
                      child: ListView.builder(
                          itemCount: postProvider.listaPost.length,
                          itemBuilder: (context, index) {
                            Post post = postProvider.listaPost[index];

                            return Card(
                              elevation: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              margin: const EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.orange,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 20),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        Image.network(post.image,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.fill),
                                        const SizedBox(width: 20),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(post.name,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0)),
                                              Text(post.status,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0)),
                                              Text(post.species,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0)),
                                            ]),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        TextButton(
                                          child: const Text('DETALLE'),
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Colors.yellowAccent,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetallePage(post: post),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  })
            ],
          ),
        ));
  }
}
