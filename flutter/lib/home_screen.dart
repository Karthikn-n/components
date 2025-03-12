import 'package:components/animation/animation_components_home.dart';
import 'package:components/common/texts.dart';
import 'package:components/components/bio-metric/authentication_home.dart';
import 'package:components/components/buttons/buttons_home.dart';
import 'package:components/components/dialogs/dialogs_home.dart';
import 'package:components/components/input-methods/input_fields.dart';
import 'package:components/components/maps/google_maps_component.dart';
import 'package:components/components/media/media_components_home.dart';
import 'package:components/components/navigation/navigation_home.dart';
import 'package:components/components/notifications/notification_component_home.dart';
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
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/cupertinoWidgets"), 
                      child: Text("Cupertino widgets", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ButtonsComponent(),)), 
                      child: Text("Button Components")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DialogsHome(),)), 
                      child: Text("Dialog Components")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InputTextFieldsComponents(),)), 
                      child: Text("Text Field Components")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewsHome(),)), 
                      child: Text("Views")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TextsComponents(),)), 
                      child: Text("Texts")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHome(),)), 
                      child: Text("Navigations")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MediaComponentsHome(),)), 
                      child: Text("Files & Media Handling")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationHome(),)), 
                      child: Text("Authentication")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PermissionComponentHome(),)), 
                      child: Text("Permissions")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapsComponent(),)), 
                      child: Text("Maps")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OfflineOnlineSync(),)), 
                      child: Text("Offline/Online Sync")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AnimationComponentsHome(),)), 
                      child: Text("Animations")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/svgPictures"), 
                      child: Text("Svg pictures")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/backdrop"), 
                      child: Text("Filtered images")
                    ),
                    FilledButton(
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
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/dragdrop"), 
                      child: Text("Draggable")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/listeners"), 
                      child: Text("Listeners")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/layout"), 
                      child: Text("Layout Builder")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pushNamed(context, "/fitted"), 
                      child: Text("Fitted box")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenSizeExample(),)),
                      child: Text("didChangeDependencies()")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostAndComments(),)),
                      child: Text("Isolate calling")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CommentScreen(),)),
                      child: Text("Stream implementation")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WebSocketExample(),)),
                      child: Text("Web socket")
                    ),
                    FilledButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationComponentHome(),)),
                      child: Text("Notifications")
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
