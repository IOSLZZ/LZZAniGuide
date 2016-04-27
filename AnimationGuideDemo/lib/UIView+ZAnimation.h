//
//  UIView+ZAnimation.h
//  AnimationGuideDemo
//
//  Created by admin on 16/1/28.
//  Copyright © 2016年 LZZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAAnimation+WAnimation.h"
@interface UIView (ZAnimation)
typedef NS_ENUM(NSUInteger, WBadgeAnimType)
{
    WBadgeAnimTypeNone = 0,         /* without animation, badge stays still */
    WBadgeAnimTypeScale,            /* scale effect */
    WBadgeAnimTypeShake,            /* shaking effect */
    WBadgeAnimTypeBounce,           /* bouncing effect */
    WBadgeAnimTypeBreathe,           /* breathing light effect, which makes  more attractive */
    WBadgeAnimTypeRotation,          /* Rotation effect */
    WBadgeAnimTypeFloat               /* Float effect */
};
- (void)removeAnimation;
-(void)beginAnimationWithType:(WBadgeAnimType)type andAniDuration:(CGFloat)aniDuration delay:(CGFloat)aDelayTime;
//Added
- (void)popOutsideWithDuration:(NSTimeInterval)duration  delayTime:(NSTimeInterval)delay largeScale:(CGFloat)aLargeScale smallScale:(CGFloat)aSmallScale withCompletionBlock:(void (^ __nullable)(BOOL finished))completionBolck;
- (void)popInsideWithDuration:(NSTimeInterval)duration delayTime:(NSTimeInterval)delay withCompletionBlock:(void (^ __nullable)(BOOL finished))completionBolck;
#pragma mark 从小变大
- (void)foldWithDuration:(NSTimeInterval)duration delayTime:(NSTimeInterval)delay withCompletionBlock:(void (^ __nullable)(BOOL finished))completionBolck;
@end
