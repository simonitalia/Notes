# Application Name
Notes

# Objective 
The aim of this app is to create a List of notes, similar to Apple's Notes app.

# Demo
![Demo](Demo_07122019.gif)

# Course
Hacking with Swift

# Education supplier
This iOS app is developed as a "self challenge" project in the iBook tutorial "Hacking with Swift" which forms part of the "Hacking with Swift" tutorial series, authored by Paul Hudson. Self challenges are apps developed from scratch, solo and un-assisted. The requirements are provided by the instructor in text base, list form. Some helpful hints are sometimes provided.

# Project Type
Self challenge

# Topics / milestones
- Custom classes

- Codable

- UITableViewController

- NavigationController

- NotificationCenter

- Segues (including saveUnwind)

- Git / Github

# Project goals / instructions
Apple sets an extremely high standard for apps, and encourages us all to follow suit by releasing a vast collection of powerful, flexible APIs to work with.

Your challenge for this milestone is to use those API to imitate Apple as closely as you can: I’d like you to recreate the iOS Notes app. I suggest you follow the iPhone version, because it’s fairly simple: a navigation controller, a table view controller, and a detail view controller with a full-screen text view.

How much of the app you imitate is down to you, but I suggest you work through this list: </br>
1. Create a table view controller that lists notes. Place it inside a navigation controller. (Project 1)
2. Tapping on a note should slide in a detail view controller that contains a full-screen text view. (Project 16)
3. Notes should be loaded and saved using NSCoding. You can use UserDefaults if you want, or write to a file. (Project 12)
4. Add some toolbar items to the detail view controller – “delete” and “compose” seem like good choices. (Project 4)
5. Add an action button to the navigation bar in the detail view controller that shares the text using UIActivityViewController. (Project 3)

Once you’ve done those, try using Interface Builder to customize the UI – how close can you make it look like Notes?
Note: the official Apple Notes app supports rich text input and media; don’t worry about that, focus on plain text.
Go ahead and try now. Remember: don’t fret if it sounds hard – it’s supposed to stretch you.

</br> <strong> Additional hints: </strong> </br>
Here are some hints in case you hit a problem: </br>
• You could represent each note using a custom Note class if you wanted, but to begin with perhaps just make each note a string that gets stored in a notes array. </br>
• If you do intend to go down the custom class route for notes, make sure you conform to NSCoding and implement its two required methods – you might need to re-read project 12. </br>
• Make sure you use NotificationCenter to update the insets for your detail text view when the keyboard is shown or hidden. </br>
• Try changing the tintColor property in Interface Builder. This controls the color of icons in the navigation bar and toolbar, amongst other things.


# Stretch goals
Some features included are not part of the guided project, but are added as stretch goals. Stretch goals apply learned knowledge to accomplish and are completed unassisted. Stretch goals may either be suggested by the teaching instructor or self imposed. Strecth goals / features implemented (if any) will be listed here.

- Create Custom Note class (suggested)

- Add Save Button state, based on if user has entered any text in UITextView. Implemented using UITextViewDelegate protocol and its optional methods (self imposed)

- Pass data between ViewContollers via Segue (self imposed)

- NotificationCenter to update Keyboard insets when KB is shown/hidden (suggested)

- App icons (self-imposed)

- Source control with git (local) / github (remote) (self imposed)


# Completed
January, 2019

# Application Name
Shoot 'em up!

# Course
Hacking with Swift

# Education supplier
This iOS app is developed as a "self challenge" project in the iBook tutorial "Hacking with Swift" which forms part of the "Hacking with Swift" tutorial series, authored by Paul Hudson. Self challenges are apps developed from scratch, solo and un-assisted. The requirements are provided by the instructor in text base, list form. Some helpful hints are sometimes provided.

# Project Type
Self challenge

# Topics / milestones
- GamePlayKit

- SceneKit

- GameScene

- SKSpriteKitNode

- SKAction

- SKEmitterNode

- UIBezierPath

- CGPoint

- UIAlertController / UIAlertAction

- Notification / observer (with didSet)

- switch

- Git / Github

# Project goals / instructions

• Make your own app, starting from a blank canvas.</br>
• Your challenge is to make a shooting gallery game using SpriteKit: create three rows on the screen, then have targets slide across from one side to the other. </br>
• If the user taps a target, make it fade out and award them points.


How you implement this game really depends on what kind of shooting gallery games you’ve played in the past, but here are some suggestions to get you started:</br>
• Make some targets big and slow, and others small and fast. The small targets should be worth more points. </br>
• Add “bad” targets – things that cost the user points if they get shot accidentally. </br>


Make the top and bottom rows move left to right, but the middle row move right to left. </br>
• Add a timer that ticks down from 60 seconds. When it hits zero, show a Game Over
message. </br>
• Try going to https://openclipart.org/ to see what free artwork you can find.</br>
• Give the user six bullets per clip. Make them tap a different part of the screen to reload.</br>

</br> <strong> Additional hints: </strong> </br>
• Moving the targets in your shooting gallery is a perfect job for the follow() action. </br>
• Use a sequence so that targets move across the screen smoothly, then remove themselves when they are off screen.</br>
• You can create a timer using an SKLabelNode, a secondsRemaining integer, and a Timer that takes 1 away from secondsRemaining every 1 second.</br>
• Make sure you call invalidate() when the time runs out.</br>
• Use nodes(at:) to see what was tapped. If you don’t find a node named “Target” in the
returned array, you could subtract points for the player missing a shot.</br>
• You should be able to use a property observer for both player score and number of bullets 
remaining in clip. Changing the score or bullets would update the appropriate SKLabelNode on the screen.

# Stretch goals
Some features included are not part of the guided project, but are added as stretch goals. Stretch goals apply learned knowledge to accomplish and are completed unassisted. Stretch goals may either be suggested by the teaching instructor or self imposed. Strecth goals / features implemented (if any) will be listed here.

- Add Bonus (targetBonus) node to game scene using different images from standard (enemy) nodes which earn bonus points when sliced (suggested)

- Change SKLabel colors to inform user of actions to take (self imposed)

- Use images for when bullet is used, not used and full (self imposed)

- Add game sound effects triggered by user touches (self imposed)

- Add game background music (self imposed)

- Add Game Over image (scene node) when game ends (self imposed)

- Add Game Over Alert showing user game score and action button to Play again (self imposed)

- Enable user to Play again from Alert, when game ends (self imposed)

- App icons (self imposed)

- Source control with git (local) / github (remote) (self imposed)

# Completed
February, 2019

# Deployment information
- <strong>Deployment Target (iOS version): </strong>12.1 and higher
- <strong>Supported Devices: </strong>Universal
- <strong>Optimized for: </strong>iPhone
