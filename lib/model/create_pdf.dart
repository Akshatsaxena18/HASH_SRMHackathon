import 'dart:io';

import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'pdf_format.dart';
import 'package:path_provider/path_provider.dart';

void generatePDF(PDFTitle title,Id id,Details details,images,Predictions pred)async{
  try{
  var pdf = new Document();
  //first page
  pdf.addPage(
    MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin:EdgeInsets.all(10),
      maxPages: 1,
      build: (context){
      return[
        Report.buildTitle(title),
        Container(width: 100),
        Report.buildID(title, id),
        Container(height: 100),
        Report.buildDetails(details),
        Container(height: 100),
        Report.buildPredictions(pred)
      ];
    })
  );

  for(int i=0;i<images.length;i++)
  {
    pdf.addPage(
      MultiPage(
        pageFormat: PdfPageFormat(PdfPageFormat.a4.width.toDouble()+20, PdfPageFormat.a4.height.toDouble()+120),
        // maxPages: 1,
        build: (c){
          var im = MemoryImage(images[i]);
          return [
             Wrap(
                children: [
                 Container(
                    height: PdfPageFormat.a4.height,
                    width: PdfPageFormat.a4.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:im,
                        fit: BoxFit.contain,
                      ),
                      // shape: BoxShape.circle,
                    ),
                  ) 
                ]
              )
            ];
        }
      ),
    );
  }
  var filePath = await getExternalStorageDirectory();
await File(filePath!.path+"/Report_${id.id.toString()}.pdf").create(recursive: true).then((file)async {
        await file.writeAsBytes(await pdf.save());
        print("saved");
      });
  }catch(e){
    print(e.toString());
  }
}