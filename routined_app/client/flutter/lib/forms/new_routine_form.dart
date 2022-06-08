import 'package:flutter/material.dart';

// Define a custom Form widget.
class NewRoutineForm extends StatefulWidget {
  const NewRoutineForm({super.key});

  @override
  NewRoutineFormState createState() {
    return NewRoutineFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class NewRoutineFormState extends State<NewRoutineForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  void _showOverlay(BuildContext context) async {
    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      // You can return any widget you like here
      // to be displayed on the Overlay
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.2,
        top: MediaQuery.of(context).size.height * 0.3,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Stack(
            children: [
              Image.asset(
                'images/commentCloud.png',
                colorBlendMode: BlendMode.multiply,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.13,
                left: MediaQuery.of(context).size.width * 0.13,
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        'This is a button!',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                    ),
                    GestureDetector(
                      onTap: () {
                        // When the icon is pressed the OverlayEntry
                        // is removed from Overlay
                        //overlayEntry.remove();
                      },
                      child: Icon(Icons.close,
                          color: Colors.green,
                          size: MediaQuery.of(context).size.height * 0.025),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });

    // Inserting the OverlayEntry into the Overlay
    overlayState?.insert(overlayEntry);
  }
}
