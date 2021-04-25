import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/themes/app_theme.dart';
import 'package:rickandmorty/widgets/circle_container.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final DetailArguments args =
        ModalRoute.of(context).settings.arguments as DetailArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.card,
        title: Text(args.character.name),
        centerTitle: true,
        titleTextStyle: AppTheme.appBarTitle,
      ),
      body: _buildBody(context, args),
    );
  }

  Widget _buildBody(BuildContext context, DetailArguments args) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: AppTheme.background,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleContainer(
              width: 175,
              height: 175,
              color: AppTheme.white,
              imageUrl: args.character.image,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleContainer(
                  width: 10,
                  height: 10,
                  color: AppTheme.white,
                  backgroundColor: AppTheme.statusGreen,
                ),
                SizedBox(width: 10),
                Text(
                  'Alive - ' + args.character.species,
                  style: AppTheme.characterLabel.copyWith(
                    color: AppTheme.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildInfo(args),
          ],
        ));
  }

  Widget _buildInfo(DetailArguments args) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Original Location',
          style: AppTheme.characterLabel.copyWith(
            color: AppTheme.white.withOpacity(0.5),
          ),
        ),
        Text(args.character.origin.name, style: AppTheme.characterName),
        SizedBox(height: 10),
        Divider(color: AppTheme.divider),
        SizedBox(height: 10),
        Text(
          'Gender',
          style: AppTheme.characterLabel.copyWith(
            color: AppTheme.white.withOpacity(0.5),
          ),
        ),
        Text(args.character.gender, style: AppTheme.characterName),
        SizedBox(height: 10),
        Divider(color: AppTheme.divider, height: 2,),
        SizedBox(height: 10),
        Text(
          'Location',
          style: AppTheme.characterLabel.copyWith(
            color: AppTheme.white.withOpacity(0.5),
          ),
        ),
        Text(args.character.location.name, style: AppTheme.characterName),
      ],
    );
  }
}

class DetailArguments {
  final Character character;

  DetailArguments({
    this.character,
  });
}
