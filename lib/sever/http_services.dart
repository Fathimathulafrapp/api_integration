
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class Http_service{
  static Future<List<product>>fetchproducts() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200){
      var data=response.body;
      return productFromJson(data);
    }else{
      var data =response.body;
      return productFromJson(data);
    }


  }

}