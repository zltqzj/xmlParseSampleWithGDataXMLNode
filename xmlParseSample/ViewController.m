//
//  ViewController.m
//  xmlParseSample
//
//  Created by ZKR on 9/11/13.
//  Copyright (c) 2013 ZKR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)parseXML
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"StudentXML" ofType:@"xml"];
    NSData* data = [[NSData alloc] initWithContentsOfFile:path];
    GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    GDataXMLElement* root = [doc rootElement];//所有内容
    
    // 取标签中的内容方法:1，路径。2，childAtIndex
    //(1)路径
    NSArray* fistName = [root nodesForXPath:@"//student/name/fistName" error:nil];// 所t有标签为fistName的元素。
    NSLog(@"1:%@",[[fistName objectAtIndex:1] stringValue]);
    // (2)childAtIndex
    GDataXMLNode* lastName = [[[root childAtIndex:1] childAtIndex:0] childAtIndex:1];
    NSLog(@"2:%@",[lastName stringValue]);
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self parseXML];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
