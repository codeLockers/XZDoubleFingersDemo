//
//  XZDoubleFingersView.m
//  XZDoubleFingersDemo
//
//  Created by 徐章 on 16/5/27.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZDoubleFingersView.h"

@interface XZDoubleFingersView(){

    /** 手指一开始触碰的位置*/
    CGPoint _startPoint;
}

@end

@implementation XZDoubleFingersView

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(translate:)];
        [self addGestureRecognizer:panGesture];
        
        UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)];
        pinchGesture.delegate = self;
        [self addGestureRecognizer:pinchGesture];
        
        UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
        rotateGesture.delegate = self;
        [self addGestureRecognizer:rotateGesture];
    }
    return self;
}


- (void)translate:(UIPanGestureRecognizer *)gesture{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        _startPoint = [gesture translationInView:self.superview];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged){
        
        CGPoint point = [gesture translationInView:self.superview];
        CGPoint center = CGPointMake(self.center.x + point.x - _startPoint.x,
                                     self.center.y + point.y - _startPoint.y);
        
        self.center = center;
        _startPoint = point;
    }
}

- (void)scale:(UIPinchGestureRecognizer *)gesture{
    
    CGFloat scale = gesture.scale;
    self.transform = CGAffineTransformScale(self.transform, scale, scale);
    gesture.scale = 1;
}


- (void)rotate:(UIRotationGestureRecognizer *)gesture{
    
    CGFloat rotate = gesture.rotation;
    self.transform = CGAffineTransformRotate(self.transform, rotate);
    gesture.rotation = 0;
}

#pragma mark - UIGestureRecognizer_Delegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
