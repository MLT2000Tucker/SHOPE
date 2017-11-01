//
//  SHOPECalcController.m
//  SHOPE
//
//  Created by Michael Tucker on 5/15/13.
//  Copyright (c) 2013 Insware Design Group. All rights reserved.
//

#import "SHOPECalcController.h"
#import "Categories.h"

@interface SHOPECalcController ()

@end

@implementation SHOPECalcController

@synthesize frmPS;
@synthesize frmCName;
@synthesize frmJName;
@synthesize frmSt;
@synthesize frmCDOB;
@synthesize frmCAge;
@synthesize frmJDOB;
@synthesize frmJAge;
@synthesize frmCGender;
@synthesize frmJGender;
@synthesize frmCRetAge;
@synthesize frmJRetAge;
@synthesize frmIncLev, frmIncLevValue, medPartBPrem, medPartDPrem;
@synthesize frmCPTA;
@synthesize frmJPTA;
@synthesize frmCERMI;
@synthesize frmJERMI;
@synthesize frmCMedInfRate;
@synthesize frmCIncMediGapIns;
@synthesize frmJIncMediGapIns;
@synthesize mediGapPrem;
@synthesize frmCMediGapPremInfRate;
@synthesize frmJMediGapPremInfRate;
@synthesize frmCExtOOPAmt;
@synthesize frmCExtOOPInfRate;
@synthesize frmJExtOOPAmt;
@synthesize frmJExtOOPInfRate;
@synthesize frmCIncLTC;
@synthesize frmJIncLTC;
@synthesize frmCIncLTCIns;
@synthesize frmJIncLTCIns;
@synthesize frmCExpLTCPremInfRate;
@synthesize frmCExpLTCInfRate;
@synthesize frmJExpLTCPremInfRate;
@synthesize frmJExpLTCInfRate;
@synthesize frmCLTCPolAge;
@synthesize frmJLTCPolAge;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self)
//    {
//        // Establish and Initialize work variables
//    }
//    else
//    {
//        return self;
//    }
//}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    cliVerNo = 1;
    
    [self fnGetData];
    [self fnBuildArrays];
    [self fnGetTables];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) fnGetTables
{
//NSLog(@"fnGetTables - Begin");
    float rptctotalcost = 0.0;
    float rptjtotalcost = 0.0;
    rptCTitle.text = frmCName.text;
    rptJTitle.text = frmJName.text;
    rptCTitle.text = [self concatenateString:rptCTitle.text withString: @" - Out of Pocket Healthcare in Retirement (Starting at Age "];
    rptCTitle.text = [self concatenateString: rptCTitle.text withString: frmCRetAge.text];
    rptCTitle.text = [self concatenateString: rptCTitle.text withString: @")"];
    rptJTitle.text = [self concatenateString:rptJTitle.text withString: @" - Out of Pocket Healthcare in Retirement (Starting at Age "];
    rptJTitle.text = [self concatenateString: rptJTitle.text withString: frmJRetAge.text];
    rptJTitle.text = [self concatenateString: rptJTitle.text withString: @")"];
    rptCMedOptTitleC1.text = @"Medical Option";
    rptCMedOptTitleC2.text = @"Ages Covered";
    rptCMedOptTitleC3.text = @"Cost";
    rptJMedOptTitleC1.text = @"Medical Option";
    rptJMedOptTitleC2.text = @"Ages Covered";
    rptJMedOptTitleC3.text = @"Cost";
    rptCMedPartATitleC1.text = @"Enroll in Medicare Part A";
    rptCMedPartATitleC2.text = frmCRetAge.text;
    rptCMedPartATitleC3.text = @"$0.00";
    rptJMedPartATitleC1.text = @"Enroll in Medicare Part A";
    rptJMedPartATitleC2.text = frmJRetAge.text;
    rptJMedPartATitleC3.text = @"$0.00";
    rptCMedPartBDTitleC1.text = @"Pay for Medicare Part B and Medicare Part D";
    rptCMedPartBDTitleC2.text = frmCRetAge.text;
    rptJMedPartBDTitleC1.text = @"Pay for Medicare Part B and Medicare Part D";
    rptJMedPartBDTitleC2.text = frmJRetAge.text;
    rptCMediGapTitleC1.text = @"Pay for Medicare Supplement Policy";
    rptCMediGapTitleC2.text = frmCRetAge.text;
    rptJMediGapTitleC1.text = @"Pay for Medicare Supplement Policy";
    rptJMediGapTitleC2.text = frmJRetAge.text;
    rptCExtOOPAmtTitleC1.text = @"Save for Extra Out-of-Pocket Costs";
    rptCExtOOPAmtTitleC2.text = frmCRetAge.text;
    rptJExtOOPAmtTitleC1.text = @"Save for Extra Out-of-Pocket Costs";
    rptJExtOOPAmtTitleC2.text = frmJRetAge.text;
    
    cincltc = [frmCIncLTC.text integerValue];
    cincltcins = [frmCIncLTCIns.text integerValue];
    rptCLTCTitleC1.text = @"Long Term Care Not Included";
    rptCLTCTitleC2.text = frmCLTCPolAge.text;
    rptCLTCTitleC3.text = @"$0.0";
    
    
    jincltc = [frmJIncLTC.text integerValue];
    jincltcins = [frmJIncLTCIns.text integerValue];
    rptJLTCTitleC1.text = @"Long Term Care Not Included";
    rptJLTCTitleC2.text = frmJLTCPolAge.text;
    rptJLTCTitleC3.text = @"$0.0";
    
    if (cincltc == 1)
    {
        if (cincltcins == 1)
        {
            rptCLTCTitleC1.text = @"Long Term Care Premiums";
        }
        else
        {
            rptCLTCTitleC1.text = @"Estimated Long Term Care Expenses";
        }
    }
    
    if (jincltc == 1)
    {
        if (jincltcins == 1)
        {
            rptJLTCTitleC1.text = @"Long Term Care Premiums";
        }
        else
        {
            rptJLTCTitleC1.text = @"Estimated Long Term Care Expenses";
        }
    }
    
    cca = [frmCAge.text integerValue];
    cgc = [frmCGender.text integerValue];
    jca = [frmJAge.text integerValue];
    jgc = [frmJGender.text integerValue];
    
    cltcpolage = [frmCLTCPolAge.text integerValue];
    jltcpolage = [frmJLTCPolAge.text integerValue];
    
//NSLog(@"Begin Calculate and Display of MediCare Parts B & D");

    int cj = 1;
        
    // Calculate and Display MediCare Parts B & D
    ca = [frmCAge.text integerValue];
    ra = [frmCRetAge.text integerValue];
    pa = [frmCPTA.text integerValue];
    ir = [frmCMedInfRate.text floatValue];
    gc = cgc;
//NSLog(@"cgc: %d | gc: %d", cgc, gc);
    
    float rptcmedpartbd = [self fnCalcPartsBD :(int)ca :(int)ra :(int)pa :(float)ir : (int) cj];
    rptCMedPartBDTitleC3.text = [self fnFloatToCurrency: rptcmedpartbd];
        
    // Calculate and Display MediGap Insurance Premiums
    float rptcmedigapprems = 0.0;
    rptCMediGapTitleC3.text = [self fnFloatToCurrency: rptcmedigapprems];
//NSLog(@"frmCIncMediGapIns.text: %@", frmCIncMediGapIns.text);
    int incMediGap = [frmCIncMediGapIns.text integerValue];
    if (incMediGap == 1)
    {
        ir = [frmCMediGapPremInfRate.text floatValue];
        rptcmedigapprems = [self fnCalcMediGapPrems :(int)ca :(int)ra :(int)pa :(float)ir : (int) sc : (int) gc : (int) cj];
        rptCMediGapTitleC3.text = [self fnFloatToCurrency: rptcmedigapprems];
    }
        
    // Calculate and Display Extra Out-of-Poscket Cost
    float rptcexpoopamt = 0.0;
    rptCExtOOPAmtTitleC3.text = [self fnFloatToCurrency: rptcexpoopamt];
    cextoopamt = [self fnCurrencyToFloat: frmCExtOOPAmt.text];

    if (cextoopamt != 0)
    {
        ir = [frmCExtOOPInfRate.text floatValue];
        rptcexpoopamt = [self fnCalcExtOOPAmtPrems :(int)ca :(int)ra :(int)pa :(float)ir : (int) sc : (int) gc : (int) cj];
        rptCExtOOPAmtTitleC3.text = [self fnFloatToCurrency: rptcexpoopamt];
    }
    
    // Calculate and Display LTC Ins
    
    float rptcltccost = 0.0;
    
    if (cincltc == 1)
    {
        if (cincltcins == 1)
        {
            int wltcpa = [frmCLTCPolAge.text integerValue];
            rptCLTCTitleC3.text = [self fnFloatToCurrency: 0.00];
            ir = [frmCExpLTCPremInfRate.text floatValue];
            rptcltccost = [self fnCalcLTCPrems :(int)ca :(int)wltcpa :(int)pa :(float)ir : (int) sc : (int) gc : (int) cj];
        //NSLog(@"rptcltccost: %f", rptcltccost);
            rptCLTCTitleC3.text = [self fnFloatToCurrency: rptcltccost];
        }
        else
        {
            rptCLTCTitleC3.text = [self fnFloatToCurrency: 0.00];
            ir = [frmCExpLTCInfRate.text floatValue];
            rptcltccost = [self fnCalcNoLTC :(int)ca :(int)ra :(int)pa :(float)ir : (int) sc : (int) gc : (int) cj];
//NSLog(@"frmCExpLTCInfRate.text: %@", frmCExpLTCInfRate.text);
            rptCLTCTitleC3.text = [self fnFloatToCurrency: rptcltccost];
        }
    }
    
    rptCTotalTitleC1.text = @"Total Lifetime Cost";
    
    rptctotalcost = rptcmedpartbd + rptcmedigapprems + rptcexpoopamt + rptcltccost;
    rptCTotalTitleC3.text = [self fnFloatToCurrency: rptctotalcost];
    
//@@@@@@@@@@@@@@@@@
    
    
    
    // Calculate and Display MediCare Parts B & D
    ca = [frmJAge.text integerValue];
    ra = [frmJRetAge.text integerValue];
    pa = [frmJPTA.text integerValue];
    ir = [frmCMedInfRate.text floatValue];
    gc = jgc;
    cj = 2;
    
    float rptjmedpartbd = [self fnCalcPartsBD :(int)ca :(int)ra :(int)pa :(float)ir : (int) cj];
    rptJMedPartBDTitleC3.text = [self fnFloatToCurrency: rptjmedpartbd];
    
    // Calculate and Display MediGap Insurance Premiums
    float rptjmedigapprems = 0.0;
    rptJMediGapTitleC3.text = [self fnFloatToCurrency: rptjmedigapprems];
    incMediGap = [frmJIncMediGapIns.text integerValue];
//NSLog(@"frmJIncMediGapIns.text: %@", frmJIncMediGapIns.text);
    if (incMediGap == 1)
    {
        ir = [frmJMediGapPremInfRate.text floatValue];
//NSLog(@"frmJMediGapPremInfRate.text: %@ | ir: %f", frmJMediGapPremInfRate.text, ir);
        rptjmedigapprems = [self fnCalcMediGapPrems :(int)ca :(int)ra :(int)pa :(float)ir : (int) sc : (int) gc : (int) cj];
        rptJMediGapTitleC3.text = [self fnFloatToCurrency: rptjmedigapprems];
    }
    
    // Calculate and Display Extra Out-of-Poscket Cost
    float rptjexpoopamt = 0.0;
    rptJExtOOPAmtTitleC3.text = [self fnFloatToCurrency: rptjexpoopamt];
    jextoopamt = [self fnCurrencyToFloat: frmJExtOOPAmt.text];
    
    if (jextoopamt != 0)
    {
        ir = [frmJExtOOPInfRate.text floatValue];
        rptjexpoopamt = [self fnCalcExtOOPAmtPrems :(int)ca :(int)ra :(int)pa :(float)ir : (int) sc : (int) gc : (int) cj];
        rptJExtOOPAmtTitleC3.text = [self fnFloatToCurrency: rptjexpoopamt];
    }
    
    // Calculate and Display LTC Ins
    
    float rptjltccost = 0.0;
    
    if (jincltc == 1)
    {
        if (jincltcins == 1)
        {
            int wltcpa = [frmJLTCPolAge.text integerValue];
            rptJLTCTitleC3.text = [self fnFloatToCurrency: 0.00];
            ir = [frmJExpLTCPremInfRate.text floatValue];
            rptjltccost = [self fnCalcLTCPrems :(int)ca :(int)wltcpa :(int)pa :(float)ir : (int) sc : (int) gc : (int) cj];
//NSLog(@"rptjltccost: %f", rptjltccost);
            rptJLTCTitleC3.text = [self fnFloatToCurrency: rptjltccost];
        }
        else
        {
            rptJLTCTitleC3.text = [self fnFloatToCurrency: 0.00];
            ir = [frmJExpLTCInfRate.text floatValue];
            rptjltccost = [self fnCalcNoLTC :(int)ca :(int)ra :(int)pa :(float)ir : (int) sc : (int) gc : (int) cj];
//NSLog(@"frmCExpLTCInfRate.text: %@", frmCExpLTCInfRate.text);
            rptJLTCTitleC3.text = [self fnFloatToCurrency: rptjltccost];
        }
    }
    rptJTotalTitleC1.text = @"Total Lifetime Cost";
    rptjtotalcost = rptjmedpartbd + rptjmedigapprems + rptjexpoopamt + rptjltccost;
    rptJTotalTitleC3.text = [self fnFloatToCurrency: rptjtotalcost];
    
    rptJGrandTotalTitleC1.text = @"Grand Total Lifetime Cost (includes a 20% discount)";
    float rptjgrandtotaltitle = 0.0;
    rptjgrandtotaltitle = (rptctotalcost + rptjtotalcost) * .8;
    rptJGrandTotalTitleC3.text = [self fnFloatToCurrency: rptjgrandtotaltitle];
    
    if (single == 1)
    {
        [self fnHideJoint];
    }
    else
    {
        [self fnShowJoint];
    }
}

-(void) fnHideJoint
{
    rptJTitle.hidden = YES;
    rptJMedOptTitleC1.hidden = YES;
    rptJMedOptTitleC2.hidden = YES;
    rptJMedOptTitleC3.hidden = YES;
    rptJMedPartATitleC1.hidden = YES;
    rptJMedPartATitleC2.hidden = YES;
    rptJMedPartATitleC3.hidden = YES;
    rptJMedPartBDTitleC1.hidden = YES;
    rptJMedPartBDTitleC2.hidden = YES;
    rptJMedPartBDTitleC3.hidden = YES;
    rptJMediGapTitleC1.hidden = YES;
    rptJMediGapTitleC2.hidden = YES;
    rptJMediGapTitleC3.hidden = YES;
    rptJExtOOPAmtTitleC1.hidden = YES;
    rptJExtOOPAmtTitleC2.hidden = YES;
    rptJExtOOPAmtTitleC3.hidden = YES;
    rptJLTCTitleC1.hidden = YES;
    rptJLTCTitleC2.hidden = YES;
    rptJLTCTitleC3.hidden = YES;
    rptJTotalTitleC1.hidden = YES;
    rptJTotalTitleC2.hidden = YES;
    rptJTotalTitleC3.hidden = YES;
    rptJGrandTotalTitleC1.hidden = YES;
    rptJGrandTotalTitleC2.hidden = YES;
    rptJGrandTotalTitleC3.hidden = YES;
}
-(void) fnShowJoint
{
    rptJTitle.hidden = NO;
    rptJMedOptTitleC1.hidden = NO;
    rptJMedOptTitleC2.hidden = NO;
    rptJMedOptTitleC3.hidden = NO;
    rptJMedPartATitleC1.hidden = NO;
    rptJMedPartATitleC2.hidden = NO;
    rptJMedPartATitleC3.hidden = NO;
    rptJMedPartBDTitleC1.hidden = NO;
    rptJMedPartBDTitleC2.hidden = NO;
    rptJMedPartBDTitleC3.hidden = NO;
    rptJMediGapTitleC1.hidden = NO;
    rptJMediGapTitleC2.hidden = NO;
    rptJMediGapTitleC3.hidden = NO;
    rptJExtOOPAmtTitleC1.hidden = NO;
    rptJExtOOPAmtTitleC2.hidden = NO;
    rptJExtOOPAmtTitleC3.hidden = NO;
    rptJLTCTitleC1.hidden = NO;
    rptJLTCTitleC2.hidden = NO;
    rptJLTCTitleC3.hidden = NO;
    rptJTotalTitleC1.hidden = NO;
    rptJTotalTitleC2.hidden = NO;
    rptJTotalTitleC3.hidden = NO;
    rptJGrandTotalTitleC1.hidden = NO;
    rptJGrandTotalTitleC2.hidden = NO;
    rptJGrandTotalTitleC3.hidden = NO;
}

-(void) fnBuildArrays
{
    NSFileManager *filemgr;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    NSArray *workArray;
    filemgr = [NSFileManager defaultManager];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
//NSLog(@"Open States.text");
    
    dataFile = [docsDir stringByAppendingPathComponent: @"States.txt"];
    NSData *databuffer = [filemgr contentsAtPath: dataFile];
    NSString *wcsv;
    wcsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(@"statescsv: %@", wcsv);
    statesArray = [wcsv componentsSeparatedByString: @"\n"];
    
//NSLog(@"Dump States.text: %@", [statesArray description]);
//NSLog([statesArray description]);
    workArray = [[statesArray objectAtIndex: sc + 1]componentsSeparatedByString: @"~"];
    
    rptStateAbbrev.text = [workArray objectAtIndex: 1];
    rptStateName.text = [workArray objectAtIndex:2];
    
    dataFile = [docsDir stringByAppendingPathComponent: @"MedPartB.txt"];
    databuffer = [filemgr contentsAtPath: dataFile];
    NSString *medpartbcsv;
    medpartbcsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(@"medpartbcsv: %@", medpartbcsv);
    workArray = [medpartbcsv componentsSeparatedByString: @"\n"];
//NSLog(@"workArray: %@", [workArray description]);
    
    int incLev = 1 + [frmIncLev.text integerValue];
//NSLog(@"incLev: %d", incLev);
    medPartBArray = [[workArray objectAtIndex: incLev]componentsSeparatedByString: @"~"];
//NSLog(@"medPartBArray: %@", [medPartBArray description]);
    
    medPartBPrem.text = [medPartBArray objectAtIndex: 3];
    cmedpartbprems = [self fnCurrencyToFloat : medPartBPrem.text];
    jmedpartbprems = cmedpartbprems;
//NSLog(@"cmedpartbprems: %f", cmedpartbprems);
    
    frmIncLevValue.text = [medPartBArray objectAtIndex:4];
    
    if (single == 2)
    {
        frmIncLevValue.text = [medPartBArray objectAtIndex:5];
    }
//NSLog(@"Read MedPartD.txt");
    dataFile = [docsDir stringByAppendingPathComponent: @"MedPartD.txt"];
    databuffer = [filemgr contentsAtPath: dataFile];
    NSString *medpartdcsv;
    medpartdcsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(@"medpartdcsv: %@", medpartdcsv);
    workArray = [medpartdcsv componentsSeparatedByString: @"\n"];
//NSLog(@"[workArray description]");
    medPartDArray = [[workArray objectAtIndex: incLev]componentsSeparatedByString: @"~"];
    medPartDPrem.text = [medPartDArray objectAtIndex: 3];
    cmedpartdprems = [self fnCurrencyToFloat : medPartDPrem.text];
    jmedpartdprems = cmedpartdprems;
    
//NSLog(@"Read MediGapPremsII.txt");
    dataFile = [docsDir stringByAppendingPathComponent: @"MediGapPremsII.txt"];
    databuffer = [filemgr contentsAtPath: dataFile];
    
    NSString *medigappremscsv;
    medigappremscsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(@"medigappremscv: %@", medigappremscsv);
    mediGapPremsArray = [medigappremscsv componentsSeparatedByString: @"\n"];
    
    cmedigapprems = 0;
    
    for (int i = 0; i <= 30; i++)
    {
        workArray = [[mediGapPremsArray objectAtIndex: i]componentsSeparatedByString: @"~"];
        int a = [[workArray objectAtIndex: 0] integerValue];
//NSLog(@"sc: %d | cgc: %d | jgc: %d | gc: %d", sc, cgc, jgc, gc);
//NSLog([workArray description]);
        if (a == cra)
        {
            cmedigapprems = [self fnCurrencyToFloat : [workArray objectAtIndex: ((sc - 0) * 2) + cgc]];
            i = 30;
        }
    }
    
    jmedigapprems = 0;
    
    for (int i = 0; i <= 30; i++)
    {
        workArray = [[mediGapPremsArray objectAtIndex: i]componentsSeparatedByString: @"~"];
        int a = [[workArray objectAtIndex: 0] integerValue];
//NSLog([workArray description]);
        if (a == jra)
        {
            jmedigapprems = [self fnCurrencyToFloat : [workArray objectAtIndex: ((sc - 0) * 2) + jgc]];
            i = 30;
        }
    }
    
    cincltc = [frmCIncLTC.text integerValue];
    cincltcins = [frmCIncLTCIns.text integerValue];
    cltcpolage = [frmCLTCPolAge.text integerValue];
    cca = [frmCAge.text integerValue];
    cgc = [frmCGender.text integerValue];
    
    cltcprems = 0.0;
    cnoltcnhprems = 0;
    cnoltchcprems = 0;
    
    
//NSLog(@"fnBuildArrays - sc: %d", sc);
    if (cincltc == 1)
    {
        if (cincltcins == 2)
        {
//NSLog(@"fnBuildArrays - No LTC Insurance");
            dataFile = [docsDir stringByAppendingPathComponent: @"NoLTCStPrems.txt"];
            databuffer = [filemgr contentsAtPath: dataFile];
            NSString *noltcpremscsv;
            noltcpremscsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(noltcpremscsv);
            noLTCPremsArray = [noltcpremscsv componentsSeparatedByString: @"\n"];
            workArray = [[noLTCPremsArray objectAtIndex: sc]componentsSeparatedByString: @"~"];
            
            cnoltcnhprems = [self fnCurrencyToFloat : [workArray objectAtIndex: 2]];
            cnoltchcprems = [self fnCurrencyToFloat : [workArray objectAtIndex: 3]];
        }
        else
        {
            // Purchase LTC Insurance at age frmCLTCPolAge
            dataFile = [docsDir stringByAppendingPathComponent: @"LTCPrems.txt"];
            databuffer = [filemgr contentsAtPath: dataFile];
            NSString *wcsv;
            wcsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(wcsv);
            workArray = [wcsv componentsSeparatedByString: @"\n"];
//NSLog([workArray description]);
            NSArray *playArray;
            ltcStArray = [[NSMutableArray alloc] init];
            for (int i = 0; i < [workArray count]; i++)
            {
                wcsv = [workArray objectAtIndex: i];
                playArray = [wcsv componentsSeparatedByString: @"~"];
                if ([[playArray objectAtIndex: 0] isEqualToString: rptStateAbbrev.text])
                {
                    [ltcStArray addObject: wcsv];
                }
            }
            int wa = 0;
            float mll = 0;
            int mla = 0;
            float fll = 0;
            int fla = 0;
            float mul = 0;
            int mua = 0;
            float ful = 0;
            int fua = 0;
            int h = 0;
            float oneFifth = 0;
            float ll = 0;
            float ul = 0;
            int la = 0;
//NSLog([ltcStArray description]);
            for (int i = 0; i < [ltcStArray count]; i++)
            {
                playArray = [[ltcStArray objectAtIndex: i] componentsSeparatedByString: @"~"];
//NSLog([playArray description]);
//NSLog([playArray objectAtIndex: i]);
                wa = [[playArray objectAtIndex: 1] integerValue];
//NSLog(@"cca: %d | wa: %d", cca, wa);
                if (cca >= wa)
                {
                    h = 1;
                    if (cgc == 1)
                    {
                        mll = [[playArray objectAtIndex: 2] floatValue];
                        mla = wa;
//NSLog(@"mll: %f", mll);
                    }
                    else
                    {
                        fll = [[playArray objectAtIndex: 3] floatValue];
                        fla = wa;
//NSLog(@"fll: %f", fll);
                    }
                }
                if (cca <= wa && h == 1)
                {
                    h = 0;
                    if (cgc == 1)
                    {
                        mul = [[playArray objectAtIndex: 2] floatValue];
                        mua = wa;
//NSLog(@"mul: %f", mul);
                    }
                    else
                    {
                        ful = [[playArray objectAtIndex: 3] floatValue];
                        fua = wa;
//NSLog(@"ful: %f", ful);
                    }
                }
            }
//            NSLog(@"fnBuildArrays:");
//            NSLog(@"ca: %d | gc: %d | mll: %f | mla: %d | fll: %f | fla: %d", ca, gc, mll, mla, fll, fla);
//            NSLog(@"ca: %d | gc: %d | mul: %f | mua: %d | ful: %f | fua: %d", ca, gc, mul, mua, ful, fua);
            ll = mll + fll;
            ul = mul + ful;
            la = mla + fla;
            
            oneFifth = (ul - ll) / 5;
            cltcprems = ll + ((cca - la) * oneFifth);
        }
    }
//^^^^^^^^^^^^^^^^^^^^^^^
    
    jincltc = [frmJIncLTC.text integerValue];
    jincltcins = [frmJIncLTCIns.text integerValue];
    jltcpolage = [frmJLTCPolAge.text integerValue];
    jca = [frmJAge.text integerValue];
    jgc = [frmJGender.text integerValue];
    jltcprems = 0.0;
    jnoltcnhprems = 0;
    jnoltchcprems = 0;
    
    //NSLog(@"fnBuildArrays - jincltc: %d | jincltcins: %d | jltcprems: %f", jincltc, jincltcins, jltcprems);
    if (jincltc == 1)
    {
        if (jincltcins == 2)
        {
            // No LTC Insurance
            dataFile = [docsDir stringByAppendingPathComponent: @"NoLTCStPrems.txt"];
            databuffer = [filemgr contentsAtPath: dataFile];
            NSString *noltcpremscsv;
            noltcpremscsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(noltcpremscsv);
            noLTCPremsArray = [noltcpremscsv componentsSeparatedByString: @"\n"];
            workArray = [[noLTCPremsArray objectAtIndex: sc]componentsSeparatedByString: @"~"];
//NSLog([workArray description]);
            jnoltcnhprems = [self fnCurrencyToFloat : [workArray objectAtIndex: 2]];
            jnoltchcprems = [self fnCurrencyToFloat : [workArray objectAtIndex: 3]];
//NSLog(@"jnoltcnhprems: %f | jnoltchcprems: %f", jnoltcnhprems, jnoltchcprems);
        }
        else
        {
            // Purchase LTC Insurance at age frmJLTCPolAge
            dataFile = [docsDir stringByAppendingPathComponent: @"LTCPrems.txt"];
            databuffer = [filemgr contentsAtPath: dataFile];
            NSString *wcsv;
            wcsv = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
//NSLog(wcsv);
            workArray = [wcsv componentsSeparatedByString: @"\n"];
//NSLog([workArray description]);
            
            NSArray *playArray;
            ltcStArray = [[NSMutableArray alloc] init];
            for (int i = 0; i < [workArray count]; i++)
            {
                wcsv = [workArray objectAtIndex: i];
                playArray = [wcsv componentsSeparatedByString: @"~"];
                if ([[playArray objectAtIndex: 0] isEqualToString: rptStateAbbrev.text])
                {
                    [ltcStArray addObject: wcsv];
                }
            }
            //NSLog([ltcStArray description]);
            int wa = 0;
            float mll = 0;
            int mla = 0;
            float fll = 0;
            int fla = 0;
            float mul = 0;
            int mua = 0;
            float ful = 0;
            int fua = 0;
            int h = 0;
            float oneFifth = 0;
            float ll = 0;
            float ul = 0;
            int la = 0;
            
            for (int i = 0; i < [ltcStArray count]; i++)
            {
                playArray = [[ltcStArray objectAtIndex: i] componentsSeparatedByString: @"~"];
                //NSLog([playArray objectAtIndex: i]);
                wa = [[playArray objectAtIndex: 1] integerValue];

                //NSLog(@"jca: %d | wa: %d");
                if (jca >= wa)
                {
                    h = 1;
                    if (jgc == 1)
                    {
                        mll = [[playArray objectAtIndex: 2] floatValue];
                        mla = wa;
                        //NSLog(@"mll: %f", mll);
                    }
                    else
                    {
                        fll = [[playArray objectAtIndex: 3] floatValue];
                        fla = wa;
                        //NSLog(@"fll: %f", fll);
                    }
                }
                if (jca <= wa && h == 1)
                {
                    h = 0;
                    if (jgc == 1)
                    {
                        mul = [[playArray objectAtIndex: 2] floatValue];
                        mua = wa;
                        //NSLog(@"mul: %f", mul);
                    }
                    else
                    {
                        ful = [[playArray objectAtIndex: 3] floatValue];
                        fua = wa;
                        //NSLog(@"ful: %f", ful);
                    }
                }
            }
            //            NSLog(@"fnBuildArrays:");
            //            NSLog(@"ca: %d | gc: %d | mll: %f | mla: %d | fll: %f | fla: %d", ca, gc, mll, mla, fll, fla);
            //            NSLog(@"ca: %d | gc: %d | mul: %f | mua: %d | ful: %f | fua: %d", ca, gc, mul, mua, ful, fua);
            ll = mll + fll;
            ul = mul + ful;
            la = mla + fla;
            
            oneFifth = (ul - ll) / 5;
            jltcprems = ll + ((jca - la) * oneFifth);
            //            NSLog(@"ll: %f | ul: %f | oneFifth: %f | wa2: %d | la: %d | cltcprems: %f", ll, ul, oneFifth, wa2, la, cltcprems);
        }
    }
}

-(void)fnGetData
{
    NSFileManager *filemgr;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    filemgr = [NSFileManager defaultManager];
    // Identify the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the data file
    dataFile = [docsDir stringByAppendingPathComponent: @"shope.dat"];

    // Read file contents and display in textBox
    NSData *databuffer;
    databuffer = [filemgr contentsAtPath: dataFile];
        
    NSString *datastring = [[NSString alloc] initWithData: databuffer encoding:NSASCIIStringEncoding];
        
    [self fnParseDefaultData: datastring];

}
-(void)fnParseDefaultData:(NSString *)stringIn
{
    NSArray *myArray = [[NSArray alloc] initWithArray:[stringIn componentsSeparatedByString:@"~"]];
    //NSLog(@"myArray count: %d",[myArray count]);
    //NSLog([myArray description]);
    frmPS.text = [myArray objectAtIndex:0];
    single = [frmPS.text integerValue];
    frmCName.text = [myArray objectAtIndex:1];
    frmJName.text = [myArray objectAtIndex:2];
    frmSt.text = [myArray objectAtIndex:3];
    sc = [frmSt.text integerValue];
    frmCDOB.text = [myArray objectAtIndex:4];
    frmJDOB.text = [myArray objectAtIndex:5];
    frmCAge.text = [myArray objectAtIndex:6];
    cage = [frmCAge.text integerValue];
    frmJAge.text = [myArray objectAtIndex:7];
    jage = [frmJAge.text integerValue];
    frmCGender.text = [myArray objectAtIndex:8];
    cgc = [frmCGender.text integerValue];
    frmJGender.text = [myArray objectAtIndex:9];
    jgc = [frmJGender.text integerValue];
    frmCRetAge.text = [myArray objectAtIndex:10];
    cra = [frmCRetAge.text integerValue];
    frmJRetAge.text = [myArray objectAtIndex:11];
    jra = [frmJRetAge.text integerValue];
    frmIncLev.text = [myArray objectAtIndex:12];
    frmCPTA.text = [myArray objectAtIndex:13];
    frmJPTA.text = [myArray objectAtIndex:14];
    frmCERMI.text = [myArray objectAtIndex:15];
    frmJERMI.text = [myArray objectAtIndex:16];
    frmCMedInfRate.text = [myArray objectAtIndex:17];
    frmCIncMediGapIns.text = [myArray objectAtIndex:18];
    frmJIncMediGapIns.text = [myArray objectAtIndex:19];
    frmCMediGapPremInfRate.text = [myArray objectAtIndex:20];
    frmJMediGapPremInfRate.text = [myArray objectAtIndex:21];
    frmCExtOOPAmt.text = [myArray objectAtIndex:22];
    frmCExtOOPInfRate.text = [myArray objectAtIndex:23];
    frmJExtOOPAmt.text = [myArray objectAtIndex:24];
    frmJExtOOPInfRate.text = [myArray objectAtIndex:25];
    frmCIncLTC.text = [myArray objectAtIndex:26];
    frmJIncLTC.text = [myArray objectAtIndex:27];
    frmCIncLTCIns.text = [myArray objectAtIndex:28];
    frmJIncLTCIns.text = [myArray objectAtIndex:29];
    frmCExpLTCPremInfRate.text = [myArray objectAtIndex:30];
    frmJExpLTCPremInfRate.text = [myArray objectAtIndex:31];
    frmCExpLTCInfRate.text = [myArray objectAtIndex:32];
    frmJExpLTCInfRate.text = [myArray objectAtIndex:33];
    frmCLTCPolAge.text = [myArray objectAtIndex:34];
    frmJLTCPolAge.text = [myArray objectAtIndex:35];
    
    
//    NSLog(@"frmPS.text:                  %@", frmPS.text);
//    NSLog(@"frmCName.text:               %@", frmCName.text);
//    NSLog(@"frmJName.text:               %@", frmJName.text);
//    NSLog(@"frmSt.text:                  %@", frmSt.text);
//    NSLog(@"frmCDOB.text:                %@", frmCDOB.text);
//    NSLog(@"frmCAge.text:                %@", frmCAge.text);
//    NSLog(@"frmJDOB.text:                %@", frmJDOB.text);
//    NSLog(@"frmJAge.text:                %@", frmJAge.text);
//    NSLog(@"frmJGender.text:             %@", frmJGender.text);
//    NSLog(@"frmCRetAge.text:             %@", frmCRetAge.text);
//    NSLog(@"frmJRetAge.text:             %@", frmJRetAge.text);
//    NSLog(@"frmIncLev.text:              %@", frmIncLev.text);
//    NSLog(@"frmCPTA.text:                %@", frmCPTA.text);
//    NSLog(@"frmJPTA.text:                %@", frmJPTA.text);
//    NSLog(@"frmCERMI.text:               %@", frmCERMI.text);
//    NSLog(@"frmJERMI.text:               %@", frmJERMI.text);
//    NSLog(@"frmCMedInfRate.text:         %@", frmCMedInfRate.text);
//    NSLog(@"frmCIncMediGapIns.text:      %@", frmCIncMediGapIns);
//    NSLog(@"frmJIncMediGapIns.text:      %@", frmJIncMediGapIns.text);
//    NSLog(@"frmCMediGapPremInfRate.text: %@", frmCMediGapPremInfRate.text);
//    NSLog(@"frmJMediGapPremInfRate.text: %@", frmJMediGapPremInfRate.text);
//    NSLog(@"frmCExtOOPAmt.text:          %@", frmCExtOOPAmt.text);
//    NSLog(@"frmCExtOOPInfRate.text:      %@", frmCExtOOPInfRate.text);
//    NSLog(@"frmJExtOOPAmt.text:          %@", frmJExtOOPAmt.text);
//    NSLog(@"frmJExtOOPInfRate.text:      %@", frmJExtOOPInfRate.text);
//    NSLog(@"frmCIncLTC.text:             %@", frmCIncLTC.text);
//    NSLog(@"frmJIncLTC.text:             %@", frmJIncLTC.text);
//    NSLog(@"frmCIncLTCIns.text:          %@", frmCIncLTCIns.text);
//    NSLog(@"frmJIncLTCIns.text:          %@", frmJIncLTCIns.text);
//    NSLog(@"frmCExpLTCPremInfRate.text:  %@", frmCExpLTCPremInfRate.text);
//    NSLog(@"frmCExpLTCInfRate.text:      %@", frmCExpLTCInfRate.text);
//    NSLog(@"frmJExpLTCPremInfRate.text:  %@", frmJExpLTCPremInfRate.text);
//    NSLog(@"frmJExpLTCInfRate.text:      %@", frmJExpLTCInfRate.text);
//    NSLog(@"frmCLTCPolAge.text:          %@", frmCLTCPolAge.text);
//    NSLog(@"frmJLTCPolAge.text:          %@", frmJLTCPolAge.text);
    
    
}

- (NSString*) concatenateString:(NSString*)stringA withString:(NSString*)stringB
{
	NSString *finalString = [NSString stringWithFormat:@"%@%@", stringA , stringB];
    return finalString;
}
-(float) fnCurrencyToFloat : stringIn
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setLenient:YES];
    float number = [[formatter numberFromString: stringIn] floatValue];
    return number;
}


-(NSString*) fnFloatToCurrency :  (float) floatIn
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSString *formattedOutput = nil;
    // Format style as currency
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setMinimumFractionDigits:2];
    [formatter setDecimalSeparator:@"."];
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    formattedOutput = [formatter stringFromNumber:[[NSNumber alloc] initWithFloat:floatIn]];
    return formattedOutput;
}

-(float) fnCalcPartsBD :(int)wca :(int)wra :(int)wpa :(float)wir : (int) wcj
{
    //NSLog(@"wca: %d | wra: %d | wpa: %d | wir: %f", wca, wra, wpa, wir);
    float ans;
    ans = 0.0;
    float wprems;
    if (wcj == 1)
    {
        wprems = (cmedpartbprems + cmedpartdprems) * 12;
    }
    else
    {
        wprems = (jmedpartbprems + jmedpartdprems) * 12;
    }
    
    //NSLog(@"wprems: %f", wprems);
    
    if (wca == 0 || wpa == 0 || wprems == 0)
    {
        ans = 0.0;
    }
    else
    {
        ans = [self fnInflatePrem: (int) wca : MAX(wra, 65) : (int) wpa: (float) wprems : (float) wir];
    }
    
    return ans;
}
-(float) fnCalcMediGapPrems :(int)wca :(int)wra :(int)wpa :(float)wir : (int) wsc : (int) wgc : (int) wcj
{
            
    float ans = 0.0;
    float wprems = 0.0;
    if (wcj == 1)
    {
        wprems = cmedigapprems;
    }
    else
    {
        wprems = jmedigapprems;
    }
    
//NSLog(@"fnCalcMediGapPrems - wprems: %f", wprems);
            
    if (wca == 0 || wpa == 0 || wprems == 0)
    {
        ans = 0.0;
    }
    else
    {
//NSLog(@"fnCalcMediGapPrems - wca: %d | wra: %d | wpa: %d | wprems: %f | wir: %f",  wca, wra, wpa, wprems, wir);
        ans = [self fnInflatePrem: (int) wca : MAX(wra, 65) : (int) wpa: (float) wprems : (float) wir];
    }
            
    return ans;
}

-(float) fnCalcExtOOPAmtPrems :(int)wca :(int)wra :(int)wpa :(float)wir : (int) wsc : (int) wgc : (int) wcj
{
    
    float ans;
    float wprems;
    ans = 0.0;
    if (wcj == 1)
    {
        wprems = cextoopamt;
    }
    else
    {
        wprems = jextoopamt;
    }
    
    //NSLog(@"fnCalcExtOOPAmtPrems - wprems: %f", wprems);
    
    if (wca == 0 || wpa == 0 || wprems == 0)
    {
        ans = 0.0;
    }
    else
    {
        ans = [self fnInflatePrem: (int) wca : MAX(wra, 65) : (int) wpa: (float) wprems : (float) wir];
    }
    
    return ans;
}

-(float) fnCalcNoLTC :(int) wca :(int) wra :(int) wpa :(float) wir : (int) wsc : (int) wgc : (int) wcj
{
    
    float ans1 = 0.0;
    float ans2 = 0.0;
    float wpremsnh = 0.0;
    float wpremshc = 0.0;
    float wprems = 0.0;
    
    if (wcj == 1)
    {
        wpremsnh = cnoltcnhprems;
        wpremshc = cnoltchcprems;
    }
    else
    {
        wpremsnh = jnoltcnhprems;
        wpremshc = jnoltchcprems;
    }
    
    wprems = wpremsnh + wpremshc;
    
    if (wca == 0 || wpa == 0 || wprems == 0)
    {
        ans1 = 0.0;
        ans2 = 0.0;
    }
    else
    {
        ans1 = [self fnInflatePrem: (int) wca : (int) wpa - 2 : (int) wpa: (float) wpremsnh : (float) wir];
        
        ans2 = [self fnInflatePrem: (int) wca : (int) wpa - 3 : (int) wpa - 3 : (float) wpremshc : (float) wir];
        
        rptCNoLTCNHCost.text = [self fnFloatToCurrency: ans1];
        rptCNoLTCHCCost.text = [self fnFloatToCurrency: ans2];
    }
    
    return ans1 + ans2;
}

-(float) fnCalcLTCPrems :(int) wca :(int) wra :(int) wpa :(float) wir : (int) wsc : (int) wgc : (int) wcj
{
    float ans = 0.0;
    float wprems = 0.0;
    
    if (wcj == 1)
    {
        wprems = cltcprems;
    }
    else
    {
        wprems = jltcprems;
    }
    
    if (wca == 0 || wpa == 0 || wprems == 0)
    {
        ans = 0.0;
    }
    else
    {
        //NSLog(@"Here");
        //NSLog(@"fnInflatePrem - wca: %d | wra: %d | wpa: %d | wir: %f | wsc: %d | wgc: %d | wcj: %d | wprems: %f", wca, wra, wpa, wir, wsc, wgc, wcj, wprems);
        
        ans = [self fnInflatePrem: (int) wca : (int) wra : (int) wpa - 4 : (float) wprems : (float) wir];
        //NSLog(@"ans: %f", ans);
    }
    //NSLog(@"fnCalcLTCPrems - ans: %f", ans);
    return ans;
}


-(float) fnInflatePrem : (int) wca : (int) wra : (int) wpa : (float) wprems : (float) wir;
{
    //NSLog(@"fnInflatePrem - wca: %d | wra: %d | wpa: %d wprems: %f | wir: %f", wca, wra, wpa, wprems, wir);
    float wprem;
    float wip;
    wprem = 0;
    wip = 0;
    for (int wi = wca; wi <= wpa; wi++)
    {
        wip = wprems * pow((1 + (wir / 100)),(wi - wca));
        if (wi >= wra)
        {
            wprem = wprem + wip;
        }
    }
    //NSLog(@"fnInflatePrem: - wprem: %f", wprem);
    return wprem;
}

@end
