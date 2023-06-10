import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var data = {};
  bool isloading = false;

  @override
  Future getdetails() async {
    // try block

    try {
      setState(() {
        isloading = true;
      });
      // uri parse converts string to url
      var response = await http.get(
          Uri.parse('https://dummyjson.com/products'));
      // 200 means 0k report
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          isloading = false;
        });
        log("message: $data");
      }

      // it will give us a null error

      else {
        setState(() {
          isloading = false;
        });
      }

      // catch block
    } on Exception catch (e) {
      log("error:$data");
      setState(() {
        isloading = false;
      });
      // TODO
    }
    // print(response);
  }

  void initState() {
    // TODO: implement initState
    debugPrint("init");
    getdetails();
    super.initState();
  }

  @override
  //void didChangeDependencies() {
  // TODO: implement didChangeDependencies
  //debugPrint("did");
  //super.didChangeDependencies();
  //}
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : data.isEmpty
              ? const SizedBox()
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      Text(data['products'][index]['title'].toString()),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: data['products'].length),
    );
  }
}
