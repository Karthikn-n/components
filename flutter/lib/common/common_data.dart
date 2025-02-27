String selectableText = '''
This aptly named method (and maybe too long) internally uses a Map to retrieve the closest instance 
of the given type up in the tree. If it’s found, the inherited widget object is returned and, in case of 
changes, the didChangeDependency override on the state is triggered. For example, consider this 
case:
''';

final imageUrl = [
  "https://static.vecteezy.com/system/resources/previews/006/831/700/large_2x/panorama-banner-background-of-tropical-forest-landscape-scene-for-using-in-concept-of-environmental-ecology-and-sustainable-energy-or-earth-day-wild-wood-scenic-using-for-wallpaper-of-spa-and-tourism-free-photo.jpg",
  "https://th.bing.com/th/id/R.5d12653da99c1280bc9acf414f9c05c4?rik=Z5O5TAkVYMItmw&riu=http%3a%2f%2fwww.pixelstalk.net%2fwp-content%2fuploads%2f2016%2f03%2fdesktop-nature-wallpaper-high-quality-wallpaper.jpg&ehk=JJ1M%2fFbiEdDbyU96WIyFYHla%2bDbI1cXri2mXXr56Uvg%3d&risl=&pid=ImgRaw&r=0",
  "https://th.bing.com/th/id/R.ae3d2f4880eaca12be7c84e2d2c56041?rik=KeMl0VTdSYUt2g&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2fb%2f1%2f9%2f355093.jpg&ehk=oGlwjQgO%2fFGGKmJsbxLKvu%2bk2XY18CIw6bAAeo6QVPw%3d&risl=&pid=ImgRaw&r=0",
  "https://wallup.net/wp-content/uploads/2017/03/28/436753-nature-landscape-trees-grass-sunset-HDR-clear_sky.jpg",
  "https://eskipaper.com/images/nature-27.jpg",
  "https://wallpapercave.com/wp/Ex9MlTC.jpg",
  "https://th.bing.com/th/id/R.25b9632aa4cb3761cf28612105f4c771?rik=kcbaoO6PXJxoUQ&riu=http%3a%2f%2fwww.pixelstalk.net%2fwp-content%2fuploads%2f2016%2f08%2fDesktop-Best-HD-Nature-Pictures.jpg&ehk=ljmGEJCDK%2bjiJF1cqpm2rwONW95e6%2fNYAg0akbvxHCU%3d&risl=&pid=ImgRaw&r=0",
  "https://www.pixelstalk.net/wp-content/uploads/2016/08/Nature-beautiful-desktop-images-cool.jpg",
  "https://th.bing.com/th/id/R.b95be29e4e73a35f204b1cd5b1e46f1a?rik=tFmv6fhESVfdoQ&riu=http%3a%2f%2fs1.picswalls.com%2fwallpapers%2f2017%2f12%2f11%2fnature-desktop-backgrounds_123026996_313.jpg&ehk=GnqPLogpbymTvYSqUfdK84qDd%2ff7IO6yl%2fgw5v6OIis%3d&risl=&pid=ImgRaw&r=0",
];