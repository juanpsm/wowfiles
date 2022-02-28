HunterHelper - Notification Addon for Hunters
Written by KieferSkunk
Based on ViperNotify, by Angelnorn
----------------------------------

HunterHelper is a lightweight addon for WoW that helps hunters keep track of their battle aspects.
It gives you a notification when you're low on mana, another notification when your mana is full
and you have Aspect of the Viper turned on, and can also warn you when you enter combat without
a battle aspect (no aspect selected, or if you're still in Cheetah or Pack).  It otherwise sits
in the background, taking up no space in your UI.

To get started with HunterHelper, simply install the addon.  You can configure HunterHelper through
the Interface Options (Interface >> AddOns >> HunterHelper), or you can use a variety of console
commands.  Type /hh for a list of commands.

HunterHelper is based on the excellent ViperNotify addon, by Angelnorn, and contains a significant
portion of her code.  HunterHelper is published to Curse.com with her permission.


--------------------------
Frequently-Asked Questions:
--------------------------

Q: I installed HunterHelper, and now I'm getting duplicate warnings, or warnings more frequently
   than I specified in the options.  What's going on?

A: Do you also have ViperNotify installed?  If so, you should uninstall either HunterHelper or
   ViperNotify.  HunterHelper contains all of the functionality of ViperNotify, as well as some
   additional options, and will likely be expanded in the future, so I recommend that you use
   HunterHelper over ViperNotify.


Q: What do you mean by "No battle aspect selected"?

A: This is a new notification that lets you know when you've entered combat without a battle
   aspect selected.  This means that you either don't have any hunter aspect selected at all, or
   that your current aspect is "Aspect of the Cheetah" or "Aspect of the Pack", both of which are
   a hindrance to hunters and their parties while in combat.  To remedy this, select another aspect.

   Here are the aspects considered "Battle Aspects":

   * Aspect of the Hawk
   * Aspect of the Dragonhawk
   * Aspect of the Monkey
   * Aspect of the Wild
   * Aspect of the Beast
   * Aspect of the Viper


Q: My mana is at 100% and I'm in Aspect of the Viper, but I'm not getting a notification.  (Or,
   my mana is very low, but I'm not getting a notification.)  What's wrong?

A: Assuming that HunterHelper is installed correctly, this may be due to any of several things:

   * You are solo, and the "Disable When Solo" option is selected.
   * You are not in combat, and the option for "Only notify in combat" is selected.
   * You are mounted, and the option for "Disable when Mounted" is selected.
   * You have disabled Full (or Low) Mana warnings entirely.

   Check your options to find the settings that work best for you.


Q: I'd like to translate HunterHelper into another language!  How can I help?

A: Awesome!  Check out HunterHelper's CurseForge page at the following address:

   http://wow.curseforge.com/addons/hunterhelper/localization

   From there, you can click on the language you want to work with, and so long as you have a
   Curse or CurseForge account, you can just start translating. :)  I personally can read
   Spanish, and know just enough French and German to get the jist of translated phrases, but
   I know nothing about Korean, Chinese or Russian.  So I'm counting on your translations to
   be accurate, and credits are going into the .lua files as to who's translating stuff.  If
   you type in a bunch of garbage or obscenities, people will know who you are. ;)


Q: I found a bug or have a suggestion.  What's the best way to let you know about it?

A: Send me a message on Curse.com or open a ticket on CurseForge .  Be sure to include
   information on what you did, what your setup is, etc. when the bug occurred, so that I can
   track down the problem.  In some cases, HunterHelper may not work well with other addons -
   if you discover a problem with HunterHelper conflicting with another addon, let me know and
   I'll see what can be done to fix the problem.  HunterHelper should really stay out of the
   way of all other addons, since all it's really meant to do is to put messages on the screen
   and play sounds. :)


Q: What's the story with this addon vs. ViperNotify, anyway?

A: I've been using ViperNotify for a long time.  I think it's an excellent addon, and one that
   all hunters should at least consider using.  The biggest problem I see with most hunters I
   raid with is that many of them stay in Aspect of the Viper much longer than they really need
   to, and their DPS suffers as a result.  That's the whole reason ViperNotify was created - to
   keep that from happening.

   One problem I have personally on my hunter is that I'll forget to put myself back into a battle
   aspect after running back to my corpse.  I'll enter battle again and only realize that I was
   fighting without my power-increasing buff when I run out of mana and turn Viper on.  So I
   figured, it shouldn't be too difficult to detect that condition and get ViperNotify to tell me
   about it, right?  It was a good opportunity for me to learn how to write addons, too.

   I added this functionality in a couple of hours, but as it turns out, Blizzard's UI system
   isn't very flexible.  Adding the necessary options to ViperNotify to handle this new function
   turned out to be pretty difficult, and I ended up with UI elements outside of the options box.

   I noticed that most of the other addons I've used that have scrolling options boxes are using
   the Ace addon framework, so I took some time to rewrite the ViperNotify code to work with this
   framework.  That also enabled me to easily translate the addon to Spanish, since Ace provides
   a simple localization framework.  This eventually became a complete rewrite of the code, and I
   was eager to share it with the addon's author, Angelnorn.

   Angelnorn politely declined to incorporate the Battle Aspect feature into ViperNotify, but
   graciously gave me permission to publish it (including her ViperNotify functions) as my own
   independent addon.  I decided on the name "HunterHelper", to reflect its more general use as
   a hunter assistant, and since then, I've added numerous additional warnings to the addon to
   improve the hunter's situational awareness.

   Full credit goes to Angelnorn for getting me started.  I would strongly encourage you to drop
   her a line on Curse.com if you like the functionality - most of it is hers.  I just added to
   it. :)


Q: Do you plan to write similar "helper" addons for other classes?

A: There are already a number of other buff monitors and such for many different classes, but
   if a need arises for a simple notification addon like this, I'll definitely consider adapting
   it.  Who knows?  Perhaps you'll eventually see ShamanHelper, RogueHelper, MageHelper, etc.

   Kinda like "Hamburger Helper", isn't it? :)