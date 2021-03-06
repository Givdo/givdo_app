# givdo_app


### The Givdo  Application Using the Flutter Framework

Before cloning the project, you should have your Flutter environment set up and working. The Flutter installation instructions on their website are excellent and very complete, and you should follow those to get the environment ready. You can find those instructions here: https://flutter.io/get-started/install/

When your setup is complete, clone the project into your development directory:

`git clone git@github.com:Givdo/givdo_app.git`.

(Or use http if you do not have SSH set up.)

If you want to use Android Studio, import the project by choosing "Import Project" from the welcome menu.

Navigate to the givdo_app directory you just cloned and select it for import. Click next.

Select "Create project from existing sources." Click next.

Accept the defaults for project name and location. Format should be ".idea (directory based)." Click next.

Android Studio should tell you it has found source files for the project in several directories. Accept all of them and click next.

The next stage should show you the libraries found. It should show the gradle-wrapper library on the left pane, and this should be checked. Click next.

Next is the module selection stage. The module called "Main" should be displayed on the left pane and selected. Click next.

Next select the project SDK. It should be Java 1.8. You need to have this installed and tell Android Studio where it is. Click next.

You will now be shown the frameworks detected by Android Studio for the project. It should show Android, with AndroidManifest.xml underneath in a heirarchy structure on the left pane. Make sure the checkboxes next to both of these are selected, and click finish.

The project should load, and you should get a notice prompting you to run 'flutter packages get.' Accept and run it. This will run the tool to get any necessary Flutter dependencies.

You may also get a warning that says the project does not use Gradle and recommends that you convert it to a Gradle project. Ignore this for now (we may change it later).

The project should now be set up and ready. You can now run it in the iOS Simulator (on Mac) or an Android emulator. To install an Android emulator image, go to Tools > AVD Manager and follow the prompts to simulate the device you want.

That's it! If you have any issues, please speak with the team.




