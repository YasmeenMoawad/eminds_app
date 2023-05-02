import 'package:eminds_app/data/models/book_details.dart';
import 'package:eminds_app/views/screens/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:eminds_app/data/models/books_api.dart';
import 'package:eminds_app/views/widgets/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eminds_app/data/repositories/navigate.dart';

class BooksScreen extends StatelessWidget implements INavigate{
   BooksScreen({Key? key}) : super(key: key);

  Color myHexColor = const Color(0xff06D6A0);

  @override
  Widget build(BuildContext context) {

    List<Book> books = BookFromWeb.bookList;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: myHexColor,
        title: Text("E-Minds Book Store",style: GoogleFonts.cairo(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        )),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5,),
          const SearchBar(),
          Container(height: MediaQuery.of(context).size.height*(3.6/5),
            color: Colors.black87,
            child: ListView.builder(itemBuilder: (BuildContext context, int index){
              final book = books[index];
              return SizedBox( height: 180,
                child: GestureDetector(
                  onTap: (){
                    var bookInfo = [book.title, book.categories,book.coverImg,book.longDesc,book.pageCount];
                    @override
                    route(){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => BookDetailsScreen(bookInfo)));
                    }
                    route();
                  },
                  child: Card(color: Colors.white24,
                    margin: const EdgeInsets.all(7),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CachedNetworkImage(
                            imageUrl: book.coverImg,
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                            placeholder: (context, url) => const SizedBox(height: 50,width: 50,
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15,),
                              Text("${book.title}",
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                maxLines: 1,
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),),
                              const SizedBox(height: 25,),
                              Text("Author: ",
                                style: GoogleFonts.robotoSlab(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),),
                              Text("   ${book.authors[0]}",
                                style: const TextStyle(fontSize: 20,color: Colors.white70),),
                              const SizedBox(height: 20,),
                              Text("${book.pageCount} Pages",
                                style: const TextStyle(fontSize: 15,color: Colors.white70),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }



  @override
  route() {
    // TODO: implement route
    throw UnimplementedError();
  }

}
