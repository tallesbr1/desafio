import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio/models/repositoriesItem.dart';
import 'package:flutter/material.dart';

class RepositoryItemWidget extends StatelessWidget {
  RepositoriesItemsModel model;

  RepositoryItemWidget({@required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AlertDialog alert = AlertDialog(
          title: Text("Descrição"),
          content: Text(model.description),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      },
      child: Card(
        color: Colors.grey[900],
        margin: EdgeInsets.all(1),
        elevation: 1,
        child: Container(
          height: 160,
          constraints: BoxConstraints(
            maxHeight: 200,
          ),
          padding: EdgeInsets.all(5),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 270,
                height: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: ExactAssetImage("assets/images/star.png"),
                          ),
                          Text(
                            "${model.stargazersCount.toString()}",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: ExactAssetImage("assets/images/branch.png"),
                          ),
                          Text(
                            "${model.forksCount.toString()}",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: model.owner.avatarUrl,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 35,
                    child: Text(
                      "${model.owner.login}",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
