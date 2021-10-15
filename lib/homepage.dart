import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List products=[];

  Future<bool> getProducts()async{
    String serviceUrl = 'https://api.sakkhar.com/api/product';
    var response = await http.get(Uri.parse(serviceUrl));
    setState(() {
      products = json.decode(response.body.toString());
    });
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: ListView.builder(

          itemBuilder: (BuildContext context, int index){
            //Text(products[index]['product_brand'])
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.blueGrey,
              elevation: 10,
              child: Container(
                padding: new EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      // child: Image(
                      //   image: NetworkImage(
                      //       products[index]['product_img']
                      //   ),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  'Name: ${products[index]['product_name']}',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                    'Brand: ${products[index]['product_brand']}'
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                    'Quantity: ${products[index]['quantity']}'
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child:
                                Text(
                                    'Created: ${products[index]['created_at']}'
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                    'Modified: ${products[index]['updated_at']}'
                                ),
                              )
                            ],
                          ),
                        ))
                  ],

                ),
              ),
            );
          },
          itemCount: products.length==null ? 0: products.length,
      ),
    );
  }
}
