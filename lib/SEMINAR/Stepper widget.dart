import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int activeStep = 0;   //the active step variable tracks the current step.
  int activeStep2 = 0;   // while reachedsteps stores completed steps.the ui updates dynamically using setstateint
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          backgroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    children: [
                      SizedBox(height: 20),
                      EasyStepper(         //easy stepper widget this is the main stepper component.
                        activeStep: activeStep,
                        lineStyle: LineStyle(
                          lineLength: 100,
                          lineThickness: 6,
                          lineSpace: 4,
                          lineType: LineType.normal,
                          defaultLineColor: Colors.purple.shade300,
                          progress: progress,
                          // progressColor: Colors.purple.shade700,
                        ),
                        borderThickness: 10,
                        internalPadding: 15,
                        //loadingAnimation: 'assets/images/cart.jpeg',
                        steps: const [
                          EasyStep(  //step configuration
                            icon: Icon(CupertinoIcons.cart),
                            title: 'Cart',
                            lineText: 'Add Address Info',
                          ),
                          EasyStep(
                            icon: Icon(CupertinoIcons.info),
                            title: 'Address',
                            lineText: 'Go To Checkout',
                          ),
                          EasyStep(
                            icon: Icon(CupertinoIcons.cart_fill_badge_plus),
                            title: 'Checkout',
                            lineText: 'Choose Payment Method',
                          ),
                          EasyStep(
                            icon: Icon(CupertinoIcons.money_dollar),
                            title: 'Payment',
                            lineText: 'Confirm Order Items',
                          ),
                          EasyStep(
                            icon: Icon(Icons.file_present_rounded),
                            title: 'Order Details',
                            lineText: 'Submit Order',
                          ),
                          EasyStep(
                            icon: Icon(Icons.check_circle_outline),
                            title: 'Finish',
                          ),
                        ],
                        onStepReached: (index) => setState(() => activeStep = index),
                        // the active step

                      )
                    ]
                )
            )
        ),
      ),
    );
  }
}