import 'package:anibe_newapp/pages/login/login.dart';
import 'package:anibe_newapp/pages/user/index.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'home/index.dart';
import '../model/user.dart';

class DrawerItem {
  String title;
  // icon
  IconData icon;
  // enable show in menu
  bool show = true;
  DrawerItem(this.title, this.icon, this.show);
}

class TabsPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Главная", Icons.home, true),
    new DrawerItem("Профиль", Icons.notifications, false),
    new DrawerItem("Поиск", Icons.search, true),
    new DrawerItem("Уведомления", Icons.notifications, true),
  ];

  bool isLogin = false;
  final CurrentUser user = CurrentUser.fromJson({
    "id": "5c533dbb889e940019ec1d9c",
    "online": true,
    "name": "deissh",
    "picture": "https://cdn.anibe.ru/avatars/5c533dbb889e940019ec1d9c/1551757027703",
    "desc": "хз что о себе написать, пусть будет вот этот кекс!",
    "badges": [
        {
            "name": "Tester",
            "icon": "bug"
        },
        {
            "name": "Developer",
            "icon": "code"
        }
    ],
    "email": "deissh@yandex.ru",
    "role": "admin",
    "favorite": [
        {
            "id": "5c7be64e44f3d01801bac0ce",
            "name": "Mushoku Tensei: Isekai Ittara Honki Dasu / Реинкарнация безработного: История о приключениях в другом мире",
            "annotation": "34-летний отаку-затворник был выгнан из дома. Без гроша в кармане он осознал, что жизнь подошла к концу. Затем он понял, что его жизнь вообще могла бы быть намного лучше, если бы он мог избавиться от наполняющих ее темных страниц. Пребывая в сожалениях, он увидел, как грузовик со спящим водителем быстро приближается к трем школьникам.",
            "cover": "https://cdn.anibe.ru/manga/Mushoku_Tensei_Isekai_Ittara_Honki_Dasu/cover/cover.jpg",
            "author": "Yuka Fujikawa, Rifujin na Magonote",
            "genre": [
                "Сейнен",
                "Фантастика",
                "Приключения",
                "Экшен",
                "Драма",
                "Этти",
                "Гарем",
                "Романтика",
                "Комедия"
            ],
            "type": "Манга",
            "rating": 8.17
        },
        {
            "id": "5c7be63044f3d01801bac005",
            "name": "Shokugeki no Souma / Повар - боец Сома: В поисках божественного рецепта",
            "annotation": "Мечта Юкихиры Сома - стать полноценным шеф-поваром ресторана своего отца и превзойти его в кулинарии. Но как только Юкихира закончил среднюю школу Юкихира Дзюичиро, его отец, закрыл ресторан и отправился готовить в Европу.",
            "cover": "https://cdn.anibe.ru/manga/Shokugeki_no_Souma/cover/cover.jpg",
            "author": "Yuuto Tsukuda, Yuki Morisaki, Shun Saeki",
            "genre": [
                "Сёнен",
                "Школа",
                "Комедия",
                "Этти",
                "Романтика"
            ],
            "type": "Манга",
            "rating": 8.46
        },
        {
            "id": "5c7be61b44f3d01801babf7a",
            "name": "Grand Blue / Необъятный океан",
            "annotation": "У Иори Китахары начинается новая жизнь, когда он поступает в колледж рядом с океаном в Идзу-сити. Он радуется новым переменам в своей жизни и переезжает в дайвинг-магазин своего дяди под названием «Необъятный океан».",
            "cover": "https://cdn.anibe.ru/manga/Grand_Blue/cover/cover.jpg",
            "author": "Kenji Inoue",
            "genre": [
                "Комедия",
                "Повседневность",
                "Сейнен"
            ],
            "type": "Манга",
            "rating": 9.01
        },
        {
            "id": "5c7be61944f3d01801babf6f",
            "name": "The Breaker / Сокрушитель",
            "annotation": "Сиун, жертва вечных побоев школьных хулиганов, стал свидетелем боевой силы Чун Ву и просит его взять себя в ученики. Чун Ву обещает научить его, но если Сиун действительно этого хочет, то должен спрыгнуть с моста в реку, чтобы доказать это!",
            "cover": "https://cdn.anibe.ru/manga/thebreaker/cover/cover.jpg",
            "author": "Geuk Jin Jeon, Jin Hwan Park",
            "genre": [
                "Боевые искусства",
                "Школа",
                "Экшен",
                "Сверхъестественное",
                "Комедия",
                "Драма"
            ],
            "type": "Манхва",
            "rating": 9.35
        }
    ],
    "thrown": [],
    "inprogress": [
        {
            "id": "5c7be61e44f3d01801babf9d",
            "name": "The Breaker: New Waves / Сокрушитель: Новые волны",
            "annotation": "После того как учитель Ку-Мун-Рён уничтожил Ки центр Сиуна, тот решает покинуть мир Мурима и вернуться к обычной жизни. Но человек, владеющий Медальоном Феникса клана Син-ву, и единственный ученик знаменитого Ку-Мун-Рёна не может покинуть мир Мурима так просто.",
            "cover": "https://cdn.anibe.ru/manga/The_Breaker_New_Waves/cover/cover.jpg",
            "author": "Jin-Hwan Park, Geuk-jin Jeon",
            "genre": [
                "Боевые искусства",
                "Комедия",
                "Драма",
                "Экшен",
                "Романтика",
                "Школа"
            ],
            "type": "Манхва",
            "rating": 9.14
        },
        {
            "id": "5c7be64644f3d01801bac09b",
            "name": "Mx0 / Обезмаженный",
            "annotation": "Кудзуми Тайга - обычный школьник. Во время поступления в старшую школу Сэйнаги на вопрос экзаменатора: “что бы вы сделали, если бы владели магией?” он ответил: “завоевал бы мир”, и был тут же обсмеян рядом сидящей девушкой.",
            "cover": "https://cdn.anibe.ru/manga/Mx0/cover/cover.jpg",
            "author": "Yasuhiro Kano",
            "genre": [
                "Экшен",
                "Комедия",
                "Этти",
                "Фантастика",
                "Магия",
                "Романтика",
                "Школа",
                "Сёнен",
                "Сверхъестественное"
            ],
            "type": "Манга",
            "rating": 8.2
        }
    ],
    "readed": [
        {
            "id": "5c7be65044f3d01801bac0f2",
            "name": "Naruto / Наруто",
            "annotation": "Узумаки Наруто довелось родиться в опасное время: на Деревню Скрытого Листа напал легендарный демон – Девятихвостый Лис.",
            "cover": "https://cdn.anibe.ru/manga/naruto/cover/cover.jpg",
            "author": "Masashi Kishimoto",
            "genre": [
                "Экшен",
                "Приключения",
                "Боевые искусства",
                "Сейнен",
                "Супер сила"
            ],
            "type": "Манга",
            "rating": 8.14
        },
        {
            "id": "5c7be61b44f3d01801babf7d",
            "name": "Shingeki no Kyojin / Вторжение гигантов",
            "annotation": "С давних времён человечество ведёт свою борьбу с Гигантами. Гиганты - это огромные существа, ростом с многоэтажный дом, которые не обладают большим интеллектом, но сила их просто ужасна. Они едят людей и получают от этого удовольствие",
            "cover": "https://cdn.anibe.ru/manga/shingekinokyojin/cover/cover.jpg",
            "author": "Hajime Isayama",
            "genre": [
                "Экшен",
                "Мистика",
                "Драма",
                "Фантастика",
                "Ужасы",
                "Сёнен",
                "Супер сила",
                "Сверхъестественное"
            ],
            "type": "Манга",
            "rating": 9
        },
        {
            "id": "5c7be61d44f3d01801babf93",
            "name": "Fullmetal Alchemist / Стальной алхимик",
            "annotation": "«Чтобы что-то получить, надо отдать что-то равноценное» - основнополагающий принцип алхимии, непреложное правило, которому должны придерживаться все алхимики. Сама алхимия - это наука о разрушении чего-то, перерождения его в другом качестве, но при этом должны соблюдаться правила.",
            "cover": "https://cdn.anibe.ru/manga/fullmetalalchemist/cover/cover.jpg",
            "author": "Hiromu Arakawa",
            "genre": [
                "Экшен",
                "Приключения",
                "Комедия",
                "Драма",
                "Сёнен",
                "Военное"
            ],
            "type": "Манга",
            "rating": 9.1
        },
        {
            "id": "5c7be63e44f3d01801bac051",
            "name": "Skill of Lure / Искусство соблазнения",
            "annotation": "Чан Сунги имеет стойкую репутацию извращенца и худшего парня на планете. И в один прекрасный момент он встречает наставника, который превращает его в мега харизматичного парня. Клёвая и пикантная история о том, как совершенно обычный парень превращается в гения пик-апа. Мастхев для парней, мечтающих снять себе девочку.",
            "cover": "https://cdn.anibe.ru/manga/Skill_of_Lure/cover/cover.jpg",
            "author": "Sang Ho Woo",
            "genre": [
                "Сёнен",
                "Комедия",
                "Этти",
                "Повседневность",
                "Романтика"
            ],
            "type": "Манхва",
            "rating": 8.32
        }
    ],
    "willread": [
        {
            "id": "5c7be6f944f3d01801bac71f",
            "name": "Isekai wa Smartphone to Tomo ni / Со своим смартфоном в параллельном мире",
            "annotation": "Парню по имени Мотидзуки Тоя не повезло, в него попала молния и он погиб. После смерти он попал не в ад или рай, а прямиком к Богу, который сообщил ему, что он умер просто по ошибке, и пообещал, что в качестве извинения позволит Тое перенестись в параллельный фэнтези-мир, взяв с собой один предмет из прошлой жизни.",
            "cover": "https://cdn.anibe.ru/manga/Isekai_wa_Smartphone_to_Tomo_ni/cover/cover.jpg",
            "author": "Soto, Patora Fuyuhara",
            "genre": [
                "Сёнен",
                "Сверхъестественное",
                "Гарем",
                "Фантастика",
                "Приключения",
                "Экшен",
                "Комедия",
                "Романтика"
            ],
            "type": "Манга",
            "rating": 7.19
        }
    ],
    "createdAt": "2019-01-31T18:26:03.839Z"
});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
      case 1:
        return new UserPage(widget.user);
      case 2:
        return new Container();
      case 3:
        return new Container();

      default:
        return new Text("Not implement");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  Widget _getAccauntDrawer(BuildContext context) {
    if (widget.isLogin) {
      return new GestureDetector(
        onTap: () {
          _onSelectItem(1);
        },
        child: new UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: new CachedNetworkImageProvider(widget.user.picture),
          ),
          accountName: new Text(widget.user.name),
          accountEmail: Text(widget.user.email),
        ),
      );
    } else {
      return new GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginPage();
            }),
          );
        },
        child: new UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).textSelectionColor,
            child: Text('+'),
          ),
          accountName: Text('Anibe'),
          accountEmail: Text('Не авторизован'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      if (d.show) {
        drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
        );
      }
    }

    if (widget.isLogin) {
      drawerOptions.add(new ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Выйти'),
        onTap: () {
          setState(() {
            widget.isLogin = false;
          });
        },
      ));
    }
    drawerOptions.add(new Divider());
    drawerOptions.add(new SwitchListTile(
      title: Text('Темная тема β'),
      value: Theme.of(context).brightness == Brightness.dark,
      onChanged: (bool newv) {
        DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
      },
    ));

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        elevation: 0,
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            _getAccauntDrawer(context),
            new Column(children: drawerOptions),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}