import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'currencyservice.dart';
import 'package:cbdc_app/screens/dashboard.dart';
import 'package:cbdc_app/screens/home_screen.dart';
class InputRedPage extends StatefulWidget {
  var origCurrency;
  var convCurrency;

  InputRedPage({this.origCurrency, this.convCurrency});

  @override
  _InputRedPageState createState() => _InputRedPageState();
}

class _InputRedPageState extends State<InputRedPage> {
  var currInput = 0;
  createAlertDialog (BuildContext context) {

    return showDialog (context: context, builder: (context){
      return AlertDialog(
        title: Text("Sure to Convert \$$currInput to CBDC?"),
        actions: [
          MaterialButton(
            elevation: 5.0,
            child: Text('Confirm'),
            onPressed:() {
              CurrencyService().convertCurrency(
                  "Cash", widget.convCurrency, currInput, context);
              Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => DashboardPage(currencyVal: 0.0,
                      convertedCurrency: 0.0,
                      currencyone: 'CASH',
                      currencytwo: 'CBDC',
                      isWhite: false))
              );

            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEC5759),
      body: Column(
        children: <Widget>[
          SizedBox(height: 25.0),
          InkWell(
            onTap: () {
              setState(() {
                currInput = 0;
              });
            },
            child: Text(
              'tap to delete',
              style: TextStyle(
                  color: Color(0xFFF1ABAB),
                  fontSize: 17.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              currInput.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 25.0),
          numberRow(1, 2, 3),
          SizedBox(height: 25.0),
          numberRow(4, 5, 6),
          SizedBox(height: 25.0),
          numberRow(7, 8, 9),
          SizedBox(height: 25.0),
          finalRow(),

        ],

      ),

    );
  }

  Widget numberRow(number1, number2, number3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            calculateNumber(number1);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                number1.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(number2);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                number2.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(number3);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                number3.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget finalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            // calculateNumber(number1);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                '.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(0);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Color(0xFFB73434)),
            child: Center(
              child: Text(
                0.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            createAlertDialog (context);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0), color: Colors.white),
            child: Center(
                child: Icon(
                  Icons.check,
                  color: Color(0xFFFC1514),
                  size: 25.0,
                )),
          ),
        )
      ],
    );
  }

  calculateNumber(number) {
    if (currInput == 0) {
      setState(() {
        currInput = number;
      });
    } else {
      setState(() {
        currInput = (currInput * 10) + number;
      });
    }
  }
}

void _navigateToHomeScreen(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.of(context).pushReplacement(HomeScreen.route),
  );
}