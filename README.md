# Intro

The player companion app is an app built in flutter for android and (hopefully) ios. It allows my players to check system wide news, shop, and send messages to contacts.

Its design is influenced by the hand terminals in The Expanse and thus looks sort of like a futuristic phone operating system. It has 'apps' and the user switches between them in a launcher.

# 'Apps'
## Top Bar

The topbar is available on all 'apps', it shows the 'Holo Hive OS V113' in the left, and the current date in the top right.

V113 is significant as there are references to the protomolecule reaching out 113 times a second, and it is the old numbers from my old gamer-tags/social media ("yoda113" and kristoff1131).

The time currently is hardcoded to be 2350/05/12. In the future this needs to be changed to read a field from the RTDB and update accordingly as the DM updates it.
## News

The news 'app' gets news articles from a Firebase Firestore collection called 'news'.

A document in news has the fields:

```
agency: String
body: String
date: Timestamp
headline: String
```


## Chat

The chat 'app' allows the user to select a contact and see all messages between them and the contact

Each chat (from sender A to receiver B) will get a node in RTDB. This node will hold the last time a message was sent/received by either person.

Each chat will also get a collection of documents in Firestore. These will be the users messages back and forth.


When the user first opens a chat check if a RTDB node has a timestamp for it. If no node exists, do nothing as there are no messages to fetch.

If the user sends a message, create a RTDB node and add the current timestamp and create a collection in the FS with that first message document.

Now if the user opens a chat and there is a preexisting RTDB node, retrieve all documents from the corresponding a-b FS collection. While the user is in the chat, listen to RTDB timestamp and if it updates get all documents from the last timestamp to now.

A would be nice QOL improvement would be estimated response time based on light delay and the targets location.


## Shop

The shop will use the Firebase Firestore as well and will show the user a list of available items to buy.

Currently the schema for the DB is unknown, but will probably include: name, price, qualities, and tags.

A Firebase Function probably will need to be setup to randomly pick items from a list, set their price, and other attributes. The shop will randomly generate every in game day. (so whenever the offset field is updated).

There will be two modes: standard and black market

black market will be higher priced, but illegal objects. If a player buys on the black market there is a chance (higher based on rarity and danger), that the transaction was flagged and they will have a run in with authorities at their next stop.

With either store, there is always the option of being scammed and not getting the item they paid for. It is an unfortunate reality of the system.

## Games (Dice rolling)

There will also be a game 'app' that includes a global log of dice rolls.

It will allow the user to roll 3d6 with bonus die and add or subtract modifiers.

## Banking

With Ceres now under OPA control, and the introduction of New Yen there are now 3 major currencies used.

UN Dollar (UN$), Martian Dollar (MCR\$), and New Yen¥

While UN Dollar and Martian Dollar are fairly stable exchange rates, the New Yen fluctuates and changes rapidly.

The Banking 'app' will allow players to view their current amounts of all 3 major scrips. It will also allow them to exchange between the 3 for their current exchange rate and minor fees.

| Names: | Value: |
| ---- | ---- |
| UN Dollar | 1 |
| Martian Dollar | 1.05 |
| New Yin | 300 |
