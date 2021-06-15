import 'package:chill_movies/core/constant/app_plaform.dart';
import 'package:chill_movies/core/widgets/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class HeaderWeb extends StatelessWidget {
  const HeaderWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSize.config(context);
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoreButton(),
              Text(
                "Chill Movies",
                style: TextStyle(
                    fontFamily: 'BLAKLITN',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(
                children: [_ProfileButton()],
              )
            ],
          ),
        ),
        SearchMobileView()
      ],
    );
  }
}

class SearchMobileView extends StatelessWidget {
  const SearchMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.black,
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      CupertinoIcons.search,
                      size: 20,
                      color: AppColor.primaryColor,
                    ),
                    width: 40,
                    height: 40,
                  ),
                  Container(
                    height: 40,
                    width: AppSize.width - 15 - 40 - 30,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: AppPlaform.isWeb ? 12 : 4),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        cursorColor: AppColor.primaryColor,
                        decoration: InputDecoration(
                          hintText: "Enter keyword...",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileButton extends StatelessWidget {
  const _ProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: MaterialButton(
        onPressed: () {},
        child: Icon(
          CupertinoIcons.profile_circled,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: MaterialButton(
        onPressed: () {},
        child: Icon(
          CupertinoIcons.search,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: MaterialButton(
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 15,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              width: 15,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              width: 15,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
