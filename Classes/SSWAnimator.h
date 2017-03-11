//
//  SSWAnimator.h
//
//  Created by Arkadiusz Holko http://holko.pl on 29-05-14.
//

#import <UIKit/UIKit.h>

// Undocumented animation curve used for the navigation controller's transition.
FOUNDATION_EXPORT UIViewAnimationOptions const SSWNavigationTransitionCurve;

@class SSWAnimator;

@protocol SSWAnimatorDelegate <NSObject>

@required
- (BOOL)animatorShouldAnimateTabBar:(SSWAnimator *)animator;
- (CGFloat)animatorTransitionDimAmount:(SSWAnimator *)animator;

@end

@interface SSWAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id<SSWAnimatorDelegate> delegate;

@end
