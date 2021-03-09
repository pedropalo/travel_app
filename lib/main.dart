import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class PopularCitie {
  String textoExplicativo;
  String urlImage;
  String quantity;
  String citie;
  String local;
  List<PopularCitieFriends> friends;

  PopularCitie({
    this.textoExplicativo,
    this.urlImage,
    this.quantity,
    this.citie,
    this.local,
    this.friends,
  });
}

class PopularCitieFriends {
  String urlImage;

  PopularCitieFriends({
    this.urlImage,
  });
}

class _MyHomePageState extends State<MyHomePage> {

  var pesquisa = TextEditingController()..text = "";
  var listPopularCities = List<PopularCitie>();

  _initListPopularCities() {
    listPopularCities.clear();
    listPopularCities.add(
      PopularCitie(
        citie: "New York", 
        local: "United States", 
        textoExplicativo: "luxemburgo", 
        urlImage: "https://images.unsplash.com/photo-1596494197990-5ff2bc6251a6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
        quantity: "1.5K",
        friends: [
          PopularCitieFriends(urlImage: "https://randomuser.me/api/portraits/women/88.jpg"),
          PopularCitieFriends(urlImage: "https://randomuser.me/api/portraits/women/41.jpg"),
          PopularCitieFriends(urlImage: "https://randomuser.me/api/portraits/men/24.jpg"),
        ]
      )
    );
    listPopularCities.add(PopularCitie(citie: "Prince Edward", local: "Hong Kong", textoExplicativo: "luxemburgo", urlImage: "https://images.unsplash.com/photo-1573529034968-658d31ceab2d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=700&q=80"));
    listPopularCities.add(PopularCitie(citie: "Paris", local: "France", textoExplicativo: "luxemburgo", urlImage: "https://images.unsplash.com/photo-1532701908539-968e2a55245e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"));
  }

  @override
  Widget build(BuildContext context) {
    _initListPopularCities();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  padding: EdgeInsets.all(16),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Explore Cities",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 26
                          )
                        ),

                        Icon(
                          Icons.menu_rounded,
                          size: 24,
                        )
                      ],
                    )
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(64)
                  ),
                  width: MediaQuery.of(context).size.width - 32,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: Colors.grey[400],
                        size: 20,
                      ),

                      Container(
                        width: 8
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width - (128),
                        child: 
                          TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: pesquisa,
                            onChanged: (value) {
                              setState(() {
                                
                              });
                            },
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                          )
                      ),

                      Spacer(),

                      pesquisa.text != "" && pesquisa.text != null ?
                        Icon(
                          Icons.close_rounded,
                          color: Colors.blue[600],
                          size: 20,
                        ) : 
                        Icon(
                          Icons.mic,
                          color: Colors.grey[400],
                          size: 20,
                        ) 
                    ],
                  )
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Cities",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.grey[400]
                          ),
                        ),
                      ],
                    )
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 330,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(listPopularCities.length, (index) {
                      var item = listPopularCities[index];

                      return 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[200],
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(item.urlImage ?? "")
                                )
                              ),
                              height: 260,
                              width: 160,
                              margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 160 - 80 - 16.0,
                                        height: 24,
                                        child: Stack(
                                          children: item.friends == null ? [] 
                                            : List.generate(item.friends.length, (index) => 
                                              Container(
                                                width: 24,
                                                height: 24,
                                                margin: EdgeInsets.only(left: index * 16.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius: BorderRadius.circular(18),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 1.4
                                                  ),
                                                  image: DecorationImage(
                                                    image: NetworkImage(item.friends[index].urlImage ?? "")
                                                  )
                                                ),
                                                // child: Text(index.toString()),
                                              )
                                            ) 
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.quantity ?? "0.0",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                            Text(
                                              "Active Friends",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 16, top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.citie ?? "",
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(
                                    item.local ?? "",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                    })
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending Places",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.grey[400]
                          ),
                        ),
                      ],
                    )
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(4, (index) {
                      // var item = list[index];

                      var image = "";

                      switch (index) {
                        case 0:
                          image = "https://images.unsplash.com/photo-1603647778476-0be85c875d37?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
                          break;
                        case 1:
                          image = "https://images.unsplash.com/photo-1568568740443-f846637a598f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=601&q=80";
                          break;
                        case 2:
                          image = "https://images.unsplash.com/photo-1557790790-f21da6560754?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80";
                          break;
                        case 3:
                          image = "https://images.unsplash.com/photo-1514189069169-f31100881e49?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80";
                          break;
                        default:
                      }

                      return
                        Container(
                          width: 120,
                          height: 80,
                          margin: EdgeInsets.only(left: index == 0 ? 16: 0, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(image)
                            )
                          ),
                        );
                    }),
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(16),
                  child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Travel with Friends",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.grey[400]
                          ),
                        ),
                      ],
                    )
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 64,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(8, (index) {
                      return
                        Container(
                          width: 64,
                          height: 64,
                          margin: EdgeInsets.only(left: index == 0 ? 16: 0, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(64),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("https://randomuser.me/api/portraits/women/$index.jpg")
                            )
                          ),
                        );
                    }),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}