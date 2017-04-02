//
//  SloppySwiper.h
//
//  Created by Arkadiusz Holko http://holko.pl on 29-05-14.
//

#import <UIKit/UIKit.h>

/**
 * `SloppySwiperDelegate` is a protocol for treaking the behavior of the
 * `SloppySwiper` object.
 */

@class SloppySwiper;

@protocol SloppySwiperDelegate <NSObject>

@optional
// Return NO when you don't want the TabBar to animate during swiping. (Default YES)
- (BOOL)sloppySwiperShouldAnimateTabBar:(SloppySwiper *)swiper;

// 0.0 means no dimming, 1.0 means pure black. Default is 0.1
- (CGFloat)sloppySwiperTransitionDimAmount:(SloppySwiper *)swiper;;

@end

/**
 *  `SloppySwiper` is a class conforming to `UINavigationControllerDelegate` protocol that allows pan back gesture to be started from anywhere on the screen (not only from the left edge).
 */
@interface SloppySwiper : NSObject <UINavigationControllerDelegate>

/// Gesture recognizer used to recognize swiping to the right.
@property (weak, readonly, nonatomic) UIPanGestureRecognizer *panRecognizer;

@property (nonatomic, weak) id<SloppySwiperDelegate> delegate;

/// Designated initializer if the class isn't used from the Interface Builder.
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
