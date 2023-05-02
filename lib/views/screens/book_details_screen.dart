import 'package:eminds_app/views/screens/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookDetailsScreen extends StatelessWidget {
   BookDetailsScreen(this.book,{Key? key}) : super(key: key);

  final book;
   Color myHexColor = const Color(0xff06D6A0);

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myHexColor,
        title: Text("E-Minds Book Store",
          style: GoogleFonts.cairo(
          fontSize: 22,
          color: Colors.white,
        ),),
      ),
      backgroundColor: Colors.black87,
      body: ListView(
        children: [
          Column(
            children: [
              SimpleDialog(
                insetPadding: const EdgeInsets.all(20),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                children: [
                  CachedNetworkImage(
                    imageUrl: book[2],
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    placeholder: (context, url) => const SizedBox(height: 50,width: 50,
                        child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ],
              ),
              SizedBox( height: 50,
                child: Text("${book[0]}",
                  style: GoogleFonts.robotoSlab(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    void popMenu()async {
                      await showMenu(
                        color: Colors.black54,
                        context: context,
                        position: RelativeRect.fromLTRB(50, 20, 50, 20),
                        items: [
                          const PopupMenuItem(
                            child: Text("Summary: ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),),
                          ),
                          PopupMenuItem(
                            child: Text("     ${book[3]}",
                              style:const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),),),
                        ],
                        elevation: 8.0,
                      ).then((value) {
                        if (value != null) print(value);
                      });
                    }
                    popMenu();
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.height, 50)),
                    backgroundColor:
                    MaterialStateProperty.all(myHexColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: myHexColor)),
                    ),
                  ),
                  child: Text("Summary",style: GoogleFonts.cairo(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
