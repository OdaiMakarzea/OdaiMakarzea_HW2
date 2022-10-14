import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          appBar: AppBar(
            title: Text("List Student"),

          ),
          body: Display()

      ),

     /* routes: <String, WidgetBuilder>{
        '/c': (BuildContext context) => SecondPage(),
      },*/

    );
  }
}

class Display extends StatefulWidget{
  @override
  _ListDisplayState createState() {
    return _ListDisplayState();
  }

}

class _ListDisplayState extends State<Display>{

  List<Student> students = [
    Student("Basher",'18/1036', "anonymous.jpg", false),
    Student("qossay", '22/4540',"anonymous.jpg", false),
    Student("mohammad Hroub", '20/1303', "anonymous.jpg", false),
    Student("mohanad", '20/7515',"anonymous.jpg", false),

  ];

  List<Student> favoriteStd = [];

  void _setMovieAsFavorite(int index){
    setState(() {
      this.students[index].isFavorite = !this.students[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (BuildContext context, int index) {
        return  FirstPage(
          std: this.students[index],
          setFavorite: () {
            _setMovieAsFavorite(index);
          },
        );

      },
    );

  }
}

class Student{
  String name;
  String id;
  String image;
  bool isFavorite;

  Student(this.name, this.id, this.image, this.isFavorite);
}

class FirstPage extends StatelessWidget {

  final Student std;

  final VoidCallback setFavorite;

  FirstPage(
      {required this.std,required this.setFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(4),
      height: 110,
      child: Card(
        child: Row(
          children: [
            Image.asset('assets/images/' + this.std.image),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.std.name, style: TextStyle(fontSize: 15),),
                      Text(this.std.id, style: TextStyle(fontSize: 15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(
                                this.std.isFavorite ? Icons.star : Icons
                                    .star_border,
                              ),
                              onPressed: setFavorite),

                        ],
                      )

                    ],
                  ),
                )
            ),
            TextButton(
                child: Text('Press to next page'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(std)));
                }),
          ],
        ),

      ),

    );


  }
}
class SecondPage extends StatelessWidget {
  final Student st;
  SecondPage(@required this.st);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: MaterialButton(
              child: Text('Back'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),),

            body: Center(
              child: Row(
                children: [
                  if (st.isFavorite) Text(st.name) else const Text('None'),
                ],
              ),

            )

        )
    );

  }

}