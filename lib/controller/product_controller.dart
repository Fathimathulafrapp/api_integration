import 'package:api_integration/sever/http_services.dart';
import 'package:get/get.dart';

class Productcontroller extends GetxController{
  var isloading =true.obs;
  var productList =[].obs;

@override
  void onInit(){
  fetchproducts();
  super.onInit();
}
void fetchproducts()async{
  try{
    isloading(true);
    var products=await Http_service.fetchproducts();
    if(products != null){
      productList.value=products;
    }
  }finally{
    isloading(false);
  }
}
}