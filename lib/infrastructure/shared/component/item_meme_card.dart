import 'package:algo_pic/infrastructure/models/home_model/home_model.dart';
import 'package:algo_pic/infrastructure/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class ItemMemeCard extends StatelessWidget {
  final MemeModel meme;
  Function onTap;

  ItemMemeCard({Key? key, required this.meme, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        color: Colors.blueAccent,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(meme.url),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  meme.name,
                  style: whiteTextStyle,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
