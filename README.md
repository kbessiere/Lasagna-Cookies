#Lasagna-Cookies

Lasagna Cookies is a set of UI element inspired by [Jeffrey Jorgensen] (http://dribbble.com/shots/769112--F57a59-User-Interface-Download?list=searches&tag=ios_form)

It's really easy to use even if you're a beginner in Objective-C.

It has beautiful graphics for retina display.

![Imgur](http://i.imgur.com/DRunP2e.png?1)


##Installation

###From [CocoaPods](http://cocoapods.org/)

```
pod `Lasagna-Cookies`
```
###From source
Start by drag and drop the folder classes.


##Usage


Use it with Interface Builder :

Create an Button in Interface Builder and change the class to LCButton :

![Imgur](http://i.imgur.com/7ILyoI5.png)

You can set the target and selector with Interface Builder just like you do with an UIButton.

You can change the color for one button with:

```
button.mainColor = [UIColor colorWithHexa:0x3CB5B5];
```

You can change default radius like this

```
button.layer.cornerRadius = 5;
```

You can change the theme by adding the following line to your Appdelegate
```
[LCManager setLCThemeColor:0x3CB5B5];
```

