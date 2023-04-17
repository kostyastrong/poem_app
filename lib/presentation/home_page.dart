import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poem_app/di.dart';
import 'package:poem_app/domain/db/db_manager.dart';
import 'package:poem_app/presentation/lang.dart';
import 'package:poem_app/presentation/styles/texts.dart';

import '../domain/navigation/named_routes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (FirebaseAuth.instance.currentUser == null) {
      logger.i("Home page build, user isn't signed in");
    } else {
      logger.i("Home page build, user is ${FirebaseAuth.instance.currentUser}");
    }

    ref.read(dbManagerProvider).poemStream();

    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.of(context).appTitle),
      ),
      body: ListView(
        children: [
          // const PoemCell(poem: 'poem', title: 'title'),
          const PoemCell(
              poem:
                  "Christmas falls on a Friday — the long week\nof labor and waiting is gray with dull light,\nand gradually the gloom fills my bones —\nI have declared myself a fat man once too often.\nHere in Nebraska I have learned the art\nof restraint — hoarding lamentations and complaints;\nhow to hold my tongue until it is clear\nthat those around me have unlearned\nthe rituals of compassion; they cannot see\nthe despair in my eyes. Remember when\nwe knew that simply speaking out, our bile\nwould release it from our bodies,\nthat leeching chemistry of confession or hoping?\nNot here. Here the body creates a membrane\nof such leathery resilience that it may\nkeep in all the wounds we have collected.\nAnd here in the slow march to Christmas,\nI grow bloated with decency; and I have\ndecided to grow my beard again — the uniform\nof a man pioneering the wilderness. At church,\nthe choir did not sing a Christmas song —\nit is as if someone forgot the season —\nbut the pastors and elders all wore suits\nand ties; while we clapped our hands\nto the radio songs — good, clean Jesus\nof Chick-fil-A and Texas charm. Look\nat my eyes. Pay attention. Clouds, slow moving,\nacross the prairie sky — so slow it is as if\nnothing is moving across the bigness of things.\n\nVictoria Chang is a poet whose new book of poems is “The Trees Witness Everything” (Copper Canyon Press, 2022). Her fifth book of poems, “Obit” (2020), was named a New York Times Notable Book and a Time Must-Read. She lives in Los Angeles and teaches in Antioch University’s M.F.A. program. Kwame Dawes is the author of several books, including “Bob Marley: Lyrical Genius” (Bobcat Books, 2007), “A Far Cry From Plymouth Rock: A Personal Narrative” (Peepal Tree Press, 2007), the poetry collections “Wisteria: Twilight Poems From the Swamp Country” (Red Hen Press, 2006), “Duppy Conqueror” (Copper Canyon Press, 2013) and “Nebraska” (University of Nebraska Press, 2019), in which this poem appears. He is a professor of English at the University of Nebraska-Lincoln and editor in chief of Prairie Schooner magazine.\nA version of this article appears in print on Dec. 11, 2022, Page 14 of the Sunday Magazine with the headline: Poem: AdventDR. Order Reprints | Today’s Paper | Subscribe\n\nThe Power of Poetry\nWith rhyme and rhythm, poems allow us to express ourselves in a distinctive way.\n\n    The Book Review devoted an entire issue to the genre, starting with a very basic question: What is poetry?\n\n    Here are the seven poetry collections that have stuck with our columnist in 2022.\n\n    Ada Limón was named the 24th ​​poet laureate of the United States. On tour for her sixth book, she spoke about her journey to becoming a successful full-time writer.\n\n    After more than 1,300 teenagers told The Times about the small kindnesses they appreciate, the poet Danusha Laméris wove their answers into verse.\n\n    Taylor Johnson was named the Guggenheim Museum’s first poet in residence. He planned to fill the space with “poem signs,” panels, interactive experiences and pop-up readings.\n\n    Looking for ways to appreciate poetry? Here are 30 ideas that even the most verse averse will enjoy.\n\nPoem\nA new poem every week, from The New York Times Magazine.\nPoem: On Jasmine\nPoem: The Privilege of Thinking\nPoem: The Life of Sun Ra\nMore in Magazine\nWhat Do People Do All Day?\nIllustration by Tomi Um\nMy Grandmother Has Alzheimer’s. Do I Need to Keep Visiting Her?\nHolly Andres for The New York Times\nWhat I Learned Dogsitting for New York City’s Opulent Elite\nIllustration by Tomi Um\nMy Rich Friend Lied to Get Financial Aid. Should I Confront Her?\nIllustration by Louise Zergaeng Pomeroy\nJudge John Hodgman on Cheating at Pub Trivia\nChris Simpson for The New York Times. Food stylist: Maggie Ruggiero. Prop stylist: Sophia Pappas.\nYotam Ottolenghi’s Top 10 Ingredients, in One Dish\nEditors’ Picks\nAccording to lore, the formula for Chartreuse is based on a recipe that was entrusted to the Carthusian order of monks in 1605.\nLeor Miller for The New York Times\nWhy Is Chartreuse Hard to Find Right Now? Ask the Monks Who Make It.\nDylan Mulvaney began documenting her gender transition journey in the “Days of Girlhood” series on TikTok just over a year ago.\nRob Kim/Getty Images\nBehind the Backlash Against Bud Light’s Transgender Influencer\nShutterstock\nA Swedish Warship Sank in 1628. It’s Still Yielding Secrets.\nTrending in The Times\nFor ‘Last Tango’ Actress, the Ugly Aftermath of Notoriety\nIs This Heaven? No, It’s Vancouver.\nPolice Officers Answering a Burglary Call Kill 78-Year-Old Resident\nOpinion: Why People Are Fleeing Blue Cities for Red States\nIt’s a Toddler’s Party. How About a 75,000 Budget?\nRolex (an Egg Wrap, Not a Watch) Is the Breakfast to Change Your Mornings\n1 Dead and Nearly 100 Sickened in Fungal Outbreak at Paper Mill\nStephen Colbert Can Tell When Fox News Is Lying\nOpinion: The 100-Year-Old Reason U.S. Housing Is So Expensive\nBiden Overcome After Seeing Priest Who Gave Last Rites to Son Beau\n",
              title: 'Title'),
          const PoemCell(
              poem:
                  "Christmas falls on a Friday — the long week\nof labor and waiting is gray with dull light,\nand gradually the gloom fills my bones —\nI have declared myself a fat man once too often.\nHere in Nebraska I have learned the art\nof restraint — hoarding lamentations and complaints;\nhow to hold my tongue until it is clear\nthat those around me have unlearned\nthe rituals of compassion; they cannot see\nthe despair in my eyes. Remember when\nwe knew that simply speaking out, our bile\nwould release it from our bodies,\nthat leeching chemistry of confession or hoping?\nNot here. Here the body creates a membrane\nof such leathery resilience that it may\nkeep in all the wounds we have collected.\nAnd here in the slow march to Christmas,\nI grow bloated with decency; and I have\ndecided to grow my beard again — the uniform\nof a man pioneering the wilderness. At church,\nthe choir did not sing a Christmas song —\nit is as if someone forgot the season —\nbut the pastors and elders all wore suits\nand ties; while we clapped our hands\nto the radio songs — good, clean Jesus\nof Chick-fil-A and Texas charm. Look\nat my eyes. Pay attention. Clouds, slow moving,\nacross the prairie sky — so slow it is as if\nnothing is moving across the bigness of things.\n\nVictoria Chang is a poet whose new book of poems is “The Trees Witness Everything” (Copper Canyon Press, 2022). Her fifth book of poems, “Obit” (2020), was named a New York Times Notable Book and a Time Must-Read. She lives in Los Angeles and teaches in Antioch University’s M.F.A. program. Kwame Dawes is the author of several books, including “Bob Marley: Lyrical Genius” (Bobcat Books, 2007), “A Far Cry From Plymouth Rock: A Personal Narrative” (Peepal Tree Press, 2007), the poetry collections “Wisteria: Twilight Poems From the Swamp Country” (Red Hen Press, 2006), “Duppy Conqueror” (Copper Canyon Press, 2013) and “Nebraska” (University of Nebraska Press, 2019), in which this poem appears. He is a professor of English at the University of Nebraska-Lincoln and editor in chief of Prairie Schooner magazine.\nA version of this article appears in print on Dec. 11, 2022, Page 14 of the Sunday Magazine with the headline: Poem: AdventDR. Order Reprints | Today’s Paper | Subscribe\n\nThe Power of Poetry\nWith rhyme and rhythm, poems allow us to express ourselves in a distinctive way.\n\n    The Book Review devoted an entire issue to the genre, starting with a very basic question: What is poetry?\n\n    Here are the seven poetry collections that have stuck with our columnist in 2022.\n\n    Ada Limón was named the 24th ​​poet laureate of the United States. On tour for her sixth book, she spoke about her journey to becoming a successful full-time writer.\n\n    After more than 1,300 teenagers told The Times about the small kindnesses they appreciate, the poet Danusha Laméris wove their answers into verse.\n\n    Taylor Johnson was named the Guggenheim Museum’s first poet in residence. He planned to fill the space with “poem signs,” panels, interactive experiences and pop-up readings.\n\n    Looking for ways to appreciate poetry? Here are 30 ideas that even the most verse averse will enjoy.\n\nPoem\nA new poem every week, from The New York Times Magazine.\nPoem: On Jasmine\nPoem: The Privilege of Thinking\nPoem: The Life of Sun Ra\nMore in Magazine\nWhat Do People Do All Day?\nIllustration by Tomi Um\nMy Grandmother Has Alzheimer’s. Do I Need to Keep Visiting Her?\nHolly Andres for The New York Times\nWhat I Learned Dogsitting for New York City’s Opulent Elite\nIllustration by Tomi Um\nMy Rich Friend Lied to Get Financial Aid. Should I Confront Her?\nIllustration by Louise Zergaeng Pomeroy\nJudge John Hodgman on Cheating at Pub Trivia\nChris Simpson for The New York Times. Food stylist: Maggie Ruggiero. Prop stylist: Sophia Pappas.\nYotam Ottolenghi’s Top 10 Ingredients, in One Dish\nEditors’ Picks\nAccording to lore, the formula for Chartreuse is based on a recipe that was entrusted to the Carthusian order of monks in 1605.\nLeor Miller for The New York Times\nWhy Is Chartreuse Hard to Find Right Now? Ask the Monks Who Make It.\nDylan Mulvaney began documenting her gender transition journey in the “Days of Girlhood” series on TikTok just over a year ago.\nRob Kim/Getty Images\nBehind the Backlash Against Bud Light’s Transgender Influencer\nShutterstock\nA Swedish Warship Sank in 1628. It’s Still Yielding Secrets.\nTrending in The Times\nFor ‘Last Tango’ Actress, the Ugly Aftermath of Notoriety\nIs This Heaven? No, It’s Vancouver.\nPolice Officers Answering a Burglary Call Kill 78-Year-Old Resident\nOpinion: Why People Are Fleeing Blue Cities for Red States\nIt’s a Toddler’s Party. How About a 75,000 Budget?\nRolex (an Egg Wrap, Not a Watch) Is the Breakfast to Change Your Mornings\n1 Dead and Nearly 100 Sickened in Fungal Outbreak at Paper Mill\nStephen Colbert Can Tell When Fox News Is Lying\nOpinion: The 100-Year-Old Reason U.S. Housing Is So Expensive\nBiden Overcome After Seeing Priest Who Gave Last Rites to Son Beau\n",
              title: 'Title'),
          const PoemCell(
              poem:
                  "Christmas falls on a Friday — the long week\nof labor and waiting is gray with dull light,\nand gradually the gloom fills my bones —\nI have declared myself a fat man once too often.\nHere in Nebraska I have learned the art\nof restraint — hoarding lamentations and complaints;\nhow to hold my tongue until it is clear\nthat those around me have unlearned\nthe rituals of compassion; they cannot see\nthe despair in my eyes. Remember when\nwe knew that simply speaking out, our bile\nwould release it from our bodies,\nthat leeching chemistry of confession or hoping?\nNot here. Here the body creates a membrane\nof such leathery resilience that it may\nkeep in all the wounds we have collected.\nAnd here in the slow march to Christmas,\nI grow bloated with decency; and I have\ndecided to grow my beard again — the uniform\nof a man pioneering the wilderness. At church,\nthe choir did not sing a Christmas song —\nit is as if someone forgot the season —\nbut the pastors and elders all wore suits\nand ties; while we clapped our hands\nto the radio songs — good, clean Jesus\nof Chick-fil-A and Texas charm. Look\nat my eyes. Pay attention. Clouds, slow moving,\nacross the prairie sky — so slow it is as if\nnothing is moving across the bigness of things.\n\nVictoria Chang is a poet whose new book of poems is “The Trees Witness Everything” (Copper Canyon Press, 2022). Her fifth book of poems, “Obit” (2020), was named a New York Times Notable Book and a Time Must-Read. She lives in Los Angeles and teaches in Antioch University’s M.F.A. program. Kwame Dawes is the author of several books, including “Bob Marley: Lyrical Genius” (Bobcat Books, 2007), “A Far Cry From Plymouth Rock: A Personal Narrative” (Peepal Tree Press, 2007), the poetry collections “Wisteria: Twilight Poems From the Swamp Country” (Red Hen Press, 2006), “Duppy Conqueror” (Copper Canyon Press, 2013) and “Nebraska” (University of Nebraska Press, 2019), in which this poem appears. He is a professor of English at the University of Nebraska-Lincoln and editor in chief of Prairie Schooner magazine.\nA version of this article appears in print on Dec. 11, 2022, Page 14 of the Sunday Magazine with the headline: Poem: AdventDR. Order Reprints | Today’s Paper | Subscribe\n\nThe Power of Poetry\nWith rhyme and rhythm, poems allow us to express ourselves in a distinctive way.\n\n    The Book Review devoted an entire issue to the genre, starting with a very basic question: What is poetry?\n\n    Here are the seven poetry collections that have stuck with our columnist in 2022.\n\n    Ada Limón was named the 24th ​​poet laureate of the United States. On tour for her sixth book, she spoke about her journey to becoming a successful full-time writer.\n\n    After more than 1,300 teenagers told The Times about the small kindnesses they appreciate, the poet Danusha Laméris wove their answers into verse.\n\n    Taylor Johnson was named the Guggenheim Museum’s first poet in residence. He planned to fill the space with “poem signs,” panels, interactive experiences and pop-up readings.\n\n    Looking for ways to appreciate poetry? Here are 30 ideas that even the most verse averse will enjoy.\n\nPoem\nA new poem every week, from The New York Times Magazine.\nPoem: On Jasmine\nPoem: The Privilege of Thinking\nPoem: The Life of Sun Ra\nMore in Magazine\nWhat Do People Do All Day?\nIllustration by Tomi Um\nMy Grandmother Has Alzheimer’s. Do I Need to Keep Visiting Her?\nHolly Andres for The New York Times\nWhat I Learned Dogsitting for New York City’s Opulent Elite\nIllustration by Tomi Um\nMy Rich Friend Lied to Get Financial Aid. Should I Confront Her?\nIllustration by Louise Zergaeng Pomeroy\nJudge John Hodgman on Cheating at Pub Trivia\nChris Simpson for The New York Times. Food stylist: Maggie Ruggiero. Prop stylist: Sophia Pappas.\nYotam Ottolenghi’s Top 10 Ingredients, in One Dish\nEditors’ Picks\nAccording to lore, the formula for Chartreuse is based on a recipe that was entrusted to the Carthusian order of monks in 1605.\nLeor Miller for The New York Times\nWhy Is Chartreuse Hard to Find Right Now? Ask the Monks Who Make It.\nDylan Mulvaney began documenting her gender transition journey in the “Days of Girlhood” series on TikTok just over a year ago.\nRob Kim/Getty Images\nBehind the Backlash Against Bud Light’s Transgender Influencer\nShutterstock\nA Swedish Warship Sank in 1628. It’s Still Yielding Secrets.\nTrending in The Times\nFor ‘Last Tango’ Actress, the Ugly Aftermath of Notoriety\nIs This Heaven? No, It’s Vancouver.\nPolice Officers Answering a Burglary Call Kill 78-Year-Old Resident\nOpinion: Why People Are Fleeing Blue Cities for Red States\nIt’s a Toddler’s Party. How About a 75,000 Budget?\nRolex (an Egg Wrap, Not a Watch) Is the Breakfast to Change Your Mornings\n1 Dead and Nearly 100 Sickened in Fungal Outbreak at Paper Mill\nStephen Colbert Can Tell When Fox News Is Lying\nOpinion: The 100-Year-Old Reason U.S. Housing Is So Expensive\nBiden Overcome After Seeing Priest Who Gave Last Rites to Son Beau\n",
              title: 'Title'),
          ElevatedButton(
              onPressed: () {
                ref
                    .watch(navigation)
                    .pushLogin(); // TODO: read instead of watch?
              },
              child: Text('Login')),
          ElevatedButton(
              onPressed: () {
                ref.watch(navigation).pushEdit();
              },
              child: Text('Edit')),
          TextButton(
            onPressed: () => throw Exception(),
            child: const Text("Throw Test Exception"),
          ),
        ],
      ),
    );
  }
}

class PoemCell extends StatelessWidget {
  const PoemCell({Key? key, required this.poem, required this.title})
      : super(key: key);

  final String poem;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 1,
                style: ThemeText.titleCell,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            poem,
            maxLines: 2,
            style: ThemeText.poemCell,
          )
        ],
      ),
    );
  }
}
