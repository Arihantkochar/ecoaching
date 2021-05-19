import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class pdfview extends StatefulWidget {
  String url;
  String title;

  pdfview(this.url,this.title);

  @override
  _pdfviewState createState() => _pdfviewState();
}

class _pdfviewState extends State<pdfview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Container(
        child: SfPdfViewer.network(widget.url+".pdf"),
      ),
    );
  }
}
