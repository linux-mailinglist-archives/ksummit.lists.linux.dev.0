Return-Path: <ksummit+bounces-446-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F7F3D4092
	for <lists@lfdr.de>; Fri, 23 Jul 2021 21:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5075F1C0A0E
	for <lists@lfdr.de>; Fri, 23 Jul 2021 19:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B5F2FB6;
	Fri, 23 Jul 2021 19:11:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B972
	for <ksummit@lists.linux.dev>; Fri, 23 Jul 2021 19:10:58 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NJ17oL007235;
	Fri, 23 Jul 2021 19:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=6rdcpNHaK0JvtRbfqQe8PI+N5XVeArccf0iFameialM=;
 b=YJr5o9EUBfDU+Liaehbg2pkvodNXJ+HNWIRXWigdVE9MWZEMu7LpzW4lbXXB+0hPh1KQ
 iEIzirzPmfZC2Jq65Z9bV5LJZWjEUC5mmiOQqDNOhyW9S2d39q5pTy8aTxtJKlV9o158
 kPoqTa2XKapNogIvJgYhPcsVTW8BduwngQ3dIUalyUgOKLaNB+Mdhkf5X0MefvnersmN
 Cm8/UjIMiC5+GbEeLcdl+rwkP678GGd/9bWo0oZLx3+yMafIwAry9SrKAP1IK7vhrHQb
 bbvfDHOifU6k/RccqQKSqvGG/CbiK2eTpqtemQqXQ82e4IfQ+DzdWmW93eoMMEpadGqC +Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=6rdcpNHaK0JvtRbfqQe8PI+N5XVeArccf0iFameialM=;
 b=ZT+k9LUT8+NvGKbjWX/ZOMqwOudT3I7YpkPb4j4YeKhNHOu4HXUhrOIGSFm4c/9O0drt
 lBm7IspIiUfChuNoyI26Y3254ocQJ3/0Y7/BX2c1ynq3eplDZijAEJYg18f5VCER+OCp
 go8zFt0QeyggXohQVUmxUzpSicVmDIxA0F2iX/LCCUx7aEHffq9+cJAiSw7M2OhmfrJQ
 hT2j4rnxyMAPquQvuavKutmX7f0ZeSM9f69q9Tj6zmsy6z4n2KMs3ns2js3yc5rJmzsk
 cG1knnYlf1U13hSxiSJwO2qMsOnia9x3JC+kfEMFC3M1Y04OqGMn2OKH3w6GXCVoiC/w QA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 39y04dvadn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jul 2021 19:10:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16NJ1TOr149302;
	Fri, 23 Jul 2021 19:10:47 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
	by aserp3030.oracle.com with ESMTP id 39wunre3dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jul 2021 19:10:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0C6h/V1l3PYgsewOrECSSWLCnTimtmcouW8r9QzI5zCLRyp+SEIkAEY4J4ERQQ7wU+MeW/UTsTNmSjMJbO4ZEqaKkpJ5IgaVQx07QhmeSpTpev8fLGUH6OwImnG+bSZxuBGS0+iNzUO6fJrpb8NkmN5IKAzPpj4z/Fecr++/XK+qwrSLsV2yaQm8K5P/GHpG626AADBxYxZwTtgiKHSQuTpfOq/ZdBetSz3DoXaMiA4VDeBQFvpFVqE0aT5wGmb4WTKnAkrlAWz1O79jidTnFv5rT37iTEI+VxCt17qLw79iL5Qb/d5EV7r6gFI2QEwoCXP/3FHjC34WTHolEaBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rdcpNHaK0JvtRbfqQe8PI+N5XVeArccf0iFameialM=;
 b=HWe3/EaoRUW+9j5DqLKgz6WTcEzKOWynZI82uHL5vg9G2kkGwwTCtyuylcIkPTShvYQKYI4g6elyJFEX+VqEq4bvFHudfJqWpw/e0BCRY/V8hygy6E1J3Rj+v1Ylm1ttqDo+cJlZZAB+thPANgvNhxR0ZGScdUlm8F2Tz0h0m4gBS8K3ewtXKFJ6L2pOOZ6YPAnQYLl1kMDQ1DUYQWz/5T7F8PwmiQ92Po9p/LKYVzg7Kaa7PzRuVsmdx/zGPm/3Fjd76A/A2GFByhlIKi8zXzFLyYHgi3YO/nyIGOOQTGevJ6j/S+FdgNnRo97Qpii/rwTr0zV3fNVEa99NB8pGFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rdcpNHaK0JvtRbfqQe8PI+N5XVeArccf0iFameialM=;
 b=Xqcv4GA7Ax78NTt25C4ZHyTBktT2lBo5T//SchYrrz3OdmNx5x1QCbWaMspvDcNf8/mwB5J65a7pL1q6tcNpOrJN2ckusZwAbRhcpCBd86WZ7nqC52DEC0gczOIdI5H3igIjkMfgrp2/hO/67PKoX+B2aN2gqC/ikPOf0eFFz3c=
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4721.namprd10.prod.outlook.com
 (2603:10b6:303:9b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 19:10:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 19:10:45 +0000
Date: Fri, 23 Jul 2021 22:10:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: ksummit@lists.linux.dev
Cc: Julia Lawall <julia.lawall@inria.fr>
Subject: Potential static analysis ideas
Message-ID: <20210723191023.GG25548@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::6)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29 via Frontend Transport; Fri, 23 Jul 2021 19:10:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c643bd0-fae6-4edf-11a3-08d94e0d928b
X-MS-TrafficTypeDiagnostic: CO1PR10MB4721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB47213D8571A2817F745894808EE59@CO1PR10MB4721.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	81kOR1Rv3xJowF7qIbjWVwgWRy8c7SrEDFAEHCVYKNOtg6lxW9IkdlQG8BglWQ4tg9nxOllXuX/WwdhA3/IkAc8ovkYtj8j64CcetBo6hmrxoYbKlnQ0aMx6ftlYF8IUdrTDIHchD92UQFP4YW67NmPiDX+DtDWz4Pb770P3SIavrFyimaK6cSZ3biIAUWcHHL9dGoS2NrX8WrfoeI3npN71YidMkENa6sVSgDeO7opiFf+hq/aj99tAIArcXp70US0mg1g+++KRnrAmuJTpqgHmkc133W+2mxWGGHDwd7gwtb6j63ex6qBh2R9uduMobrffC9T/HJDptJBpD016y1BDhBqccy4/+1N2Pz+OpaEW2B4bRH5irme2QneoIqhUppKjU62L/LAVNqdOCIgVrPk2TSHyGPRCrUwa2QjdBIQSbbWiL30OwhwVgyd98M8sNgguoyS8Hn/dem+3/uMud/a70U4/7FJm+Iuw66FCtM2hFtlrkVfSoUu2DM1hU+Vkw6vpiDXPTqFvvvd62BZkyJgA19pS5ypk8r9fVAJf4Wi7tqv/T+C76ESDzbmAG+g9zmjmOix5CSkdGc32w7XaQHV7VIIxWNmf8UsyKkBfTErW5xU3I3KatmA3MPT2+O+V4SLaSHt1cCBGq0cgY8hEIyhEavpQW0baTh8wZgZgqLuX99150PmVAllA3KrhQ9r5L3F7iBTXKXG0BvdxxubUHg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(39860400002)(376002)(136003)(38100700002)(38350700002)(55016002)(4326008)(33656002)(186003)(3480700007)(2906002)(66556008)(33716001)(478600001)(5660300002)(1076003)(86362001)(316002)(8936002)(26005)(6666004)(44832011)(66946007)(6496006)(83380400001)(6916009)(956004)(52116002)(9576002)(66476007)(8676002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nHnLP3jIBZn99Ieft2DwnEvv3yrrQqE68CRIszlWfkypd2o7RxM2TdqjAJWq?=
 =?us-ascii?Q?TrikPjCrDt65qZF8UVy47Gkr3jmVusJZXAjOq1kNhJ7QAEcq5xK6I5yE/dBh?=
 =?us-ascii?Q?EnmUPI0Q4qgtZ9qOVpsI4fgEX7ZpwydCFGxjEWlUrY3uDSn2mq5L5BOSSIsk?=
 =?us-ascii?Q?DwQiJF6QXcfiDF1Wh22e7NA3GCLtVNly2frqpRXlLAmw8MRVobgEGazogLhq?=
 =?us-ascii?Q?WHiC1/Rk/HtAI+Caolo8xd7Hu7CD3O4oOCHV1Ebk8qFUPktaCGjdJXYI8oCE?=
 =?us-ascii?Q?mptjX2rBbdZsjSoP3fp+nIsA65q2BGTR27bZZFijHoDwsBj+prXNpsOaZuzV?=
 =?us-ascii?Q?8xdjF0X4Z91DcbMYgcDK7XOaY06mnyB89ZJ+5+1tLr5zgy1Why5oHcroCmKF?=
 =?us-ascii?Q?UwsBP1fT0ZVHbWz071BxFRRWxYEWIp2QJN4emn6nYMVJLQJ6q7+OIjKcLLfu?=
 =?us-ascii?Q?JsHvVfTHoHh70qYaHKoEmB9NCbRX3fmlCuih0lgrDrcfgn2tJPpmHg0FqRAY?=
 =?us-ascii?Q?TTNXIqdovzdMGs6B8q3g9fdeBIMuhQ+0CbL/x6kLDQFTmojgI/l0Qjm5yhlc?=
 =?us-ascii?Q?/oaqZOai7D29bm/IemzoU/GWYu7qQAYVKrQgEQYzgXpmJek2Td2ESxBe9sYN?=
 =?us-ascii?Q?cSbWZ8UHTGW2/UEZnLKKF13r2qxTlI7cqJrNCESOKwu7/8eXQopnzcJ9j5c8?=
 =?us-ascii?Q?sstzKw/bevegTNOSZK7ampXSH0Na8TKrHJ+iXo1blM4TSuwVJy8EAMGa7ExQ?=
 =?us-ascii?Q?Pzvo3hBxpq75hdC0KldEQnybRyqI+OlvvvjxgYoBwCuPo/eheLQ1GQRxAe37?=
 =?us-ascii?Q?CklvpLCYZvzi4TEkD5IVkCsDL3nAcURoJiN22OZOD+H1mhJ2O4eHOF/fjD1b?=
 =?us-ascii?Q?oRaYG6iN+GX+hsoc/+sIOjqCipWTXyp7zh/9dp9BANuGlKQpy86tWREo8BDY?=
 =?us-ascii?Q?x7rKMG2A4NSYUDN41ZHlgbSKG1qrLdNnr5A5fYkVJWcFewQX0Qg1bSYXn43Y?=
 =?us-ascii?Q?xsiqVNdDAsKaVgAJXWvAohYTYGibIoP3/e/zf3ZcBwJjDJG2J/YeHQut2pb6?=
 =?us-ascii?Q?V/FwosA5o/AGJA0aG1ouptD1y6apLBTV1kTm7Rf+C9McfeqQO1Mefs4e5WuE?=
 =?us-ascii?Q?7zcF7pEij3/IFlDltKSm82CN3ThaD/qhDEKipsfpNUvc5GPkYFBluMfvf6Pi?=
 =?us-ascii?Q?/352r0tzqzID8y6WJZs4W8GG25QOG+UpsJUZBNOwW5OxCvj+xIaDOTawKf8Q?=
 =?us-ascii?Q?xO/w9R++qeOszGFjGn7lmDN6as2qemwjF6FemiCwq2Sf53+PHbgmvssOza5/?=
 =?us-ascii?Q?5C9Dfm/uLFX/1TKzOkcheNwW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c643bd0-fae6-4edf-11a3-08d94e0d928b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:10:45.5101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3e/X785BB65FltqxKpoDfRBxeKnwKXE6imazJSTinU+ExKmxA8RPi7SpAcI81zvsxMxj5zoVemMkcuf0924bZ0Py4Qxdeit4ampYhLqMvpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4721
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10054 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107230116
X-Proofpoint-GUID: 03YOaGMzLDMlvm8SCKVI6RppSDf6GD_I
X-Proofpoint-ORIG-GUID: 03YOaGMzLDMlvm8SCKVI6RppSDf6GD_I

Rust has many good static analysis features but if we wanted we could
implement a number of stricter rules in C.  With Smatch I have tried to
focus on exclusively on finding bugs because everyone can agree that
bugs are bad.  But if some subsystems wanted to implement stricter rules
just as a hardenning measure then that's a doable thing.

For example, I've tried a bunch of approaches to warning about when the
user can trigger an integer overflow.  The challenge is that most
integer overflows are harmless and do not cause a real life bug.

I've also written some checks for locking bugs where the warning is
"expected lock 'foo' held when accessing struct member 'bar'".  The
problem is that I'm not a locking expert.  My process is 1) Infer the
pairing between this lock protect this pointer.  2)  Make list of places
where the pointer holds a function pointer and we free it under lock
(I still need to add the locking part).  3) Make a list of places where
we access the data without holding the lock and the attacker can control
the timing with userfaultd or whatever.

This sort of locking check which finds real life exploitable bugs is
much more complicated to write.  If there were subsystems which had
simpler, hardenned rules then that would be easier.

Another idea is that if I were a subsystem maintainer, I think I would
enforce my prefered error handling rules.  1) Every allocation function
must have exactly one free function.  2) Every function should clean up
after itself on failure. 3) Never free things that aren't allocated.
4) The frees must happen in reverse order from how they were allocated.

These days we have disabled GCC's uninitialized warnings so it falls
to static analysis devs to review all the new warnings.  I sometimes
ignore warnings if they look like probably they aren't a bug.  Does this
function allow zero size writes?  Does this switch statement really need
a default case?  Maybe sometimes I miss bugs.

Here is another example of something which I have a check for but I
haven't pushed.

	ret = frob();
	if (!ret)
		return ret;

This code is normally correct but sometimes it means the if statement is
reversed and it should be "if (ret) return ret;".  To me returning a
literal is always more clear but but clearly the original author felt
"ret" was more clear...  It's only a few bugs per year so it's not a big
deal either way.

A sort of related example that I have pushed is this:

	int ret = 0;

	/* 20 lines of code */

	if (condition)
		goto cleanup;

These trigger a published Smatch warning for missing error codes but I
only email people when I can't understand the code.  Please, put the
"ret = 0;" within 4 lines of the goto.

Those are just some ideas of things we could do if we wanted to use
static analysis for hardenning instead of for fixing bugs.

regards,
dan carpenter

