# SloppySwiper

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/fastred/SloppySwiper/blob/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/SloppySwiper.svg?style=flat)](https://github.com/fastred/SloppySwiper)

`SloppySwiper` is a `UINavigationController` delegate that allows swipe back gesture to be started from anywhere on the screen (not only from the left edge).

### Note
* the library recreates the default pop animation, so it doesn't look exactly the same as when `interactivePopGestureRecognizer` is used:
  - cross dissolve animation is used in the navigation bar (instead of the back button movement)
  - the animation tends to be glitchy on the iOS Simulator, but it's fine on the device
  - [`hidesBottomBarWhenPushed` isn't animated properly](https://github.com/fastred/SloppySwiper/issues/2)
* the gesture can collide with other *pan to the right* gestures
* If you're having problems with a UINavigationController inside of
  a UITabBarController that is causing the UITabBar to pop out of view during the animation process,
  you'll want to implement the SloppySwiperDelegate protocol and return NO for calls to
  `-(BOOL)sloppySwiperShouldAnimateTabBar:(SloppySwiper *)swiper`.

![Demo GIF](https://raw.githubusercontent.com/fastred/SloppySwiper/master/demo.gif)

## Usage

`SloppySwiper` can be set either in the Interface Builder or in code. The IB usage is presented in the example project (see `Navigation Controller Scene` in `Main.storyboard`). You can set it up programmatically as follows:

```obj-c
#import "SloppySwiper.h"
...
@property (strong, nonatomic) SloppySwiper *swiper;
...
self.swiper = [[SloppySwiper alloc] initWithNavigationController:navigationController];
navigationController.delegate = self.swiper;
```

## Demo

To run the example project; clone the repo, and run `pod install` from the Example directory first. Alternatively, run ```pod try SloppySwiper``` from the command line.

## Requirements

* iOS 7
* ARC

## Installation

SloppySwiper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "SloppySwiper"

## Author

Arkadiusz Holko:

* [Blog](http://holko.pl/)
* [@arekholko on Twitter](https://twitter.com/arekholko)

## Credits

I'd like to thank:

* [@chriseidhof](https://github.com/chriseidhof) for writing [View Controller Transitions](http://www.objc.io/issue-5/view-controller-transitions.html), which parts of I've used in this library
* Joshua Ginter for writing [Sloppy Swiping](http://www.thenewsprint.co/2014/04/16/sloppy-swiping/)
