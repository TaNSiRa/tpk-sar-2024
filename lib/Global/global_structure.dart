import 'dart:convert';

List<ModelFullRequestData> modelFullRequestDataFromJson(String str) =>
    List<ModelFullRequestData>.from(
        json.decode(str).map((x) => ModelFullRequestData.fromJson(x)));

String modelFullRequestDataToJson(List<ModelFullRequestData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelFullRequestData {
  ModelFullRequestData({
    this.id = "",
    this.reqNo = "",
    this.jobType = "",
    this.branch = "",
    this.requestSection = "",
    this.reqDate = "",
    this.reqUser = "",
    this.custId = "",
    this.custFull = "",
    this.custShort = "",
    this.code = "",
    this.incharge = "",
    this.frequencyRequest = "",
    this.requestRound = "",
    this.requestRemark = "",
    this.requestAttachFile = "",
    this.requestStatus = "",
    this.sampleNo = "",
    this.sampleCode = "",
    this.sampleStatus = "",
    this.groupNameTs = "",
    this.sampleGroup = "",
    this.sampleType = "",
    this.sampleTank = "",
    this.sampleName = "",
    this.sampleAmount = "",
    this.samplingDate = "",
    this.sampleRemark = "",
    this.sampleAttachFile = "",
    this.itemNo = "",
    this.instrumentName = "",
    this.itemName = "",
    this.itemStatus = "",
    this.userSend = "",
    this.sendDate = "",
    this.remarkSend = "",
    this.userReject = "",
    this.rejectDate = "",
    this.remarkReject = "",
    this.userCancel = "",
    this.cancelDate = "",
    this.cancelRemark = "",
    this.userReceive = "",
    this.receiveDate = "",
    this.analysisDueDate = "",
    this.position = "",
    this.mag = "",
    this.temp = "",
    this.stdFactor = "",
    this.stdMax = "",
    this.stdSymbol = "",
    this.stdMin = "",
    this.userListAnalysis = "",
    this.listDate = "",
    this.remarkNo = "",
    this.resultSymbol1 = "",
    this.result1 = "",
    this.resultUnit1 = "",
    this.resultgL1 = "",
    this.resultgLUnit1 = "",
    this.resultRemark1 = "",
    this.resultFile1 = "",
    this.userAnalysis1 = "",
    this.analysisDate1 = "",
    this.resultSymbol2 = "",
    this.result2 = "",
    this.resultUnit2 = "",
    this.resultgL2 = "",
    this.resultgLUnit2 = "",
    this.resultRemark2 = "",
    this.resultFile2 = "",
    this.userAnalysis2 = "",
    this.analysisDate2 = "",
    this.resultSymbol3 = "",
    this.result3 = "",
    this.resultUnit3 = "",
    this.resultgL3 = "",
    this.resultgLUnit3 = "",
    this.resultRemark3 = "",
    this.resultFile3 = "",
    this.userAnalysis3 = "",
    this.analysisDate3 = "",
    this.resultSymbol4 = "",
    this.result4 = "",
    this.resultUnit4 = "",
    this.resultgL4 = "",
    this.resultgLUnit4 = "",
    this.resultRemark4 = "",
    this.resultFile4 = "",
    this.userAnalysis4 = "",
    this.analysisDate4 = "",
    this.resultSymbol5 = "",
    this.result5 = "",
    this.resultUnit5 = "",
    this.resultgL5 = "",
    this.resultgLUnit5 = "",
    this.resultRemark5 = "",
    this.resultFile5 = "",
    this.userAnalysis5 = "",
    this.analysisDate5 = "",
    this.resultSymbol6 = "",
    this.result6 = "",
    this.resultUnit6 = "",
    this.resultgL6 = "",
    this.resultgLUnit6 = "",
    this.resultRemark6 = "",
    this.resultFile6 = "",
    this.userAnalysis6 = "",
    this.analysisDate6 = "",
    this.userRequestRecheck = "",
    this.requestRecheckRemark = "",
    this.requestRecheckDate = "",
    this.userApprove = "",
    this.requestReconfirmRemark = "",
    this.requestReconfirmDate = "",
    this.resultApproveSymbol = "",
    this.resultApprove = "",
    this.resultApproveUnit = "",
    this.resultApproveRemark = "",
    this.resultApproveFile = "",
    this.resultApproveDate = "",
    this.finishCompleteDate = "",
    this.patternReport = "",
    this.createReportDate = "",
    this.subLeader = "",
    this.subLeaderTime = "",
    this.gL = "",
    this.gLTime = "",
    this.jP = "",
    this.jPTime = "",
    this.dGM = "",
    this.dGMTime = "",
    this.nextApprover = "",
    this.samplingDateFromManualInput = "",
    this.inputDataDate = "",
    this.reportCompleteDate = "",
    this.controlRange = "",
    this.itemReportName = "",
    this.processReportName = "",
    this.resultCompleteSymbol,
    this.resultComplete,
    this.resultCompleteUnit,
    this.resultCompleteFile,
    this.resultCompleteDate,
    this.reportOrder,
    this.selected = false,
    this.stdMinL,
    this.stdMaxL,
    this.std1,
    this.std2,
    this.std3,
    this.std4,
    this.std5,
    this.std6,
    this.std7,
    this.std8,
    this.std9,
    this.errorName,
    this.errorStatus,
    this.frequency,
    this.resultBuff,
    this.reviseNo,
    this.reportRejectRemark,
    this.reportRemark,
    this.acceptReconfirmdate,
    this.userAcceptReconfirm,
    this.sentRep,
    this.sentRepStatus,
    this.reason = '',
    this.stage = '',
    this.blank_1,
    this.blank_2,
    this.dilution1,
    this.dilution2,
    this.resultgLApprove,
    this.resultgLApproveUnit,
    this.factorC,
    this.repdays,
    this.bdprepare,
    this.bdttc,
    this.bdissue,
    this.bdsublead,
    this.bdgl,
    this.bdmgr,
    this.bdjp,
    this.bdrevise1,
    this.bdsublead1,
    this.bdgl1,
    this.bdmgr1,
    this.bdjp1,
    this.bdrevise2,
    this.bdsublead2,
    this.bdgl2,
    this.bdmgr2,
    this.bdjp2,
    this.bdrevise3,
    this.bdsublead3,
    this.bdgl3,
    this.bdmgr3,
    this.bdjp3,
    this.bdsent,
  });

  dynamic id;
  dynamic reqNo;
  dynamic jobType;
  dynamic branch;
  dynamic requestSection;
  dynamic reqDate;
  dynamic reqUser;
  dynamic custId;
  dynamic custFull;
  dynamic custShort;
  dynamic code;
  dynamic incharge;
  dynamic frequencyRequest;
  dynamic requestRound;
  dynamic requestRemark;
  dynamic requestAttachFile;
  dynamic requestStatus;
  dynamic sampleNo;
  dynamic sampleCode;
  dynamic sampleStatus;
  dynamic groupNameTs;
  dynamic sampleGroup;
  dynamic sampleType;
  dynamic sampleTank;
  dynamic sampleName;
  dynamic sampleAmount;
  dynamic samplingDate;
  dynamic sampleRemark;
  dynamic sampleAttachFile;
  dynamic itemNo;
  dynamic instrumentName;
  dynamic itemName;
  dynamic itemStatus;
  dynamic userSend;
  dynamic sendDate;
  dynamic remarkSend;
  dynamic userReject;
  dynamic rejectDate;
  dynamic remarkReject;
  dynamic userCancel;
  dynamic cancelDate;
  dynamic cancelRemark;
  dynamic userReceive;
  dynamic receiveDate;
  dynamic analysisDueDate;
  dynamic position;
  dynamic mag;
  dynamic temp;
  dynamic stdFactor;
  dynamic stdMax;
  dynamic stdSymbol;
  dynamic stdMin;
  dynamic userListAnalysis;
  dynamic listDate;
  dynamic remarkNo;
  dynamic resultSymbol1;
  dynamic result1;
  dynamic resultUnit1;
  dynamic resultgL1;
  dynamic resultgLUnit1;
  dynamic resultRemark1;
  dynamic resultFile1;
  dynamic userAnalysis1;
  dynamic analysisDate1;
  dynamic resultSymbol2;
  dynamic result2;
  dynamic resultUnit2;
  dynamic resultgL2;
  dynamic resultgLUnit2;
  dynamic resultRemark2;
  dynamic resultFile2;
  dynamic userAnalysis2;
  dynamic analysisDate2;
  dynamic resultSymbol3;
  dynamic result3;
  dynamic resultUnit3;
  dynamic resultgL3;
  dynamic resultgLUnit3;
  dynamic resultRemark3;
  dynamic resultFile3;
  dynamic userAnalysis3;
  dynamic analysisDate3;
  dynamic resultSymbol4;
  dynamic result4;
  dynamic resultUnit4;
  dynamic resultgL4;
  dynamic resultgLUnit4;
  dynamic resultRemark4;
  dynamic resultFile4;
  dynamic userAnalysis4;
  dynamic analysisDate4;
  dynamic resultSymbol5;
  dynamic result5;
  dynamic resultUnit5;
  dynamic resultgL5;
  dynamic resultgLUnit5;
  dynamic resultRemark5;
  dynamic resultFile5;
  dynamic userAnalysis5;
  dynamic analysisDate5;
  dynamic resultSymbol6;
  dynamic result6;
  dynamic resultUnit6;
  dynamic resultgL6;
  dynamic resultgLUnit6;
  dynamic resultRemark6;
  dynamic resultFile6;
  dynamic userAnalysis6;
  dynamic analysisDate6;
  dynamic userRequestRecheck;
  dynamic requestRecheckRemark;
  dynamic requestRecheckDate;
  dynamic requestReconfirmRemark;
  dynamic requestReconfirmDate;
  dynamic acceptReconfirmdate;
  dynamic userAcceptReconfirm;
  dynamic userApprove;
  dynamic resultApproveSymbol;
  dynamic resultApprove;
  dynamic resultApproveUnit;
  dynamic resultApproveRemark;
  dynamic resultApproveFile;
  dynamic resultApproveDate;
  dynamic finishCompleteDate;
  dynamic patternReport;
  dynamic resultCompleteSymbol;
  dynamic resultComplete;
  dynamic resultCompleteUnit;
  dynamic resultCompleteFile;
  dynamic resultCompleteDate;
  dynamic reportOrder;
  dynamic createReportDate;
  dynamic subLeader;
  dynamic subLeaderTime;
  dynamic gL;
  dynamic gLTime;
  dynamic jP;
  dynamic jPTime;
  dynamic dGM;
  dynamic dGMTime;
  dynamic nextApprover;
  dynamic samplingDateFromManualInput;
  dynamic inputDataDate;
  dynamic reportCompleteDate;
  dynamic selected;
  dynamic controlRange;
  dynamic itemReportName;
  dynamic processReportName;
  dynamic stdMinL;
  dynamic stdMaxL;
  dynamic std1;
  dynamic std2;
  dynamic std3;
  dynamic std4;
  dynamic std5;
  dynamic std6;
  dynamic std7;
  dynamic std8;
  dynamic std9;
  dynamic errorName;
  dynamic errorStatus;
  dynamic frequency;
  dynamic resultBuff;
  dynamic reviseNo;
  dynamic reportRejectRemark;
  dynamic reportRemark;
  dynamic sentRep;
  dynamic sentRepStatus;
  dynamic stage;
  dynamic reason;
  dynamic blank_1;
  dynamic blank_2;
  dynamic dilution1;
  dynamic dilution2;
  dynamic resultgLApprove;
  dynamic resultgLApproveUnit;
  dynamic factorC;
  dynamic repdays;
  dynamic bdprepare;
  dynamic bdttc;
  dynamic bdissue;
  dynamic bdsublead;
  dynamic bdgl;
  dynamic bdmgr;
  dynamic bdjp;
  dynamic bdrevise1;
  dynamic bdsublead1;
  dynamic bdgl1;
  dynamic bdmgr1;
  dynamic bdjp1;
  dynamic bdrevise2;
  dynamic bdsublead2;
  dynamic bdgl2;
  dynamic bdmgr2;
  dynamic bdjp2;
  dynamic bdrevise3;
  dynamic bdsublead3;
  dynamic bdgl3;
  dynamic bdmgr3;
  dynamic bdjp3;
  dynamic bdsent;
  List<MapEntry<String, String>> listdropdownreason = [];
  List<MapEntry<String, String>> listdropdownstage = [];

  factory ModelFullRequestData.fromJson(Map<String, dynamic> json) =>
      ModelFullRequestData(
        id: json["ID"] ?? "",
        reqNo: json["ReqNo"] ?? "",
        jobType: json["JobType"] ?? "",
        branch: json["Branch"] ?? "",
        requestSection: json["RequestSection"] ?? "",
        reqDate: json["ReqDate"] ?? "",
        reqUser: json["ReqUser"] ?? "",
        custId: json["CustId"] ?? "",
        custFull: json["CustFull"] ?? "",
        custShort: json["CustShort"] ?? "",
        code: json["Code"] ?? "",
        incharge: json["Incharge"] ?? "",
        frequencyRequest: json["FrequencyRequest"] ?? "",
        requestRound: json["RequestRound"] ?? "",
        requestRemark: json["RequestRemark"] ?? "",
        requestAttachFile: json["RequestAttachFile"] ?? "",
        requestStatus: json["RequestStatus"] ?? "",
        sampleNo: json["SampleNo"] ?? "",
        sampleCode: json["SampleCode"] ?? "",
        sampleStatus: json["SampleStatus"] ?? "",
        groupNameTs: json["GroupNameTS"] ?? "",
        sampleGroup: json["SampleGroup"] ?? "",
        sampleType: json["SampleType"] ?? "",
        sampleTank: json["SampleTank"] ?? "",
        sampleName: json["SampleName"] ?? "",
        sampleAmount: json["SampleAmount"] ?? "",
        samplingDate: json["SamplingDate"] ?? "",
        sampleRemark: json["SampleRemark"] ?? "",
        sampleAttachFile: json["SampleAttachFile"] ?? "",
        itemNo: json["ItemNo"] ?? "",
        instrumentName: json["InstrumentName"] ?? "",
        itemName: json["ItemName"] ?? "",
        itemStatus: json["ItemStatus"] ?? "",
        userSend: json["UserSend"] ?? "",
        sendDate: json["SendDate"] ?? "",
        remarkSend: json["RemarkSend"] ?? "",
        userReject: json["UserReject"] ?? "",
        rejectDate: json["RejectDate"] ?? "",
        remarkReject: json["RemarkReject"] ?? "",
        userCancel: json["UserCancel"] ?? "",
        cancelDate: json["CancelDate"] ?? "",
        cancelRemark: json["CancelRemark"] ?? "",
        userReceive: json["UserReceive"] ?? "",
        receiveDate: json["ReceiveDate"] ?? "",
        analysisDueDate: json["AnalysisDueDate"] ?? "",
        position: json["Position"] ?? "",
        mag: json["Mag"] ?? "",
        temp: json["Temp"] ?? "",
        stdFactor: json["StdFactor"] ?? "",
        stdMax: json["StdMax"] ?? "",
        stdMin: json["StdMin"] ?? "",
        stdSymbol: json["StdSymbol"] ?? "",
        userListAnalysis: json["UserListAnalysis"] ?? "",
        listDate: json["ListDate"] ?? "",
        remarkNo: json["RemarkNo"] ?? "",
        resultSymbol1: json["ResultSymbol1"] ?? "",
        result1: json["Result1"] ?? "",
        resultUnit1: json["ResultUnit1"] ?? "",
        resultgL1: json["ResultgL1"] ?? "",
        resultgLUnit1: json["ResultgLUnit1"] ?? "",
        resultRemark1: json["ResultRemark1"] ?? "",
        resultFile1: json["ResultFile1"] ?? "",
        userAnalysis1: json["UserAnalysis1"] ?? "",
        analysisDate1: json["AnalysisDate1"] ?? "",
        resultSymbol2: json["ResultSymbol2"] ?? "",
        result2: json["Result2"] ?? "",
        resultUnit2: json["ResultUnit2"] ?? "",
        resultgL2: json["ResultgL2"] ?? "",
        resultgLUnit2: json["ResultgLUnit2"] ?? "",
        resultRemark2: json["ResultRemark2"] ?? "",
        resultFile2: json["ResultFile2"] ?? "",
        userAnalysis2: json["UserAnalysis2"] ?? "",
        analysisDate2: json["AnalysisDate2"] ?? "",
        resultSymbol3: json["ResultSymbol3"] ?? "",
        result3: json["Result3"] ?? "",
        resultUnit3: json["ResultUnit3"] ?? "",
        resultgL3: json["ResultgL3"] ?? "",
        resultgLUnit3: json["ResultgLUnit3"] ?? "",
        resultRemark3: json["ResultRemark3"] ?? "",
        resultFile3: json["ResultFile3"] ?? "",
        userAnalysis3: json["UserAnalysis3"] ?? "",
        analysisDate3: json["AnalysisDate3"] ?? "",
        resultSymbol4: json["ResultSymbol4"] ?? "",
        result4: json["Result4"] ?? "",
        resultUnit4: json["ResultUnit4"] ?? "",
        resultgL4: json["ResultgL4"] ?? "",
        resultgLUnit4: json["ResultgLUnit4"] ?? "",
        resultRemark4: json["ResultRemark4"] ?? "",
        resultFile4: json["ResultFile4"] ?? "",
        userAnalysis4: json["UserAnalysis4"] ?? "",
        analysisDate4: json["AnalysisDate4"] ?? "",
        resultSymbol5: json["ResultSymbol5"] ?? "",
        result5: json["Result5"] ?? "",
        resultUnit5: json["ResultUnit5"] ?? "",
        resultgL5: json["ResultgL5"] ?? "",
        resultgLUnit5: json["ResultgLUnit5"] ?? "",
        resultRemark5: json["ResultRemark5"] ?? "",
        resultFile5: json["ResultFile5"] ?? "",
        userAnalysis5: json["UserAnalysis5"] ?? "",
        analysisDate5: json["AnalysisDate5"] ?? "",
        resultSymbol6: json["ResultSymbol6"] ?? "",
        result6: json["Result6"] ?? "",
        resultUnit6: json["ResultUnit6"] ?? "",
        resultgL6: json["ResultgL6"] ?? "",
        resultgLUnit6: json["ResultgLUnit6"] ?? "",
        resultRemark6: json["ResultRemark6"] ?? "",
        resultFile6: json["ResultFile6"] ?? "",
        userAnalysis6: json["UserAnalysis6"] ?? "",
        analysisDate6: json["AnalysisDate6"] ?? "",
        userRequestRecheck: json["UserRequestRecheck"] ?? "",
        requestRecheckRemark: json["RequestRecheckRemark"] ?? "",
        requestRecheckDate: json["RequestRecheckDate"] ?? "",
        userApprove: json["UserApprove"] ?? "",
        requestReconfirmRemark: json["RequestReconfirmRemark"] ?? "",
        requestReconfirmDate: json["RequestReconfirmDate"] ?? "",
        resultApproveSymbol: json["ResultApproveSymbol"] ?? "",
        resultApprove: json["ResultApprove"] ?? "",
        resultApproveUnit: json["ResultApproveUnit"] ?? "",
        resultApproveRemark: json["ResultApproveRemark"] ?? "",
        resultApproveFile: json["ResultApproveFile"] ?? "",
        resultApproveDate: json["ResultApproveDate"] ?? "",
        finishCompleteDate: json["FinishCompleteDate"] ?? "",
        patternReport: json["PatternReport"] ?? "",
        createReportDate: json["CreateReportDate"] ?? "",
        subLeader: json["SubLeader"] ?? "",
        subLeaderTime: json["SubLeaderTime"] ?? "",
        gL: json["GL"] ?? "",
        gLTime: json["GLTime"] ?? "",
        jP: json["JP"] ?? "",
        jPTime: json["JPTime"] ?? "",
        dGM: json["DGM"] ?? "",
        dGMTime: json["DGMTime"] ?? "",
        nextApprover: json["NextApprover"] ?? "",
        samplingDateFromManualInput: json["SamplingDateFromManualInput"] ?? "",
        reportCompleteDate: json["ReportCompleteDate"] ?? "",
        inputDataDate: json["InputDataDate"] ?? "",
        processReportName: json["ProcessReportName"] ?? "",
        controlRange: json["ControlRange"] ?? "",
        itemReportName: json["ItemReportName"] ?? "",
        resultCompleteSymbol: json["ResultCompleteSymbol"] ?? "",
        resultComplete: json["ResultComplete"] ?? "",
        resultCompleteUnit: json["ResultCompleteUnit"] ?? "",
        resultCompleteFile: json["ResultCompleteFile"] ?? "",
        resultCompleteDate: json["ResultCompleteDate"] ?? "",
        reportOrder: json["ReportOrder"] ?? "",
        stdMinL: json["StdMinL"] ?? "",
        stdMaxL: json["StdMaxL"] ?? "",
        std1: json["Std1"] ?? "",
        std2: json["Std2"] ?? "",
        std3: json["Std3"] ?? "",
        std4: json["Std4"] ?? "",
        std5: json["Std5"] ?? "",
        std6: json["Std6"] ?? "",
        std7: json["Std7"] ?? "",
        std8: json["Std8"] ?? "",
        std9: json["Std9"] ?? "",
        errorName: json["ErrorName"] ?? "",
        errorStatus: json["ErrorStatus"] ?? "",
        frequency: json["Frequency"] ?? "",
        reviseNo: json["ReviseNo"] ?? "",
        reportRejectRemark: json["ReportRejectRemark"] ?? "",
        reportRemark: json["ReportRemark"] ?? "",
        acceptReconfirmdate: json["AcceptReconfirmdate"] ?? "",
        userAcceptReconfirm: json["UserAcceptReconfirm"] ?? "",
        sentRep: json["SentRep"] ?? "",
        sentRepStatus: json["SentRepStatus"] ?? "NOT SENT YET",
        stage: json["Stage"] ?? "",
        reason: json["Reason"] ?? "",
        blank_1: json["Blank1"] ?? "",
        blank_2: json["Blank2"] ?? "",
        dilution1: json["Dilution1"] ?? "",
        dilution2: json["Dilution2"] ?? "",
        resultgLApprove: json["ResultgLApprove"] ?? "",
        resultgLApproveUnit: json["ResultgLApproveUnit"] ?? "",
        factorC: json["FactorC"] ?? "",
        repdays: json["RepDays"] ?? "",
        bdprepare: json["BDPrepare"] ?? "",
        bdttc: json["BDTTC"] ?? "",
        bdissue: json["BDIssue"] ?? "",
        bdsublead: json["BDSublead"] ?? "",
        bdgl: json["BDGL"] ?? "",
        bdmgr: json["BDMGR"] ?? "",
        bdjp: json["BDJP"] ?? "",
        bdrevise1: json["BDRevise1"] ?? "",
        bdsublead1: json["BDSublead1"] ?? "",
        bdgl1: json["BDGL1"] ?? "",
        bdmgr1: json["BDMGR1"] ?? "",
        bdjp1: json["BDJP1"] ?? "",
        bdrevise2: json["BDRevise2"] ?? "",
        bdsublead2: json["BDSublead2"] ?? "",
        bdgl2: json["BDGL2"] ?? "",
        bdmgr2: json["BDMGR2"] ?? "",
        bdjp2: json["BDJP2"] ?? "",
        bdrevise3: json["BDRevise3"] ?? "",
        bdsublead3: json["BDSublead3"] ?? "",
        bdgl3: json["BDGL3"] ?? "",
        bdmgr3: json["BDMGR3"] ?? "",
        bdjp3: json["BDJP3"] ?? "",
        bdsent: json["BDSent"] ?? "",
      );

  Map<dynamic, dynamic> toJson() => {
        "ID": id ?? "",
        "ReqNo": reqNo ?? "",
        "JobType": jobType ?? "",
        "Branch": branch ?? "",
        "RequestSection": requestSection ?? "",
        "ReqDate": reqDate ?? "",
        "ReqUser": reqUser ?? "",
        "CustId": custId ?? "",
        "CustFull": custFull ?? "",
        "CustShort": custShort ?? "",
        "Code": code ?? "",
        "Incharge": incharge ?? "",
        "FrequencyRequest": frequencyRequest ?? "",
        "RequestRound": requestRound ?? "",
        "RequestRemark": requestRemark ?? "",
        "RequestAttachFile": requestAttachFile ?? "",
        "RequestStatus": requestStatus ?? "",
        "SampleNo": sampleNo ?? "",
        "SampleCode": sampleCode ?? "",
        "SampleStatus": sampleStatus ?? "",
        "GroupNameTS": groupNameTs ?? "",
        "SampleGroup": sampleGroup ?? "",
        "SampleType": sampleType ?? "",
        "SampleTank": sampleTank ?? "",
        "SampleName": sampleName ?? "",
        "SampleAmount": sampleAmount ?? "",
        "SamplingDate": samplingDate.toString(),
        "SampleRemark": sampleRemark ?? "",
        "SampleAttachFile": sampleAttachFile ?? "",
        "ItemNo": itemNo ?? "",
        "InstrumentName": instrumentName ?? "",
        "ItemName": itemName ?? "",
        "ItemStatus": itemStatus ?? "",
        "UserSend": userSend ?? "",
        "SendDate": sendDate ?? "",
        "RemarkSend": remarkSend ?? "",
        "UserReject": userReject ?? "",
        "RejectDate": rejectDate ?? "",
        "RemarkReject": remarkReject ?? "",
        "UserCancel": userCancel ?? "",
        "CancelDate": cancelDate ?? "",
        "CancelRemark": cancelRemark ?? "",
        "UserReceive": userReceive ?? "",
        "ReceiveDate": receiveDate ?? "",
        "AnalysisDueDate": analysisDueDate ?? "",
        "Position": position ?? "",
        "Mag": mag ?? "",
        "Temp": temp ?? "",
        "StdFactor": stdFactor ?? "",
        "StdMax": stdMax ?? "",
        "StdSymbol": stdSymbol ?? "",
        "StdMin": stdMin ?? "",
        "UserListAnalysis": userListAnalysis ?? "",
        "ListDate": listDate ?? "",
        "RemarkNo": remarkNo ?? "",
        "ResultSymbol1": resultSymbol1 ?? "",
        "Result1": result1 ?? "",
        "ResultUnit1": resultUnit1 ?? "",
        "ResultgL1": resultgL1 ?? "",
        "ResultgLUnit1": resultgLUnit1 ?? "",
        "ResultRemark1": resultRemark1 ?? "",
        "ResultFile1": resultFile1 ?? "",
        "UserAnalysis1": userAnalysis1 ?? "",
        "AnalysisDate1": analysisDate1 ?? "",
        "ResultSymbol2": resultSymbol2 ?? "",
        "Result2": result2 ?? "",
        "ResultUnit2": resultUnit2 ?? "",
        "ResultgL2": resultgL2 ?? "",
        "ResultgLUnit2": resultgLUnit2 ?? "",
        "ResultRemark2": resultRemark2 ?? "",
        "ResultFile2": resultFile2 ?? "",
        "UserAnalysis2": userAnalysis2 ?? "",
        "AnalysisDate2": analysisDate2 ?? "",
        "ResultSymbol3": resultSymbol3 ?? "",
        "Result3": result3 ?? "",
        "ResultUnit3": resultUnit3 ?? "",
        "ResultgL3": resultgL3 ?? "",
        "ResultgLUnit3": resultgLUnit3 ?? "",
        "ResultRemark3": resultRemark3 ?? "",
        "ResultFile3": resultFile3 ?? "",
        "UserAnalysis3": userAnalysis3 ?? "",
        "AnalysisDate3": analysisDate3 ?? "",
        "ResultSymbol4": resultSymbol4 ?? "",
        "Result4": result4 ?? "",
        "ResultUnit4": resultUnit4 ?? "",
        "ResultgL4": resultgL4 ?? "",
        "ResultgLUnit4": resultgLUnit4 ?? "",
        "ResultRemark4": resultRemark4 ?? "",
        "ResultFile4": resultFile4 ?? "",
        "UserAnalysis4": userAnalysis4 ?? "",
        "AnalysisDate4": analysisDate4 ?? "",
        "ResultSymbol5": resultSymbol5 ?? "",
        "Result5": result5 ?? "",
        "ResultUnit5": resultUnit5 ?? "",
        "ResultgL5": resultgL5 ?? "",
        "ResultgLUnit5": resultgLUnit5 ?? "",
        "ResultRemark5": resultRemark5 ?? "",
        "ResultFile5": resultFile5 ?? "",
        "UserAnalysis5": userAnalysis5 ?? "",
        "AnalysisDate5": analysisDate5 ?? "",
        "ResultSymbol6": resultSymbol6 ?? "",
        "Result6": result6 ?? "",
        "ResultUnit6": resultUnit6 ?? "",
        "ResultgL6": resultgL6 ?? "",
        "ResultgLUnit6": resultgLUnit6 ?? "",
        "ResultRemark6": resultRemark6 ?? "",
        "ResultFile6": resultFile6 ?? "",
        "UserAnalysis6": userAnalysis6 ?? "",
        "AnalysisDate6": analysisDate6 ?? "",
        "UserRequestRecheck": userRequestRecheck ?? "",
        "RequestRecheckRemark": requestRecheckRemark ?? "",
        "RequestRecheckDate": requestRecheckDate ?? "",
        "UserApprove": userApprove ?? "",
        "RequestReconfirmRemark": requestReconfirmRemark ?? "",
        "RequestReconfirmDate": requestReconfirmDate ?? "",
        "ResultApproveSymbol": resultApproveSymbol ?? "",
        "ResultApprove": resultApprove ?? "",
        "ResultApproveUnit": resultApproveUnit ?? "",
        "ResultApproveRemark": resultApproveRemark ?? "",
        "ResultApproveFile": resultApproveFile ?? "",
        "ResultApproveDate": resultApproveDate ?? "",
        "FinishCompleteDate": finishCompleteDate ?? "",
        "CreateReportDate": createReportDate ?? "",
        "SubLeader": subLeader ?? "",
        "SubLeaderTime": subLeaderTime ?? "",
        "GL": gL ?? "",
        "GLTime": gLTime ?? "",
        "JP": jP ?? "",
        "JPTime": jPTime ?? "",
        "DGM": dGM ?? "",
        "DGMTime": dGMTime ?? "",
        "NextApprover": nextApprover ?? "",
        "SamplingDateFromManualInput": samplingDateFromManualInput ?? "",
        "ReportCompleteDate": reportCompleteDate ?? "",
        "InputDataDate": inputDataDate ?? "",
        "ProcessReportName": processReportName ?? "",
        "ControlRange": controlRange ?? "",
        "ItemReportName": itemReportName ?? "",
        "ResultCompleteSymbol": resultCompleteSymbol ?? "",
        "ResultComplete": resultComplete ?? "",
        "ResultCompleteUnit": resultCompleteUnit ?? "",
        "ResultCompleteFile": resultCompleteFile ?? "",
        "ResultCompleteDate": resultCompleteDate ?? "",
        "ReportOrder": reportOrder ?? "",
        "StdMinL": stdMinL ?? "",
        "StdMaxL": stdMaxL ?? "",
        "Std1": std1 ?? "",
        "Std2": std2 ?? "",
        "Std3": std3 ?? "",
        "Std4": std4 ?? "",
        "Std5": std5 ?? "",
        "Std6": std6 ?? "",
        "Std7": std7 ?? "",
        "Std8": std8 ?? "",
        "Std9": std9 ?? "",
        "ErrorName": errorName ?? "",
        "ErrorStatus": errorStatus ?? "",
        "Frequency": frequency ?? "",
        "ReviseNo": reviseNo ?? "",
        "ReportRejectRemark": reportRejectRemark ?? "",
        "ReportRemark": reportRemark ?? "",
        "AcceptReconfirmdate": acceptReconfirmdate ?? "",
        "UserAcceptReconfirm": userAcceptReconfirm ?? "",
        "SentRep": sentRep ?? "",
        "SentRepStatus": sentRepStatus ?? "NOT SENT YET",
        "Stage": stage ?? "",
        "Reason": reason ?? "",
        "Blank1": blank_1 ?? "",
        "Blank2": blank_2 ?? "",
        "Dilution1": dilution1 ?? "",
        "Dilution2": dilution2 ?? "",
        "ResultgLApprove": resultgLApprove ?? "",
        "ResultgLApproveUnit": resultgLApproveUnit ?? "",
        "FactorC": factorC ?? "",
        "RepDays": repdays ?? "",
        "BDPrepare": bdprepare ?? "",
        "BDTTC": bdttc ?? "",
        "BDIssue": bdissue ?? "",
        "BDSublead": bdsublead ?? "",
        "BDGL": bdgl ?? "",
        "BDJP": bdjp ?? "",
        "BDRevise1": bdrevise1 ?? "",
        "BDSublead1": bdsublead1 ?? "",
        "BDGL1": bdgl1 ?? "",
        "BDMGR1": bdmgr1 ?? "",
        "BDJP1": bdjp1 ?? "",
        "BDRevise2": bdrevise2 ?? "",
        "BDSublead2": bdsublead2 ?? "",
        "BDGL2": bdgl2 ?? "",
        "BDMGR2": bdmgr2 ?? "",
        "BDJP2": bdjp2 ?? "",
        "BDRevise3": bdrevise3 ?? "",
        "BDSublead3": bdsublead3 ?? "",
        "BDGL3": bdgl3 ?? "",
        "BDMGR3": bdmgr3 ?? "",
        "BDJP3": bdjp3 ?? "",
        "BDSent": bdsent ?? "",
      };
}
