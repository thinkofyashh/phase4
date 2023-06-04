import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}
class _ProductListState extends State<ProductList> {
  @override
  Future getdetails() async{
    // Uri parse converts string in the url
    var response=await http.get(Uri.parse('https://dummyjson.com/products/category/smartphones'));
    print(response);
  }
  void initState() {
    // TODO: implement initState
    debugPrint("init");
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
    );
  }
}
