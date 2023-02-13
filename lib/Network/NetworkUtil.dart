import 'package:http/http.dart' as http;

class NetworkUtil{

  Future<dynamic> getImage() async{
    Uri url=Uri.parse('https://dog.ceo/api/breeds/image/random');

    var res=await http.get(url);

    if(res.statusCode==200){
      return res;
    }else{
      return null;
    }

  }


}