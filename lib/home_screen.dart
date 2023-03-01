import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'model/dummy_model.dart';
import 'model/person_model_data.dart';
import 'model/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModal> postList = [];
  List<PersonDetail> personDetail = [];

  DummyData? dummy;

  @override
  void initState() {
    super.initState();
    getPostApi();
    getDummyApi();
    getPersonApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // ListView.separated(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: postList.length,
          //   separatorBuilder: (context, index) => const SizedBox(height: 15),
          //   itemBuilder: (context, index) => ListTile(
          //     tileColor: Colors.green,
          //     title: Text(postList[index].userId!.toString()),
          //     subtitle: Text(postList[index].body!),
          //   ),
          // ),

          // ListView.separated(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: personDetail.length,
          //   separatorBuilder: (context, index) => const SizedBox(height: 15),
          //   itemBuilder: (context, index) => Container(
          //     color: Colors.yellow,
          //     child: Column(
          //       children: [
          //         Text("Id :${personDetail[index].id}"),
          //         Text("name :${personDetail[index].name}"),
          //         Text("postId :${personDetail[index].postId}"),
          //         Text("email :${personDetail[index].email}"),
          //         Text("body :${personDetail[index].body}"),
          //       ],
          //     ),
          //   ),
          // ),

          dummy == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dummy!.results!.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) => Container(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Text("count:${dummy!.info!.count}"),
                        Text("pages:${dummy!.info!.pages}"),
                        Text("prev:${dummy!.info!.prev}"),
                        Text("next:${dummy!.info!.next}"),
                        Text("Id:${dummy!.results![index].id}"),
                        Text("name:${dummy!.results![index].name}"),
                        Text("gender:${dummy!.results![index].gender}"),
                        Text("species:${dummy!.results![index].species}"),
                        Text("origin:${dummy!.results![index].origin!.name}"),
                        Text(
                            "location:${dummy!.results![index].location!.name}"),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  getPostApi() async {
    Client client = http.Client();
    try {
      Response response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        postList = (jsonDecode(response.body) as List?)!
            .map((dynamic e) => PostsModal.fromJson(e))
            .toList();
        // debugPrint("Status Code -------------->>> ${response.body}");

        // PostsModal postsModal = PostsModal.fromJson(jsonDecode(response.body));  //Map

        setState(() {});
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }

  getPersonApi() async {
    Client client = http.Client();
    try {
      Response response = await client.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));
      if (response.statusCode == 200) {
        personDetail = (jsonDecode(response.body) as List?)!
            .map((dynamic e) => PersonDetail.fromJson(e))
            .toList();

        // debugPrint("Status Code -------------->>> ${response.statusCode}");

        // debugPrint("Status Code -------------->>> ${response.body}");

        // PostsModal postsModal = PostsModal.fromJson(jsonDecode(response.body));  //Map

        setState(() {});
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }

  getDummyApi() async {
    Client client = http.Client();
    try {
      Response response = await client
          .get(Uri.parse("https://rickandmortyapi.com/api/character"));
      if (response.statusCode == 200) {
        dummy = DummyData.fromJson(jsonDecode(response.body)); //Map
        debugPrint("Status Code -------------->>> ${response.statusCode}");

        debugPrint("Status Codeeeeee -------------->>> ${response.body}");

        setState(() {});
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }
}
