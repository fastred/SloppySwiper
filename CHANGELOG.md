# SloppySwiper CHANGELOG

## 0.6

Adds `SloppySwiperDelegate` to fix issues with tab bars.

## 0.5

Adds support for 3D Touch.

## 0.4.1

Fixes a weird "locking" of the whole view when swiping on the right of the root view controller. This especially happend if this view contained a (subclass of) UIScrollView.

## 0.4.0

Fixes incorrect animation when hidesBottomBarWhenPushed is used.

## 0.2.0

Adds a specialized pan gesture recognizer that fails if the panning started in the wrong direction. It minimizes collisions between it and other gesture recognizers.

## 0.1.3

* Uses the animation curve the same as in the default animation
* Limits `maximumNumberOfTouches` to 1

## 0.1.2

Add fading of the left-side shadow during animation.

## 0.1.1

Bug fixes.

## 0.1.0

Initial release.
