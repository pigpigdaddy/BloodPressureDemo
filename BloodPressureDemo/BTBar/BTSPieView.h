//
//  BTSPieView.h
//
//  Copyright (c) 2011 Brian Coyner. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BTSPieViewDataSource;
@protocol BTSPieViewDelegate;

typedef void (^AnimationNestBlock)(void);

@interface BTSPieView : UIView

@property (nonatomic, assign) id<BTSPieViewDataSource> dataSource;
@property (nonatomic, assign) id<BTSPieViewDelegate> delegate;

@property (nonatomic, assign) CGFloat animationDuration;

// simple hack to change selection behavior
@property (nonatomic, assign) BOOL highlightSelection;
-(void)insertSliceAtIndexSet:(NSMutableIndexSet*)indexSet animate:(BOOL)animate;
- (void)insertSliceAtIndex:(NSUInteger)index animate:(BOOL)animate;
- (void)removeSliceAtIndex:(NSUInteger)index animate:(BOOL)animate;
- (void)reloadSliceAtIndex:(NSUInteger)index animate:(BOOL)animate;
- (void)reloadData;

@end

@protocol BTSPieViewDataSource <NSObject>
@required
- (NSUInteger)numberOfSlicesInPieView:(BTSPieView *)pieView;
- (CGFloat)pieView:(BTSPieView *)pieView valueForSliceAtIndex:(NSUInteger)index;

@end 

@protocol BTSPieViewDelegate <NSObject>
@optional
- (void)pieView:(BTSPieView *)pieView willSelectSliceAtIndex:(NSInteger)index;
- (void)pieView:(BTSPieView *)pieView didSelectSliceAtIndex:(NSInteger)index CGPoint:(CGPoint)point;

- (void)pieView:(BTSPieView *)pieView willDeselectSliceAtIndex:(NSInteger)index;
- (void)pieView:(BTSPieView *)pieView didDeselectSliceAtIndex:(NSInteger)index;


- (UIColor *)pieView:(BTSPieView *)pieView colorForSliceAtIndex:(NSUInteger)index sliceCount:(NSUInteger)sliceCount;
- (NSString *)pieView:(BTSPieView *)pieView titleForSliceAtIndex:(NSUInteger)index;
@end