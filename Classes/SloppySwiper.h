//
//  SloppySwiper.h
//
//  Created by Arkadiusz on 29-05-14.
//

#import <Foundation/Foundation.h>

@interface SloppySwiper : NSObject <UINavigationControllerDelegate>

/// Gesture recognizer used to recognize swiping to the right.
@property (weak, nonatomic) UIPanGestureRecognizer *panRecognizer;

/// Designated initializer if the class isn't used from the Interface Builder.
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
