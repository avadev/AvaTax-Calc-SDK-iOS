Avalara iOS SDK - ReadMe

To build a copy of the SDK to hand off to another developer:

1. Open the AvaTax-Calc Xcode project.
2. In Xcode’s toolbar, where you can select which scheme to build, select “AvaTaxCalc-UniveralLib.”  It will have an icon that looks like an archery target.  It doesn’t matter if you choose iOS Device or iOS Simulator here, it will be built for both.
3. From the ‘Product’ menu, choose ‘Build.’
4. After it says “Build Succeeded,” go back to Finder where the AvaTax-Calc.xcodeproj file is.  Next to it will be a folder called “build.”
5. Inside the build folder will be a zip file titled “AvaTaxSDK-iOS.zip” which is ready to  go, and it’s the only thing you need to send to other developers.



To include the SDK in your own Xcode project:

1. You should receive a zip file from Avalara named “AvaTaxSDK-iOS.zip”  Open it.
2. Move the folder “AvaTaxSDK” (which the zip expands into) in to your project’s repository.
3. Open your Xcode project and go to the Project Navigator.  (Normally it’s the column on the left.  You can make sure be selecting the menu item ‘View’ > ‘Navigators’ > ‘Show Project Navigator’.)  Scroll and find the group there labeled “Frameworks”.
4. Drag & drop that “AvaTaxSDK” folder into the “Frameworks” group in your Xcode Project.  Add it to the appropriate targets in your Xcode project, and click “Finish.”
5. Lastly, you’ll need to update your “Header Search Paths” build setting for the affected targets.  Add a header search path that points to the directory in the SDK with all the .h files in it.  The exact text you want to add is probably this relative path: “AvaTaxSDK/include/AvaTax-Calc-SDK”

If you’d like more detail on adding the Avalara SDK static library to your project, this web page has an excellent write up: http://www.raywenderlich.com/41377/creating-a-static-library-in-ios-tutorial, scroll half way down and start from the header “Using a Static Library in Your App”

In your project’s code, add #import “AvaTaxCalc.h”, and then alloc & init an instance of the class AvaTaxCalc, passing it your Avalara AdminConsole username & password on init. Using an instance (or multiple instances) of AvaTaxCalc is how you access all the API functionality provided by the SDK.


Please visit http://developer.avalara.com/ for documentation on the details of the API calls available.
