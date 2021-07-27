Return-Path: <ksummit+bounces-474-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27A3D7224
	for <lists@lfdr.de>; Tue, 27 Jul 2021 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A2DB71C09E8
	for <lists@lfdr.de>; Tue, 27 Jul 2021 09:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D0D2F80;
	Tue, 27 Jul 2021 09:38:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5D70
	for <ksummit@lists.linux.dev>; Tue, 27 Jul 2021 09:38:37 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16R9WCC1008588;
	Tue, 27 Jul 2021 09:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=lt71DK3C9zaa/8+qUPJb68PoAJnRulfuokzKSbRJWQY=;
 b=013OWgOUsvTzgsCC4Sc9ahdOTCE4aHwZzoOEbuShythAuHBNMwujTkXEX2S9E9WNjrfd
 VRXI5FqkJ7n0H6lBdoQk8K9OlX/3iQ7ie9aKJpt3QPmhxqYaAlB/9W8Etc0TXqy1cZIq
 fJlG1pHvqd1+/d5OQC8oKAAmipW/pRyH6W+wtIGpG8tk4VDq8MxVAY/+YCPg8mkDFn63
 ySyRiUc25t9B3d8BJk5ShAFI/0bhHPTqVNfWq2aF1iXCMxC6DxyXs/L+13PGgBGxnewi
 taJVO089qDqTtVsoK2DqvSukXLxvhmKEEqERiKV0pqx/Az85dvJuxxoQ52e0TYxJ5rLG 7Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=lt71DK3C9zaa/8+qUPJb68PoAJnRulfuokzKSbRJWQY=;
 b=ytlUqGDZpKUGcENoWK2c//BG6R5v7OYr1nAm/U4xOZelreWqgeM8TYzcGuqoBEsyrpg5
 5jQXWPqJewANIx2ooCUG5Wt+D76OOSb6lUruH3SasSGQWyyai2WhSn4/xTjpb4tPy6Xi
 z8R4fYzFfnk1bEFvYyDlM2MP0IqLc7/wmReiP1xhfWV//VZMH8kiO8Gc5OSMLwMZrCDn
 5D3BWklVlHO9QDe8F5NJItu3m8UebsKJ9yZU4xP85loalxypDcVxroqvQIgPizjCu7nd
 ykEPUkzKHl678yK0aTJ0TyDHxf8UH8DVxkc3S6q6GXSuF+KVOSk/FIoobmq9+S2piOiO cw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3a235dsaek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jul 2021 09:38:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16R9VT6E056347;
	Tue, 27 Jul 2021 09:38:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by aserp3020.oracle.com with ESMTP id 3a2347uxy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jul 2021 09:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axTH/AP402KshgYv2AJH3bqMFnr3yQAIdgvHPnF2Nd21nvGtPyF1BQ7pPHUJ2lsV7HERZZGZe/BavRQhBSFmnpftLz+zndGYbZLpdd2q2gzJIkXPA6zjcmT2KabRQP3913niF3rBPGRr87jVbVZm70fgMHTnd3K7walAOzbDt/UUPY3thLrJCBEYOk6hN8EHjPFkfJ+aVmgpUpdo9cNZUgb2ShgU6fkkojr0/RGFXP7VT8oaIzUQq182NMikrueuseA8AzUBBnxz5zYKftezL/4eRbgbSOr7kxgXRHKapNcYEtnpqqs6fk9vNzc6bWqBPUvGqVJWAi0k7aEQ5TYDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt71DK3C9zaa/8+qUPJb68PoAJnRulfuokzKSbRJWQY=;
 b=YEek/CTEec6vTLMdUxel7BnfAUp70qk89WNfm5hUJmyzX7edvzDBaLlWlXyA1sxXS7lh/FEcBWMt9LluzzzpkJ4jOaiSgzmX46r1Wh7cYEyGRzKrVh9yGhVHmVoM2mWe3GH2SpOJFfA/2LOp5/I9ZBk9QPQ1CT9VuDGG7z1zcF/T/eX+ve6D5vNweUIwD3MTIpinXfzmH5CmShw5vHS2HzTurOlNEg7uVspRqfE+X8Ns2Uxurn6ldgdtm4OK5Ki8yDcvBq/SyOGdMRbePxasyV3Lfhl3vhjCsFvWIB6FB5jvVQuCW+yFKA5k65nirVauzi0AE+vLpiE/v2JzXGM96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt71DK3C9zaa/8+qUPJb68PoAJnRulfuokzKSbRJWQY=;
 b=PqsB4EHpJCYBHr7sEgaPrDRWFQwxYS2Tt8GMTLzCA0leykVkm8ZD3fPdfM9l7nweDYhgJly+vqfeM+cxiH4nId8LKx/FWObBEoqEOr/TRUel2UmcGB3PkfcBMx7RhVpBP3jgOEj6n/GPWcYPTwk9QULANO6aB3LTaGdugD5s4fI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com (10.174.166.156) by
 CO1PR10MB4658.namprd10.prod.outlook.com (20.182.136.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Tue, 27 Jul 2021 09:38:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 09:38:23 +0000
Date: Tue, 27 Jul 2021 12:38:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: ksummit@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
Message-ID: <20210727093808.GO25548@kadam>
References: <20210723191023.GG25548@kadam>
 <20210726155039.GR4397@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726155039.GR4397@paulmck-ThinkPad-P17-Gen-1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 09:38:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67733c39-b1b8-45a3-c57e-08d950e246c8
X-MS-TrafficTypeDiagnostic: CO1PR10MB4658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB4658BD12CA00EE3EC0B5FAB98EE99@CO1PR10MB4658.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AhSqeHmMQF5zAdBL7qN7wZgS+dRZ3XOeGFauogcMF8Au1n2Z00OPOjgWp156BsTwloFGTQRD8+mbCsXKl8KymFDz+YCQ7p3vkaSnz0yD96UxMxcq8a9DhH1A/UVCoZf6ZX8UuwK9IU5Db6wVZu9gF69m0fwksMyTNfZZme0wJSqT+Lht3Rz/ZwCXp7c9cXYZyTsipCs290fu7iNt60ubnhweStPh+E30HwJGJ8Z6FkLL4hGWNF3winOZfnVmrL9LNX8VUVBEOfooHe9f1C5MNo22Ue9RqpDhpapzH9M6Cm3HWNzQsBxybxc2rHEXdDsn7SdIK92uiFVfZaLR95juDZMoHShltkat6Np5blV5AvQPCxGN//PTfg5BqcXZRTu7+uNfVswTye9mphFkJiyeNKxaLDzOruTRMjGWZrVXkD30XMs0ejnNUEjk3juxnNKPn0ev1kyKTmG6Tzqsk4diKSnxp+Lhi5foiERm3Tra7M7dKBztih56pfo5nQfauKeEtRTl4ZIcViQC52MIJNbf/LaXpg/bFgyRBUr1kSo+v6enx15uu2oYb1X0JO8L0VF5pZ/WtoQ8qSgCj5K7A0VS8MvzCmoe04NVVne2PBetZH/TicXJW1nwTCeJe7AEOPpEmO1qs9MMxyfAXB80CK2C2u46jjtI/UQ4lVcZQDAObOUNSPITjvgsd3U7zlmCy80+SU+azqHj4DsSqJglQ31tyw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(136003)(39860400002)(346002)(2906002)(52116002)(3480700007)(38100700002)(4326008)(6496006)(8676002)(8936002)(9576002)(956004)(478600001)(316002)(55016002)(44832011)(9686003)(33656002)(6666004)(86362001)(66946007)(186003)(1076003)(26005)(83380400001)(66476007)(66556008)(6916009)(5660300002)(38350700002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?729Rk8OjuahsJikJLLQ2mOEdW1Gnztb4L3e8NgVLf0FPnTgpyPTfM8lFtKVK?=
 =?us-ascii?Q?MbiefVm1ueOP5QEni4qmJyp9Yy0uIS+R4WigBFtMA46j5QjmasKpPSz1MDVI?=
 =?us-ascii?Q?2pJvBs0EmnCp2n6KbFqIPbNxcYxDWOxvf3qyQBZV8WeRMsO9zWw0Ip+wxzsI?=
 =?us-ascii?Q?5L/YOUmZCJNJRdogaxiGFQn7yzTDXWAmxcBC2tcIfB/q9RWy2rF19871LKwM?=
 =?us-ascii?Q?20f3X+Nyw6MjV0gDDbZ/DaQz8wUsv9jQpM2+3fKV62ZQyynT8UdbuM6adJ5X?=
 =?us-ascii?Q?CKNbzZHITcx7DBhKP+JPl/KF4j0zM5s6DHMUzt+clZSR6XqoAY5ahT/91q4Z?=
 =?us-ascii?Q?zlzwPTArP66pjXtMeR9QrGVSQEaC5Gq81TQ9E0iUCvyG0PRV2DBYmAto84G5?=
 =?us-ascii?Q?qHMe2eDdoO2FL2wKMua2wtweds4gpThLsIILBunPLg50T0h1+HpdzlIirCxG?=
 =?us-ascii?Q?cSGwIZkKuH3DHTD5Y241HW8dFW8usuCwUCZhwNoYqIq8D7nYQ2ZB5DQviqlW?=
 =?us-ascii?Q?dnWyJQq1cW7Q0IT0IW4LO2qWz9eh/XftWATRW2iahgaJ6YvhYy5rXniRrb9V?=
 =?us-ascii?Q?515gwx9v9R05lV08q3CyCe5vHnh6N2Tc2aBs6y+R8ELXM9ZKTR6SVUz6XdYQ?=
 =?us-ascii?Q?LNQmetBYY3/G44ueWYhSm1RFpELrhDCFOnf6u44NqttdwyxbmLjFXmVzOtHO?=
 =?us-ascii?Q?60QaIoqYCwW4/m+F+xTKmZ9yG4ns/306cMtPAdZLSJi5Sbzuc+BRCPt6AkkU?=
 =?us-ascii?Q?m9ZhR9iIq2kpDQ4hN9RwLZN3jdR5KUZ6m9gQ1EYj8lSBKpTut1fHl6zDRic2?=
 =?us-ascii?Q?c1vPrylFCQLRu5NnATSwEETPiRmJDAN/kKBdWu1Xn0SRnJxFneLzzkkyC3y0?=
 =?us-ascii?Q?v5xRKzxv4E3jWSbyms/lGmmTRy+1KQySu1dADxNjodxJWkMm1X8r4Fp/pozN?=
 =?us-ascii?Q?1T1zMEIgi1zJg+oXvvqZyUzOBoxNNb4nTd1JafLgkx/Sq4W4h4tCNjY6xUoT?=
 =?us-ascii?Q?NC9y4oe6do7Hcj4jhWnrhsE9IhF/oUKMVJdXt+6jDlOVn2ZakchscnBX++I+?=
 =?us-ascii?Q?S9RbNm6xyafcpsikw6fxi00yLB8Ar9Z9lwYFCWlbJ31mwtfQtJIwPulG6cVR?=
 =?us-ascii?Q?aqaqdszADx7w3EcR3MuwbMv1aEucEM+MlY3Y1brIK1htnm76A5Zz7XrjE6lp?=
 =?us-ascii?Q?rq+fm2ZgUeEVFiQQCjJZ8CPBmQcEJGlbrMc3JFbv/QdPDronIiSCBYMGPsWI?=
 =?us-ascii?Q?uvkW63WDFAiDtnocmedFEDSOJKU3bmI0R5vic2SE9Y/UHRbp5+xaysoYc88K?=
 =?us-ascii?Q?k32uUdIDJERAt+XYm7OS637f?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67733c39-b1b8-45a3-c57e-08d950e246c8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 09:38:23.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8mWUwzXqrmHDGgNsHER037zi6Vetc+/8fBWGbQ7g5evs1vw8atfUIFWfc4vcfc9rrvk8CRF4pb3hsgjX9+YqbUi0TQdpxpselSBqE6436g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4658
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107270055
X-Proofpoint-GUID: x2nMm3D0tGRgNENBgUFxuD6nBf4Osb2b
X-Proofpoint-ORIG-GUID: x2nMm3D0tGRgNENBgUFxuD6nBf4Osb2b

On Mon, Jul 26, 2021 at 08:50:39AM -0700, Paul E. McKenney wrote:
> On Fri, Jul 23, 2021 at 10:10:23PM +0300, Dan Carpenter wrote:
> > Rust has many good static analysis features but if we wanted we could
> > implement a number of stricter rules in C.  With Smatch I have tried to
> > focus on exclusively on finding bugs because everyone can agree that
> > bugs are bad.  But if some subsystems wanted to implement stricter rules
> > just as a hardenning measure then that's a doable thing.
> > 
> > For example, I've tried a bunch of approaches to warning about when the
> > user can trigger an integer overflow.  The challenge is that most
> > integer overflows are harmless and do not cause a real life bug.
> 
> I would not want overflow checks for unsigned integers, but it might
> be helpful for signed integers.  But yes, most of us rely on fwrapv,
> so that kernelwide checks for signed integer overflow will be quite noisy.

Since we use -fwrapv then even signed integer overflows are defined and
I haven't seen a way that checking for signed integer overflows can be
useful.

With integer overflows I'm more talking about integer overflows from the
user.  And I imagine a subsystem specific thing as a kind of "We want
extra security but aren't ready to port everything to Rust" type option.

I have almost 2 thousand of these warnings.  This first example is from
the ioctl and probably root only.  Plus commit 6d13de1489b6 ("uaccess:
disallow > INT_MAX copy sizes") really improved security.

drivers/fpga/dfl-fme-pr.c
    83          if (copy_from_user(&port_pr, argp, minsz))
    84                  return -EFAULT;
    85  
    86          if (port_pr.argsz < minsz || port_pr.flags)
    87                  return -EINVAL;
    88  
    89          /* get fme header region */
    90          fme_hdr = dfl_get_feature_ioaddr_by_id(&pdev->dev,
    91                                                 FME_FEATURE_ID_HEADER);
    92  
    93          /* check port id */
    94          v = readq(fme_hdr + FME_HDR_CAP);
    95          if (port_pr.port_id >= FIELD_GET(FME_CAP_NUM_PORTS, v)) {
    96                  dev_dbg(&pdev->dev, "port number more than maximum\n");
    97                  return -EINVAL;
    98          }
    99  
   100          /*
   101           * align PR buffer per PR bandwidth, as HW ignores the extra padding
   102           * data automatically.
   103           */
   104          length = ALIGN(port_pr.buffer_size, 4);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This ALIGN() operation can overflow but only to zero.

   105  
   106          buf = vmalloc(length);

kmalloc(() allows zero size allocations but vmalloc() will return NULL.
And actually, in April, Nicholas Piggin made it trigger a WARN_ONCE().

   107          if (!buf)
   108                  return -ENOMEM;
   109  
   110          if (copy_from_user(buf,
   111                             (void __user *)(unsigned long)port_pr.buffer_address,
   112                             port_pr.buffer_size)) {
                                   ^^^^^^^^^^^^^^^^^^^
So this can't corrupt memory for the reasons given above.

(It's still buggy because it doesn't zero out the last three bytes
between port_pr.buffer_size and length, but that's a different issue).

regards,
dan carpenter

