//
//  HJTReadPageLastNode.m
//  LearnASDemo
//
//  Created by hejintao on 2017/7/4.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "HJTReadPageLastNode.h"
#import "HJTAsKitTool.h"

#define HJTFont(a)  [UIFont systemFontOfSize:(a)]

@interface HJTReadPageLastNode ()
//标题
@property (nonatomic,strong) ASTextNode *titleNode;
//图片
@property (nonatomic,strong) ASNetworkImageNode *goodImageNode;
//印花
@property (nonatomic,strong)ASImageNode *goodTypeTagNode;
//国旗
@property (nonatomic,strong)ASNetworkImageNode *nationalFlagNode;
//国家名
@property (nonatomic,strong)ASTextNode *nationalNameNode;
//特卖价格
@property (nonatomic,strong)ASTextNode *specialPriceNode;
//平时价格
@property (nonatomic,strong)ASTextNode *normalPriceNode;
//分享
@property (nonatomic,strong)ASButtonNode *shareButtonNode;
//底部工具条
@property (nonatomic,strong)ASImageNode *bottomToolBarNode;
//上架数目
@property (nonatomic,strong)ASTextNode *onLineCountNode;
//收益
@property (nonatomic,strong)ASTextNode *earningNode;

@end

@implementation HJTReadPageLastNode

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configData];
    }
    return self;
}

-(void)configData{
    [self addTitleNode:@"测试测试测试测试标题"];
    [self addMainGoodsImageNode:@"http://ww3.sinaimg.cn/large/7191b2ebgw1eyb1uontv4j21w02iou0r.jpg"];
    [self addSpecialPriceNode:@"特卖特卖特卖"];
    [self addNormalPriceNode:@"平时平时平时"];
    [self addShareButtonNode];
    [self addBottomToolBarNode];
    [self addOnLineCountNode:@"上架上架上架"];
    [self addEarningNode:@"收益收益收益"];
    [self addGoodsTypeTagNode:[UIImage imageNamed:@"home_cell_empty_icon.png"]];
    [self addNationalFlagNode:nil];
    [self addNationalNameNode:@"地区地区地区"];
}

#pragma mark -海淘商品
//商品类别标签(海淘/特卖)
- (void)addGoodsTypeTagNode:(UIImage *)image{
    
    ASImageNode *imageNode = [HJTAsKitTool nodeImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleToFill];
    imageNode.image = image;
    imageNode.style.layoutPosition = CGPointMake(0, 0);
    imageNode.style.preferredSize = CGSizeMake(30, 30);
    _goodTypeTagNode = imageNode;
    
}

//国旗
- (void)addNationalFlagNode:(NSString *)imageUrl{
    
    ASNetworkImageNode *networkImageNode = [HJTAsKitTool nodeNetworkImageNodeAddNode:self ClipsToBounds:YES ContentMode:UIViewContentModeScaleAspectFit DefaultImage:[UIImage imageNamed:@"home_china_flag.png"]];
    networkImageNode.style.preferredSize = CGSizeMake(24, 16);
    _nationalFlagNode = networkImageNode;
    
}

//国家文本
- (void)addNationalNameNode:(NSString *)text{
    
    NSAttributedString *attString = [HJTAsKitTool nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:HJTFont(14)];
    ASTextNode *textNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _nationalNameNode = textNode;
    
}


#pragma mark -普通商品
//商品图片
- (void)addMainGoodsImageNode:(NSString *)imageUrl{
    
    ASNetworkImageNode *networkImageNode = [HJTAsKitTool nodeNetworkImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleAspectFill DefaultImage:nil];
    networkImageNode.URL = [NSURL URLWithString:imageUrl];
    networkImageNode.style.preferredSize = CGSizeMake(100, 100);
    _goodImageNode = networkImageNode;
    
}

//标题
- (void)addTitleNode:(NSString *)text{
    
    NSAttributedString *attString = [HJTAsKitTool nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:HJTFont(16)];
    ASTextNode *textNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 2;
    textNode.style.flexShrink = YES;
    _titleNode = textNode;
    
}

//特卖价
- (void)addSpecialPriceNode:(NSString *)text{
    
    NSAttributedString *attString = [HJTAsKitTool nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:HJTFont(14)];
    ASTextNode *textNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _specialPriceNode = textNode;
    
}

//平时价
- (void)addNormalPriceNode:(NSString *)text{
    
    NSAttributedString *attString = [HJTAsKitTool nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:HJTFont(12)];
    ASTextNode *textNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _normalPriceNode = textNode;
    
}

//分享
- (void)addShareButtonNode{
    
    ASButtonNode *buttonNode = [ASButtonNode new];
    //buttonNode.backgroundColor = [UIColor orangeColor];
    [buttonNode setImage:[UIImage imageNamed:@"home_share_normal"] forState:UIControlStateNormal];
    [buttonNode setBackgroundImage:[UIImage imageNamed:@"home_share_button"] forState:UIControlStateNormal];
    buttonNode.imageAlignment = ASButtonNodeImageAlignmentBeginning;
    buttonNode.contentVerticalAlignment = ASVerticalAlignmentCenter;
    buttonNode.contentHorizontalAlignment = ASHorizontalAlignmentMiddle;
    [self addSubnode:buttonNode];
    buttonNode.style.preferredSize = CGSizeMake(43, 36);
    [buttonNode addTarget:self action:@selector(shareAction) forControlEvents:ASControlNodeEventTouchUpInside];
    _shareButtonNode = buttonNode;
    
}

-(void)shareAction{
    
}

//工具条
- (void)addBottomToolBarNode{
    
    ASImageNode *imageNode = [HJTAsKitTool nodeImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleToFill];
    imageNode.image = [UIImage imageNamed:@"home_cell_bottom_bg.png"];
    imageNode.style.height = ASDimensionMake(38);
    _bottomToolBarNode = imageNode;
    
}

//上架数目
- (void)addOnLineCountNode:(NSString *)text{
    
    NSAttributedString *attString = [HJTAsKitTool nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:HJTFont(14)];
    ASTextNode *textNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _onLineCountNode = textNode;
    
}

//收益
- (void)addEarningNode:(NSString *)text{
    
    NSAttributedString *attString = [HJTAsKitTool nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:HJTFont(14)];
    ASTextNode *textNode = [HJTAsKitTool nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _earningNode = textNode;
    
}


#pragma mark -- layout
-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    
    //国旗/国家名字  -- (水平约束)
    ASStackLayoutSpec *nationalStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                               spacing:5
                                                                        justifyContent:ASStackLayoutJustifyContentStart
                                                                            alignItems:ASStackLayoutAlignItemsCenter
                                                                              children:@[_nationalFlagNode, _nationalNameNode]];
    //特卖/平时---(水平约束)
    ASStackLayoutSpec *priceStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                            spacing:17
                                                                     justifyContent:ASStackLayoutJustifyContentStart
                                                                         alignItems:ASStackLayoutAlignItemsCenter
                                                                           children:@[_specialPriceNode, _normalPriceNode]];
    //商品内容---(竖直约束)
    ASStackLayoutSpec *contentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                                              spacing:5
                                                                       justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                           alignItems:ASStackLayoutAlignItemsStretch
                                                                             children:@[]];
    
    contentStack.style.flexShrink = YES;
    contentStack.children = @[nationalStack, _titleNode, priceStack];
    
    //商品图类型标签---(绝对约束)
    ASAbsoluteLayoutSpec *typeTagAbsolute = [ASAbsoluteLayoutSpec absoluteLayoutSpecWithSizing:ASAbsoluteLayoutSpecSizingDefault
                                                                                      children:@[_goodTypeTagNode, _goodImageNode]];
    
    
    //商品图---(水平约束)
    ASStackLayoutSpec *goodsImageContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                        spacing:10
                                                                                 justifyContent:ASStackLayoutJustifyContentStart
                                                                                     alignItems:ASStackLayoutAlignItemsStretch
                                                                                       children:@[typeTagAbsolute, contentStack]];
    
    goodsImageContentStack.style.flexShrink = YES;
    //商品分享---(水平约束)
    ASStackLayoutSpec *shareContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                   spacing:5
                                                                            justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                                alignItems:ASStackLayoutAlignItemsCenter
                                                                                  children:@[goodsImageContentStack, _shareButtonNode]];
#pragma mark -工具条约束
    
    //收益---(水平约束)
    ASStackLayoutSpec *bottomToolRightStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                      spacing:5
                                                                               justifyContent:ASStackLayoutJustifyContentEnd
                                                                                   alignItems:ASStackLayoutAlignItemsCenter
                                                                                     children:@[_earningNode]];
    bottomToolRightStack.style.flexGrow = YES;
    //工具条内容---(水平约束)
    ASStackLayoutSpec *bottomToolContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                        spacing:10
                                                                                 justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                                     alignItems:ASStackLayoutAlignItemsCenter
                                                                                       children:@[_onLineCountNode, bottomToolRightStack]];
    //工具条内容边框---(边框约束)
    ASInsetLayoutSpec *bottomToolContentInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 10, 0, 13)
                                                                                       child:bottomToolContentStack];
    //工具条---(边框约束)
    ASInsetLayoutSpec *bottomToolInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 10)
                                                                                child:_bottomToolBarNode];
    //工具条背景
    ASBackgroundLayoutSpec *bottomToolBackgroud = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:bottomToolInset
                                                                                             background:bottomToolContentInset];
#pragma mark -内容/工具条(整体约束)
    //整体内容---(竖直约束)
    ASStackLayoutSpec *allContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                                                 spacing:5
                                                                          justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                              alignItems:ASStackLayoutAlignItemsStretch
                                                                                children:@[shareContentStack, bottomToolBackgroud]];
    //整体边框---(边框约束)
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 0)
                                                  child:allContentStack];
}

@end
