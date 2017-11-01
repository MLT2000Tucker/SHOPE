//
//  SHOPECalcController.h
//  SHOPE
//
//  Created by Michael Tucker on 5/15/13.
//  Copyright (c) 2013 Insware Design Group. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface xyviewController : UIViewController <...,UIPrintInteractionControllerDelegate>
//{
//    
//    UIPrintInteractionControllerDelegate should be delegate
//}
//-(IBAction)printdoc;
@interface SHOPECalcController : UIViewController
{
    IBOutlet UITextField *frmPS;
    IBOutlet UITextField *frmCName;
    IBOutlet UITextField *frmJName;
    IBOutlet UITextField *frmSt;
    IBOutlet UITextField *frmCDOB;
    IBOutlet UITextField *frmCAge;
    IBOutlet UITextField *frmJDOB;
    IBOutlet UITextField *frmJAge;
    IBOutlet UITextField *frmCGender;
    IBOutlet UITextField *frmJGender;
    IBOutlet UITextField *frmCRetAge;
    IBOutlet UITextField *frmJRetAge;
    IBOutlet UITextField *frmIncLev;
    IBOutlet UITextField *frmCPTA;
    IBOutlet UITextField *frmJPTA;
    IBOutlet UITextField *frmCERMI;
    IBOutlet UITextField *frmJERMI;
    IBOutlet UITextField *frmCMedInfRate;
    IBOutlet UITextField *frmCIncMediGapIns;
    IBOutlet UITextField *frmJIncMediGapIns;
    IBOutlet UITextField *frmCMediGapPremInfRate;
    IBOutlet UITextField *frmJMediGapPremInfRate;
    IBOutlet UITextField *frmCExtOOPAmt;
    IBOutlet UITextField *frmCExtOOPInfRate;
    IBOutlet UITextField *frmJExtOOPAmt;
    IBOutlet UITextField *frmJExtOOPInfRate;
    IBOutlet UITextField *frmCIncLTC;
    IBOutlet UITextField *frmJIncLTC;
    IBOutlet UITextField *frmCIncLTCIns;
    IBOutlet UITextField *frmJIncLTCIns;
    IBOutlet UITextField *frmCExpLTCPremInfRate;
    IBOutlet UITextField *frmCExpLTCInfRate;
    IBOutlet UITextField *frmJExpLTCPremInfRate;
    IBOutlet UITextField *frmJExpLTCInfRate;
    IBOutlet UITextField *frmCLTCPolAge;
    IBOutlet UITextField *frmJLTCPolAge;
    
    int appVerNo;
    int cliVerNo;
    int single;
    int cage;
    int jage;
    int ca;
    int cca;
    int jca;
    int cra;
    int jra;
    int ra;
    int pa;
    int cgc;
    int jgc;
    int gc;
    float ir;
    int sc;
    int cincltc;
    int jincltc;
    int cincltcins;
    int jincltcins;
    float cmedpartbprems;
    float jmedpartbprems;
    float cmedpartdprems;
    float jmedpartdprems;
    float cmedigapprems;
    float jmedigapprems;
    float cextoopamt;
    float jextoopamt;
    float cextoopinfrate;
    float jextoopinfrate;
    float cnoltcnhprems;
    float jnoltcnhprems;
    float cnoltchcprems;
    float jnoltchcprems;
    float cltcprems;
    float jltcprems;
    int cltcpolage;
    int jltcpolage;
    

    NSArray *medPartBArray;
    NSArray *medPartDArray;
    NSArray *mediGapPremsArray;
    NSArray *noLTCPremsArray;
    NSArray *LTCPremsArray;
    NSArray *statesArray;
    NSMutableArray *ltcStArray;
    
    IBOutlet UITextField *frmIncLevValue;
    
    IBOutlet UITextField *medPartBPrem;
    IBOutlet UITextField *medPartDPrem;

    IBOutlet UITextField *rptCTitle;
    IBOutlet UITextField *rptCMedOptTitleC1;
    IBOutlet UITextField *rptCMedOptTitleC2;
    IBOutlet UITextField *rptCMedOptTitleC3;
    IBOutlet UITextField *rptCMedPartATitleC1;
    IBOutlet UITextField *rptCMedPartATitleC2;
    IBOutlet UITextField *rptCMedPartATitleC3;
    IBOutlet UITextField *rptCMedPartBDTitleC1;
    IBOutlet UITextField *rptCMedPartBDTitleC2;
    IBOutlet UITextField *rptCMedPartBDTitleC3;
    IBOutlet UITextField *rptCMediGapTitleC1;
    IBOutlet UITextField *rptCMediGapTitleC2;
    IBOutlet UITextField *rptCMediGapTitleC3;
    IBOutlet UITextField *rptCExtOOPAmtTitleC1;
    IBOutlet UITextField *rptCExtOOPAmtTitleC2;
    IBOutlet UITextField *rptCExtOOPAmtTitleC3;
    IBOutlet UITextField *rptCLTCTitleC1;
    IBOutlet UITextField *rptCLTCTitleC2;
    IBOutlet UITextField *rptCLTCTitleC3;
    IBOutlet UITextField *rptCTotalTitleC1;
    IBOutlet UITextField *rptCTotalTitleC2;
    IBOutlet UITextField *rptCTotalTitleC3;
    
    IBOutlet UITextField *rptCNoLTCNHCost;
    IBOutlet UITextField *rptCNoLTCHCCost;
    IBOutlet UITextField *rptStateAbbrev;
    IBOutlet UITextField *rptStateName;
    IBOutlet UITextField *rptCLTCCost;
    
    IBOutlet UITextField *rptJTitle;
    IBOutlet UITextField *rptJMedOptTitleC1;
    IBOutlet UITextField *rptJMedOptTitleC2;
    IBOutlet UITextField *rptJMedOptTitleC3;
    IBOutlet UITextField *rptJMedPartATitleC1;
    IBOutlet UITextField *rptJMedPartATitleC2;
    IBOutlet UITextField *rptJMedPartATitleC3;
    IBOutlet UITextField *rptJMedPartBDTitleC1;
    IBOutlet UITextField *rptJMedPartBDTitleC2;
    IBOutlet UITextField *rptJMedPartBDTitleC3;
    IBOutlet UITextField *rptJMediGapTitleC1;
    IBOutlet UITextField *rptJMediGapTitleC2;
    IBOutlet UITextField *rptJMediGapTitleC3;
    IBOutlet UITextField *rptJExtOOPAmtTitleC1;
    IBOutlet UITextField *rptJExtOOPAmtTitleC2;
    IBOutlet UITextField *rptJExtOOPAmtTitleC3;
    IBOutlet UITextField *rptJLTCTitleC1;
    IBOutlet UITextField *rptJLTCTitleC2;
    IBOutlet UITextField *rptJLTCTitleC3;
    IBOutlet UITextField *rptJTotalTitleC1;
    IBOutlet UITextField *rptJTotalTitleC2;
    IBOutlet UITextField *rptJTotalTitleC3;
    IBOutlet UITextField *rptJGrandTotalTitleC1;
    IBOutlet UITextField *rptJGrandTotalTitleC2;
    IBOutlet UITextField *rptJGrandTotalTitleC3;
    
    IBOutlet UITextField *rptJNoLTCNHCost;
    IBOutlet UITextField *rptJNoLTCHCCost;
    IBOutlet UITextField *rptJLTCCost;
    
    
}

@property (nonatomic, retain) IBOutlet UITextField *frmPS;
@property (nonatomic, retain) IBOutlet UITextField *frmCName;
@property (nonatomic, retain) IBOutlet UITextField *frmJName;
@property (nonatomic, retain) IBOutlet UITextField *frmSt;
@property (nonatomic, retain) IBOutlet UITextField *frmCDOB;
@property (nonatomic, retain) IBOutlet UITextField *frmCAge;
@property (nonatomic, retain) IBOutlet UITextField *frmJDOB;
@property (nonatomic, retain) IBOutlet UITextField *frmJAge;
@property (nonatomic, retain) IBOutlet UITextField *frmCGender;
@property (nonatomic, retain) IBOutlet UITextField *frmJGender;
@property (nonatomic, retain) IBOutlet UITextField *frmCRetAge;
@property (nonatomic, retain) IBOutlet UITextField *frmJRetAge;
@property (nonatomic, retain) IBOutlet UITextField *frmIncLev;
@property (nonatomic, retain) IBOutlet UITextField *frmCPTA;
@property (nonatomic, retain) IBOutlet UITextField *frmJPTA;
@property (nonatomic, retain) IBOutlet UITextField *frmCERMI;
@property (nonatomic, retain) IBOutlet UITextField *frmJERMI;
@property (nonatomic, retain) IBOutlet UITextField *frmCMedInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmCIncMediGapIns;
@property (nonatomic, retain) IBOutlet UITextField *frmJIncMediGapIns;
@property (nonatomic, retain) IBOutlet UITextField *frmCMediGapPremInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmJMediGapPremInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmCExtOOPAmt;
@property (nonatomic, retain) IBOutlet UITextField *frmCExtOOPInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmJExtOOPAmt;
@property (nonatomic, retain) IBOutlet UITextField *frmJExtOOPInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmCIncLTC;
@property (nonatomic, retain) IBOutlet UITextField *frmJIncLTC;
@property (nonatomic, retain) IBOutlet UITextField *frmCIncLTCIns;
@property (nonatomic, retain) IBOutlet UITextField *frmJIncLTCIns;
@property (nonatomic, retain) IBOutlet UITextField *frmCExpLTCPremInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmCExpLTCInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmJExpLTCPremInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmJExpLTCInfRate;
@property (nonatomic, retain) IBOutlet UITextField *frmCLTCPolAge;
@property (nonatomic, retain) IBOutlet UITextField *frmJLTCPolAge;

@property (nonatomic, retain) IBOutlet UITextField *frmIncLevValue;
@property (nonatomic, retain) IBOutlet UITextField *medPartBPrem;
@property (nonatomic, retain) IBOutlet UITextField *medPartDPrem;
@property (nonatomic, retain) IBOutlet UITextField *mediGapPrem;

@end
