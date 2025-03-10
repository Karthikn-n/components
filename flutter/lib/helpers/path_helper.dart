import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PathHelper {

  static void printAllThePaths() async {
     print("Cache directory ${await getApplicationCacheDirectory()}"); 
        // /data/user/0/com.example.components/cache -> Output this will the path of mobile folder structure 

    print("Documents ${await getApplicationDocumentsDirectory()}");
    // /data/user/0/com.example.components/app_flutter -> Output this will the path of mobile folder structure 
    
    print("Support ${await getApplicationSupportDirectory()}"); 
    // /data/user/0/com.example.components/files -> Output this will the path of mobile folder structure 
    
    print("Database path ${await getDatabasesPath()}"); 
    // /data/user/0/com.example.components/databases -> Output this will the path of mobile folder structure 
    
    print("Downloads ${await getDownloadsDirectory()}"); 
    // /storage/emulated/0/Android/data/com.example.components/files/downloads -> Output this will the path of mobile folder structure 
    
    print("Exernal cache ${await getExternalCacheDirectories()}"); 
    //  [Directory: '/storage/emulated/0/Android/data/com.example.components/cache'] -> Output this will the path of mobile folder structure 
    
    print("Exernal directories ${await getExternalStorageDirectories()}"); 
    // [Directory: '/storage/emulated/0/Android/data/com.example.components/files'] -> Output this will the path of mobile folder structure 
    
    print("Exernal ${await getExternalStorageDirectory()}");
    // /storage/emulated/0/Android/data/com.example.components/files -> Output this will the path of mobile folder structure 
    
    print("Temporary ${await getTemporaryDirectory()}");
    // /data/user/0/com.example.components/cache -> Output this will the path of mobile folder structure 
  }
}