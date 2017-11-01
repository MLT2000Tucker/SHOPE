//
//  SHOPEPrintController.m
//  SHOPE
//
//  Created by Michael Tucker on 6/26/13.
//  Copyright (c) 2013 Insware Design Group. All rights reserved.
//

#import "SHOPEPrintController.h"
#import "Categories.h"

@interface SHOPEPrintController ()

@end

@implementation SHOPEPrintController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
-(IBAction)printdoc
{
//    
//    
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"jpg"];
//    NSData *myData = [NSData dataWithContentsOfFile: path];
//    
//    
//    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
//    
//    if(pic && [UIPrintInteractionController canPrintData: myData] )
//    {
//        
//        pic.delegate = self;
//        
//        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
//        printInfo.outputType = UIPrintInfoOutputGeneral;
//        printInfo.jobName = [path lastPathComponent];
//        printInfo.duplex = UIPrintInfoDuplexLongEdge;
//        pic.printInfo = printInfo;
//        pic.showsPageRange = YES;
//        pic.printingItem = myData;
//        
//        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error)
//        {
//            //self.content = nil;
//            if (!completed && error)
//            {
//                NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
//            } 
//        };
//        
//        [pic presentAnimated:YES completionHandler:completionHandler];
//        
//    }

//    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//    {
//        //[pic presentFromBarButtonItem:self.printButton animated:YES
//        //            completionHandler:completionHandler];
//    }
//    else
//    {
//       // [pic presentAnimated:YES completionHandler:completionHandler];
//    
//    }
}

@end