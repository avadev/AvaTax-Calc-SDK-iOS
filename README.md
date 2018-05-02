## THIS SDK IS NO LONGER BEING MAINTAINTED

Avalara iOS SDK - ReadMe


To include the SDK in your own Xcode project when you have access to the SDK’s github repo:

1. Create your Xcode project.
2. In the root directory of your Xcode project, run ‘git clone https://github.com/avadev/AvaTax-Calc-SDK-iOS.git'.  That will create the folder “AvaTax-Calc-SDK-iOS” as a sub-directory of your project.
3. Open your Xcode project.
4. In the Project Navigator in Xcode (that left column,) right-click on the “Frameworks” group and choose ‘Add Files to “YourProjectName”...’
5. Go in to AvaTax-Calc-SDK-iOS and select AvaTax-Calc.xcodeproj.
6. In the Project Navigator again, click on your project’s icon at the very top of the column so that you see the editor for your target’s settings.
7. Under General, scroll down to “Linked Frameworks and Libraries.”  Click the ‘+’ button, and the top option should say ‘libAvaTax-Calc-SDK.a’ with a little library-building icon.  Select that and click ‘Add’.
8. Switch to the ‘Build Settings’ tab at the top, and find the build setting called ‘Header Search Paths’.  Edit it, and add this relative path:  “AvaTax-Calc-SDK-iOS/build/Debug-universal/include/AvaTax-Calc-SDK”

In your project’s code, add #import “AvaTaxCalc.h”, and then alloc & init an instance of the class AvaTaxCalc, passing it your Avalara AdminConsole username & password on init. Using an instance (or multiple instances) of AvaTaxCalc is how you access all the API functionality provided by the SDK.

You will also find the JSONModel Library in the Third Party folder. This is required to serialize and de-serialize JSON into objects. You can also download it directly from the JSONModel Repository here : https://github.com/icanzilb/JSONModel

====

An alternative to sharing the full source from github is to build and hand off the static library.

To build a copy of the SDK as a static library to hand off to another developer:

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
