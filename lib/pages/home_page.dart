import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/core/network/rest_api_service.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/themes/app_theme.dart';
import 'package:rickandmorty/widgets/item_character.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Character> _characterList = <Character>[];
  RestApiService _restApiService = RestApiService();
  ScrollController _scrollController = ScrollController();
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    getCharactersList(page);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (!isLoading) {
          print('page scroll: ' + page.toString());
          getCharactersList(page);
        }
      }
    });

    super.initState();
  }

  Future<Null> getCharactersList(int page) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var response = await _restApiService.getListCharacter(page);
      setState(() {
        this.page++;
        _characterList.addAll(response.characters);
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.card,
        title: Text('Rick and Morty'),
        centerTitle: true,
        titleTextStyle: AppTheme.appBarTitle,
      ),
      body: Container(
        child: Container(
          color: AppTheme.background,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : _buildCharacterList(context, _characterList),
          ),
        ),
      ),
    );
  }

  Widget _buildCharacterList(
      BuildContext context, List<Character> characterList) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          itemCount: _characterList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == _characterList.length) {
              return Center(
                child: Opacity(
                  opacity: isLoading ? 1 : 0,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: ItemCharacter(character: _characterList[index])
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}