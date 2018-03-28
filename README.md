# camera-streams

## Why I started this app
I have been wanting to work on an AppleTV app since the device was announced, I just never had a project I could dedicate myself to without feeling like I was wasting my time on something that wouldn't get used.

I've recently grown tired of how many camera streaming apps limit the number of cameras I can view at a time and then prompting me to make a purchase to view more cameras.  So, I've decided to write my own.  This app will hopefully end up on the App Store for free with no feature limitations gated by In-App purchases.

## Building
The VLCKit SDK is enormous, with this being a free app, I'm not going to purchase more bandwidth for git-lfs.  That being said, to build this, you'll need the TVVLCKit.framework.  Directions for building it can be found [here](https://wiki.videolan.org/VLCKit/).  <s>At a later time, I will likely upload a version of this so that the app can be built with the same SDK version everywhere. </s>  The bundled version of TVVLCKit that I'm using can be found [here](https://external.lowther.com/adam/tvvlc.tgz)