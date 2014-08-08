
#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

- (void) showMessage:(NSString*)message onView:(UIView*)view removeAfter:(NSTimeInterval)delay;
- (void) showMessage:(NSString*)message withTitle:(NSString*)title onView:(UIView*)view removeAfter:(NSTimeInterval)delay;
- (void)showHudOnView:(UIView*)onView;
- (void)removeHudFromView:(UIView*)onView;
- (void) showSpinnerOnView:(UIView*)view withOffset:(CGFloat)offset;
- (void) removeAllHuds:(UIView*)onView;
- (NSUInteger) hudCount:(UIView*)onView;

@end
