import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/themes/app_theme.dart';
import 'package:rickandmorty/widgets/circle_container.dart';

class ItemCharacter extends StatelessWidget {
  Character character;

  ItemCharacter({this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.card,
      ),
      child: _buildContent1(),
    );
  }

  Widget _buildContent1() {
    return Row(
      children: [
        CircleContainer(
          width: 60,
          height: 60,
          color: AppTheme.white,
          imageUrl: character.image,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.name,
                style: AppTheme.characterName,
                overflow: TextOverflow.clip,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleContainer(
                            width: 10,
                            height: 10,
                            color: AppTheme.white,
                            backgroundColor: character.status == 'Alive' ? AppTheme.statusGreen : AppTheme.statusRed,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            character.status + ' - ' + character.species,
                            style: AppTheme.characterLabel.copyWith(
                              color: AppTheme.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        character.gender,
                        style: AppTheme.characterLabel.copyWith(
                          color: AppTheme.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CircleContainer(
              width: 60,
              height: 60,
              color: AppTheme.white,
              imageUrl: character.image,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              character.name,
              style: AppTheme.characterName,
              overflow: TextOverflow.clip,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                CircleContainer(
                  width: 10,
                  height: 10,
                  color: AppTheme.white,
                  backgroundColor: AppTheme.statusGreen,
                ),
                SizedBox(width: 10),
                Text(
                  'Alive - ' + character.species,
                  style: AppTheme.characterLabel.copyWith(
                    color: AppTheme.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          verticalDirection: VerticalDirection.down,
          children: [
            Text(
              '',
              style: AppTheme.characterName,
            ),
            SizedBox(height: 12),
            Text(
              character.gender,
              style: AppTheme.characterLabel.copyWith(
                color: AppTheme.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
