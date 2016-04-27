//
//  UIView+ZAnimation.m
//  AnimationGuideDemo
//
//  Created by admin on 16/1/28.
//  Copyright © 2016年 LZZ. All rights reserved.
//
#define kBadgeBreatheAniKey     @"breathe"
#define kBadgeRotateAniKey      @"rotate"
#define kBadgeShakeAniKey       @"shake"
#define kBadgeScaleAniKey       @"scale"
#define kBadgeBounceAniKey      @"bounce"
#define kBadgeFloatAniKey       @"float"
static char AniTypeKey;
static char AniDurKey;
static char IsAnimationKey;

#import "UIView+ZAnimation.h"
#import <objc/runtime.h>


@implementation UIView (ZAnimation)
-(void)beginAnimationWithType:(WBadgeAnimType)type andAniDuration:(CGFloat)aniDuration delay:(CGFloat)aDelayTime{
  
   
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(aDelayTime * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        self.aniDuration=aniDuration;
        self.alpha=1;
        self.aniType = type;
        
    });

   
}
- (void)beginAnimation
{  self.isAnimation=YES;
    switch(self.aniType) {
        case WBadgeAnimTypeBreathe:
            [self.layer addAnimation:[CAAnimation opacityForever_Animation:self.aniDuration]
                                    forKey:kBadgeBreatheAniKey];
            break;
        case WBadgeAnimTypeShake:
            [self.layer addAnimation:[CAAnimation shake_AnimationRepeatTimes:CGFLOAT_MAX
                                                                          durTimes:self.aniDuration
                                                                            forObj:self.layer]
                                    forKey:kBadgeShakeAniKey];
            break;
        case WBadgeAnimTypeScale:
            [self.layer addAnimation:[CAAnimation scaleFrom:1.4
                                                          toScale:0.6
                                                         durTimes:self.aniDuration
                                                              rep:MAXFLOAT]
                                    forKey:kBadgeScaleAniKey];
            break;
        case WBadgeAnimTypeBounce:
            [self.layer addAnimation:[CAAnimation bounce_AnimationRepeatTimes:CGFLOAT_MAX
                                                                           durTimes:self.aniDuration
                                                                             forObj:self.layer]
                                    forKey:kBadgeBounceAniKey];
            break;
        case WBadgeAnimTypeRotation:
            [self.layer addAnimation:[CAAnimation rotation:self.aniDuration degree:30 direction:WAxisX repeatCount:CGFLOAT_MAX]
                              forKey:kBadgeRotateAniKey];
            break;
            
        case WBadgeAnimTypeFloat:
            [self.layer addAnimation:[CAAnimation float_AnimationRepeatTimes:CGFLOAT_MAX durTimes: self.aniDuration forObj:self.layer] forKey:kBadgeFloatAniKey];
        case WBadgeAnimTypeNone:
        default:
            break;
    }
}
#pragma mark POP
- (void)popOutsideWithDuration:(NSTimeInterval)duration  delayTime:(NSTimeInterval)delay largeScale:(CGFloat)aLargeScale smallScale:(CGFloat)aSmallScale withCompletionBlock:(void (^ __nullable)(BOOL finished))completionBolck{
    __weak typeof(self) weakSelf = self;
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(aLargeScale, aLargeScale);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(aSmallScale, aSmallScale);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:^(BOOL finished) {
        if (completionBolck) {
            completionBolck(finished);
        }
    }];
}

- (void)popInsideWithDuration:(NSTimeInterval)duration delayTime:(NSTimeInterval)delay withCompletionBlock:(void (^ __nullable)(BOOL finished))completionBolck{
    __weak typeof(self) weakSelf = self;
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 2.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/2.0 relativeDuration:1/2.0 animations: ^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:^(BOOL finished) {
        if (completionBolck) {
            completionBolck(finished);
        }
    }];
}
#pragma mark 从小变大
- (void)foldWithDuration:(NSTimeInterval)duration delayTime:(NSTimeInterval)delay withCompletionBlock:(void (^ __nullable)(BOOL finished))completionBolck{
    __weak typeof(self) weakSelf = self;
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations: ^{
        self.alpha=1;
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 100.0 animations: ^{
            typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(0, 0);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/100.0 relativeDuration:99/100.0 animations: ^{
            typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
        
    } completion:^(BOOL finished) {
        if (completionBolck) {
            completionBolck(finished);
        }
    }];
}
- (void)removeAnimation
{
    if (self) {
        [self.layer removeAllAnimations];
    }
}
-(CGFloat)aniDuration{
    id obj = objc_getAssociatedObject(self, &AniDurKey);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj floatValue];
    }
    return 0.1;
}
- (void)setAniDuration:(CGFloat)aniDur
{
    NSNumber *numObj = @(aniDur);
    objc_setAssociatedObject(self, &AniDurKey, numObj, OBJC_ASSOCIATION_RETAIN);
    
}
-(BOOL)isAnimation{
    id obj = objc_getAssociatedObject(self, &IsAnimationKey);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj boolValue];
    }
    return NO;
}
- (void)setIsAnimation:(BOOL)animation
{
    NSNumber *numObj = @(animation);
    objc_setAssociatedObject(self, &IsAnimationKey, numObj, OBJC_ASSOCIATION_RETAIN);
    
}

- (WBadgeAnimType)aniType
{
    id obj = objc_getAssociatedObject(self, &AniTypeKey);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj integerValue];
    }
    else
        return WBadgeAnimTypeNone;
}
- (void)setAniType:(WBadgeAnimType)aniType
{
    NSNumber *numObj = @(aniType);
    objc_setAssociatedObject(self, &AniTypeKey, numObj, OBJC_ASSOCIATION_RETAIN);
    if (self&&!self.isAnimation) {
        [self removeAnimation];
        [self beginAnimation];
    }
}
@end
