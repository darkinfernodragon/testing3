import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter_1/screen/search.dart';
import 'dart:convert';
import 'model/post.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

Future<List<Post>> fetchPosts() async{
  List<Post> list = [];
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var posts = jsonDecode(response.body);
  for (var a in posts) {
    Post post = Post.fromJson(a);
    list.add(post);
  }
  print(list.length);
  print(list[1].title);
  return list;
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future <List<Post>>? futurePosts;

  Widget _loadingIndicator(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      futurePosts = fetchPosts();
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
         title: Text('Hello World'),
         backgroundColor: Colors.purple,
         actions: [
          //  InkWell(
          //    borderRadius: BorderRadius.all(Radius.circular(100)),
          //    child: Icon(Icons.search),
          //    onTap: () {
          //      Navigator.push(
          //        context,
          //        MaterialPageRoute(builder: (context) => SearchScreen())
          //       );
          //    },
          //  ),
          //  SizedBox(width: 10,),
          //  InkWell(
          //    child: Icon(Icons.notifications),
          //  ),
          //  SizedBox(width: 10,)
         ],
       ),
       body: SingleChildScrollView(
         child: Column(
            children: [
              Container(
                height: size.height / 2 / 2,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.purple
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Hello World', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
                )
              ),
              SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: 'Mau ',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Sans', fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Ngapain ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple)),
                    TextSpan(text: 'Hari Ini?')
                  ]
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.shop, color: Colors.white),
                            Text('Belanja', style: TextStyle(color: Colors.white))
                          ]
                        ),
                      ),
                      onTap: () {
                        //Shop screen
                      },
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.book, color: Colors.white),
                            Text('Membaca', style: TextStyle(color: Colors.white))
                          ]
                        ),
                      ),
                      onTap: () {
                        //Membaca
                      },
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.tv, color: Colors.white),
                            Text('Nonton', style: TextStyle(color: Colors.white))
                          ]
                        ),
                      ),
                      onTap: () {
                        //Nonton
                      },
                    )
                  ],
                )
              ),
              SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: 'Baca ',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Sans', fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Postingan ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple)),
                    TextSpan(text: 'Menarik!')
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: FutureBuilder<List<Post>>(
                  future: futurePosts,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              shadowColor: Colors.grey,
                              child: InkWell(
                                child: ListTile(
                                  title: Text(snapshot.data![index].title),
                                  leading: Icon(Icons.announcement),
                                  trailing: Icon(Icons.arrow_right_sharp),
                                ),
                                onTap: () {
                                  print(snapshot.data![index].title);
                                },
                              )
                            );
                          }
                        ),
                      );
                    }
                    return _loadingIndicator();
                  },
                ),
              ),
              InkWell(
                child: Text(
                  'Muat Lebih Banyak Postingan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),
                ),
              ),
              SizedBox(height: 50)
            ],
          )
       ),
       bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(
             icon: Icon(Icons.home),
             label: 'Beranda'
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.verified_user),
             label: 'Profil'
           )
         ],
       ),
       endDrawer: Drawer(
         child: ListView(
           children: [
             DrawerHeader(
               decoration: BoxDecoration(
                color: Colors.purple
               ),
               child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 30))
             ),
             ListTile(
               title: Text('Pembayaran', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             Divider(thickness: 1,color: Colors.black,indent:10,endIndent: 10,),
             ListTile(
               title: Text('Pengaturan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             Divider(thickness: 1,color: Colors.black,indent:10,endIndent: 10,),
             ListTile(
               title: Text('Pengaturan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
             ListTile(
               title: Text('Histori', style: TextStyle(fontSize: 15)),
             ),
           ],
         )
       ),
    );
  }
}