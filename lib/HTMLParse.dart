import 'package:blac1/HTMLTable.dart';

class HTMLParse {
  static String rawHTML;

  static HTMLTable findTableWithHeaders(List<String> ids) {

    HTMLTable myTable = new HTMLTable();
    print("first table at: " + rawHTML.indexOf("<table").toString());
    //List<Match> tableMatches = rawHTML.allMatches("<table",5).toList();

   // print("num of tables: " + tableMatches.length.toString());
    print("finding matches...");
    while(rawHTML.indexOf("<table")!=-1) {
      print("here's a table match");

      rawHTML = rawHTML.substring(rawHTML.indexOf("<table")+1);
      String table = rawHTML;
      table = table.substring(0, table.indexOf("</table>"));


      String header = table.substring(table.indexOf("<thead"));
      header = header.substring(0, header.indexOf("</thead>"));
      print("here's the header");
      
      
     

      
      for (int i = 0; i<ids.length; i++) {

        String th = header.substring(header.indexOf("<th "));
        th = th.substring(0, th.indexOf("</th>")+5);
        if (th.indexOf("id=" +"\"" + ids[i] + "\"") == -1) {
          break;
        }

        print("found header id " + ids[i]);

        String headerValue = th.substring(th.indexOf(">")+1);
        headerValue = headerValue.substring(0, headerValue.indexOf("<"));
        print("header value num " + i.toString() + " is " + headerValue);
        myTable.columns.add(new MyColumn());
        myTable.columns[i].name = headerValue;

        if(header.indexOf("<th ")==-1)  {
          break;
        }
        header = header.substring(header.indexOf("<th ") + 1);

      }

      print("header values done!");

      while(table.indexOf("<tr ")!=-1)  {

        String row = table.substring(table.indexOf("<tr "));
        print(row.indexOf("</tr"));
        row = row.substring(0, row.indexOf("</tr")+5);

        for(int i=0; i<ids.length; i++) {
          String cell = row.substring(row.indexOf("headers=" + "\"" + ids[i] + "\""));
          cell =cell.substring(0,cell.indexOf("</td>")+5);

          String value="";
          while(cell.indexOf("<span")!=-1) {

            cell = cell.substring(0, cell.indexOf("<span")+1);
            value += cell.substring(cell.indexOf(">")+1);
            value = value.substring(0, value.indexOf("<"));
          }

          print(value);
          myTable.columns[i].values.add(value);
          row = row.substring(1, row.length);

        }

      }


    }




    }
    
  }
