//
//  SloppySwiper.h
//
//  Created by Arkadiusz on 29-05-14.
//

#import <Foundation/Foundation.h>

@interface SloppySwiper : NSObject <UINavigationControllerDelegate>

// Designated initializer if the class isn't set in the Interface Builder.
- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
