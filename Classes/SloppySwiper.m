//
//  SloppySwiper.m
//
//  Created by Arkadiusz on 29-05-14.
//

#import "SloppySwiper.h"
#import "SSWAnimator.h"

@interface SloppySwiper()
@property (weak, readwrite, nonatomic) UIPanGestureRecognizer *panRecognizer;
@property (weak, nonatomic) IBOutlet UINavigationController *navigationController;
@property (strong, nonatomic) SSWAnimator *animator;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactionController;
/// A Boolean value that indicates whether the navigation controller is currently animating a push/pop operation.
@property (nonatomic) BOOL duringAnimation;
@end

@implementation SloppySwiper

#pragma mark - Lifecycle

- (void)dealloc
{
    [_panRecognizer removeTarget:self action:@selector(pan:)];
    [_navigationController.view removeGestureRecognizer:_panRecognizer];
}

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    NSCParameterAssert(!!navigationController);

    self = [super init];
    if (self) {
        _navigationController = navigationController;
        [self commonInit];
    }

    return self;
}

- (void)awakeFromNib
{
    [self commonInit];
}

- (void)commonInit
{
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    panRecognizer.maximumNumberOfTouches = 1;
    [_navigationController.view addGestureRecognizer:panRecognizer];
    _panRecognizer = panRecognizer;

    _animator = [[SSWAnimator alloc] init];
}

#pragma mark - UIPanGestureRecognizer

- (void)pan:(UIPanGestureRecognizer*)recognizer
{
    UIView *view = self.navigationController.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        if (self.navigationController.viewControllers.count > 1 && !self.duringAnimation) {
            self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
            self.interactionController.completionCurve = UIViewAnimationCurveEaseOut;

            [self.navigationController popViewControllerAnimated:YES];
        }
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];

        if (translation.x > 0.0f) { // ignore swipe-left
            CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
            [self.interactionController updateInteractiveTransition:d];
        } else {
            // Reset translation if it's negative.
            // It's done to fix the following case: user pans left, but then decides to pan right - if it's set to 0, then the gesture starts working immediately.
            [recognizer setTranslation:CGPointZero inView:view];
        }
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([recognizer velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
            // When the transition is cancelled, `navigationController:didShowViewController:animated:` isn't called, so we have to maintain `duringAnimation`'s state here too.
            self.duringAnimation = NO;
        }
        self.interactionController = nil;
    }
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return self.animator;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactionController;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (animated) {
        self.duringAnimation = YES;
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.duringAnimation = NO;
}

@end
