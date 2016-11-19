//
//  Note.h
//  MyNotes
//
//  Created by 关东升 on 12-9-11.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//


#import <Foundation/Foundation.h>

@interface Note : NSObject

@property(nonatomic, strong) NSDate* date;
@property(nonatomic, strong) NSString* content;

-(instancetype)initWithDate:(NSDate*)date content:(NSString*)content;

-(instancetype)init;

@end