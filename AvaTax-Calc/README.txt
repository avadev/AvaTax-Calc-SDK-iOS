Avalara iOS SDK - ReadMe

To build a copy of the SDK to hand off to another developer:

1. Open the AvaTax-Calc Xcode project.
2. In Xcode’s toolbar, where you can select which scheme to build, selec “AvaTax-Calc-SDK.”  It will have an icon that looks like a white library building.  Choose “iOS Device”.
3. From the ‘Product’ menu, choose ‘Build.’
4. After it says “Build Succeeded,” go back to Finder where the AvaTax-Calc.xcodeproj file is.  Next to it will be a folder called “build.”
5. Inside the build folder will be a folder named either “Debug-iphoneos” or “Release-iphoneos” depending on which build configuration you’re using.  Add a copy of this README.txt file to it by dragging & dropping it while holding the “Option” key (so it copies rather than moves.)
6.  Right-click on that folder and choose ‘Compress’ to make a zip of it.  That zip will include the .a file, which is the binary library, an “include” folder with all necessary headers, and this ReadMe file.


To include the SDK in another Xcode project:

1. You should receive a zip file from Avalara.  Open it.
2. Create a new folder in your project’s repository titled “AvaTaxSDK”.
3. Copy the file ‘libAvaTax-Calc-SDK.a’ and the folder ‘include’ into that “AvaTaxSDK” folder.
4. Open your Xcode project and go to the Project Navigator.  (Normally it’s the column on the left.  You can make sure be selecting the menu item ‘View’ > ‘Navigators’ > ‘Show Project Navigator’.)  Scroll and find the group there labeled “Frameworks”.
5. Drag & drop that “AvaTaxSDK” folder into the “Frameworks” group in your Xcode Project.  Add it to the appropriate targets in your Xcode project, and click “Finish.”
6. Lastly, you’ll need to update your “Header Search Paths” build setting for the affected targets.  Add a header search path that points to the directory in the SDK with all the .h files in it.

