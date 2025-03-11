import 'package:components/animation/animation_components_home.dart';
import 'package:components/common/texts.dart';
import 'package:components/components/bio-metric/authentication_home.dart';
import 'package:components/components/buttons/buttons_home.dart';
import 'package:components/components/dialogs/dialogs_home.dart';
import 'package:components/components/input-methods/input_fields.dart';
import 'package:components/components/maps/google_maps_component.dart';
import 'package:components/components/media/media_components_home.dart';
import 'package:components/components/navigation/navigation_home.dart';
import 'package:components/components/sync/offline_online_sync.dart';
import 'package:components/components/views/views_home.dart';
import 'package:components/flutter/change_dependencies.dart';
import 'package:components/permissions/permission_component_home.dart';
import 'package:components/provider/theme_provider.dart';
import 'package:components/stream/view/isolate_calling.dart';
import 'package:components/stream/view/listing_view.dart';
import 'package:components/websocket/websocket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final themeData = ThemeProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
        actions: [
          IconButton(
            onPressed: () {
              themeData?.toggleTheme!();
              print(themeData?.themeMode);
            },
            icon: Icon(themeData?.themeMode == ThemeMode.dark ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars),
          )
        ],
      ),
      body: 
      // StreamBuilder<bool>(
      //   stream: ConnectivityService.connectivityStream,
      //   builder: (context, snapshot) {
          // if(snapshot.connectionState == ConnectionState.waiting){
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if(snapshot.hasData && snapshot.data == true) {
            // return 
            Center(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "/cupertinoWidgets"), 
                      child: Text("Cupertino widgets")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ButtonsComponent(),)), 
                      child: Text("Button Components")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DialogsHome(),)), 
                      child: Text("Dialog Components")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InputTextFieldsComponents(),)), 
                      child: Text("Text Field Components")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewsHome(),)), 
                      child: Text("Views")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TextsComponents(),)), 
                      child: Text("Texts")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHome(),)), 
                      child: Text("Navigations")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MediaComponentsHome(),)), 
                      child: Text("File & Hardware Handling")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationHome(),)), 
                      child: Text("Authentication")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PermissionComponentHome(),)), 
                      child: Text("Permissions")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapsComponent(),)), 
                      child: Text("Maps")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OfflineOnlineSync(),)), 
                      child: Text("Offline/Online Sync")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AnimationComponentsHome(),)), 
                      child: Text("Animations")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "/svgPictures"), 
                      child: Text("Svg pictures")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "/backdrop"), 
                      child: Text("Filtered images")
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        bool canPop = await Navigator.maybePop(context);
                        if (!canPop) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("No screens to pop!")),
                          );
                        }
                      }, 
                      child: Text("Maybe Pop")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "/dragdrop"), 
                      child: Text("Draggable")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "/listeners"), 
                      child: Text("Listeners")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "/layout"), 
                      child: Text("Layout Builder")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, "/fitted"), 
                      child: Text("Fitted box")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenSizeExample(),)),
                      child: Text("didChangeDependencies()")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostAndComments(),)),
                      child: Text("Isolate calling")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CommentScreen(),)),
                      child: Text("Stream implementation")
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WebSocketExample(),)),
                      child: Text("Web socket")
                    ),
                    SizedBox(height: kToolbarHeight,)
                  ],
                ),
              ),
            )
          // } else {
          //   return Center(
          //     child: Text("❌ Offline", style: TextStyle(fontSize: 24, color: Colors.red))
          //   );
          // }
        
        // }
      // ),
    );
  }

  
}
