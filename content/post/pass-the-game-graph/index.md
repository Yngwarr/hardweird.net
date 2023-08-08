---
draft: true
title: "A graph visualization for Pass the Game challenge"
date: 2023-08-01
---

Past week I took part at [Blackthornprod]'s Pass the Game Jam. It's a crowd
version of their youtube series "[Making a game without communicating][series]"
with some changes in rules to make it work for a jam format. You're not allowed
to communicate with any developers of the prototype you're working on, you're
required to work on a prototype from a previous day, you don't have to
participate in every day of the competition and it's perfectly fine work as a
team with someone, who didn't work on the game you're extending before.

[blackthornprod]: https://www.youtube.com/@Blackthornprod
[series]: https://www.youtube.com/playlist?list=PLBIb_auVtBwCNnbmuppsBJdulUZmW0Cfu

My participation was pretty limited: I scraped a prototype for day 1, run into a
nasty bug in Godot 4 (should've seen it coming, but it caught me by surprise)
and then added music to the game my friends started. Not very productive, but
the best I could do.

But after the third day I found myself wondering: what would a connection graph
of all entries look like. Probably, there would be a lot of day 1 entries
without the continuation, a few big trees originating in one starting point
and perhaps several chains that didn't survive to the final day.

Long story short, I made a [graph view]!

[graph view]: http://hardweird.net/pass-the-game-graph/

{{< rawhtml >}}
<iframe src="http://hardweird.net/pass-the-game-graph/?hide-help=1" width="720"
height="720" frameborder="0"></iframe>
{{< /rawhtml >}}

<!-- TODO add a static image for mobile devices -->

It's interactive, you can move dots around (in fact, you need to do it to
untangle this mess; let's consider it an unintended game mechanic :) ). Nodes
represent jam entries, different colors are for different days.

<!-- As you can see, some of my preditions turned out to be true: -->
<!---->
<!-- - Many single day 1 entries -->
<!-- - Several big trees -->
<!-- - Some stuck on different days -->
<!---->
<!-- I didn't think there would be linear games from start to finish. -->
<!---->
<!-- That's how I made the view: -->
<!-- - Added .json to an entry page url to realize there's actually an api I'm -->
<!--     looking for. -->
<!-- - Used the correct url to download the list of all entries (no paging whatsoever) -->
<!-- - Scraped every listed page for links in the description -->
<!-- - Some people post links to entries, some — to games. Also, needed a way to filter -->
<!--     out irrelevant links. Solution: index. Consistent link is an entity one -->
<!--     because it's trivial to sort by day -->
<!-- - Building the links: we want a tree, so store links only one step back, use -->
<!--     sorting to determine which entry to link to -->
<!-- - Some people wouldn't post links or will post them incorrect. That's why I -->
<!--     scrape with one script and show with another -->
<!-- - For visuals, I took someone else's d3 code and modified it a bit to show the -->
<!--     info -->
<!---->
<!-- Problems I didn't expect -->
<!-- - people leave links to their own entries. -->
<!-- - people leave links to all the entries in a branch -->
<!-- - some link queue, which I didn't know about -->
<!---->
<!-- Insights from a graph: -->
<!-- - Many dead games. Kinda obfious. -->
<!-- - Many day 6 entries originate from the same day 5 entries. -->
<!-- - Several chains are perfectly linear. -->
<!---->
<!-- What could be made better: -->
<!-- - search for a game by a name or an author -->
<!-- - highlight the current tree, show its stats (e. g. total count of nodes in it) -->
<!-- - untangle it automatically -->
