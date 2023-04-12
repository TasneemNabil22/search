import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MenusPage extends StatefulWidget {
  @override
  _MenusPageState createState() => _MenusPageState();
}

class _MenusPageState extends State<MenusPage> {
  String _searchQuery = '';
  String _errorMessage = '';
  bool _isConnected = true;
  bool _searched = false;

  void _onSearchChanged(String value) {
    if (value.length <= 30) {
      setState(() {
        _searchQuery = value;
        _errorMessage = '';
      });
    } else {
      setState(() {
        _searchQuery = '';
        _errorMessage = 'Exceeded character limit of 30';
      });
    }
  }

  void _onSearchButtonPressed() async {
    // Check for internet connection
    ConnectivityResult result = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = result != ConnectivityResult.none;
      _searched = true;
    });

    if (_isConnected && _searchQuery.isNotEmpty) {
      // Call search function with _searchQuery
      // Implement search algorithm here
      print('Search Query: $_searchQuery');
    }
  }

  void _onRetryButtonPressed() {
    _onSearchButtonPressed();
  }
//////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 50, 50, 46),
            child: Column(
              children: [
                TextField(
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Search',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFEFEEEE)), 
                          borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          if (_searched && !_isConnected)
            NoConnectionMessage(onRetry: _onRetryButtonPressed),
          // Add the rest of  Menus page UI components here
          // Don't forget to display "Not Found" when there are no search results
        ],
      ),
    );
  }
}

class NoConnectionMessage extends StatelessWidget {
  final Function onRetry;

  NoConnectionMessage({required this.onRetry});


// No internet page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff5f5f8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 24, 16, 24),
            width: 120,
            height: 120,
            child: Image.asset(
              'assets/images/eva-wifi-off-fill.png',
              width: 120,
              height: 120,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              'No internet Connection',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontSize: 31.2,
                fontWeight: FontWeight.w600,
                height: 35.2,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
            constraints: BoxConstraints(
              maxWidth: 200.0,
            ),
            child: Text(
              'Your internet connection is currently\nnot available please check or try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontSize: 21.34,
                fontWeight: FontWeight.w400,
                height: 35.2,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60.0,
            decoration: BoxDecoration(
              color: Color(0xfffa4a0c),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                'Try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 21.34,
                  fontWeight: FontWeight.w600,
                  height: 35.2,
                  color: Color(0xfff6f6f9),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
    );
  }
}
