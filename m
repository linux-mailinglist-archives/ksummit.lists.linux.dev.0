Return-Path: <ksummit+bounces-966-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5AD77CB10
	for <lists@lfdr.de>; Tue, 15 Aug 2023 12:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF71328147D
	for <lists@lfdr.de>; Tue, 15 Aug 2023 10:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A10101FC;
	Tue, 15 Aug 2023 10:17:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86623CC
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 10:17:19 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EJOJCV012991;
	Tue, 15 Aug 2023 10:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=J5LC6kYJlRSRG0a9kHqbT3qX2Gqfi4Fm9U82wfEci9E=;
 b=skQ4vPGWkjGEtVUQMT7EWCG8HoosEPOElKins0Sj5f6qU8XbIwuoALksiPT7OlLpnfw/
 8ux15gWwqtevjIqcjT3DkcnSncoE8pMBtfGVUEEr8uZ4h5OHlOlDLEQeCqEFGcoLdoYF
 u179ZZ+aO1ZU/iQ0KpeugRjQaaaWobu0JO68PJGVDko2rFwJ7gnfuEIfg3jpaySernml
 RLwIQa2YXh/RC4V4fvZmZaEd2feL1TTCeDpKwHwS0oUIOn1HXB17cCcrL+MWkdKDZ6Ng
 xg7sjCo3A19ByjXK9zV+f3NTsGhNDvqQcwsX0iwrwRHOCI4oMtMmw96AJZR+Y2z1z5TB ig== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3se61c49jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Aug 2023 10:17:17 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37FA1KFI027399;
	Tue, 15 Aug 2023 10:17:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3sey1rwupy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Aug 2023 10:17:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kd3ssIJEkIzA9HT6goWTUSF+ksiCgHZHQgezQlmzlDyus3YiRAXTTIYndeulldEc+fMtr/XwhOGKRfLTyQg5gH2aHeUW4I67gJmzB5xVAhlV9ex13E06HIscTp3ypYCYSvsgcS8dQbv9Agc+7Sb701WYZ9dnkUle3V2AlAApbUIAd2Mq69YJOknbHTTtIwckEJb88UA+E2XM41wkpyerpTnK3Hn41lkO36le2n3ZWm8wHy0TI+SQd047tTojttoRzi/3xj6KOt++lYtF79ywKWfngKvWx6HBSLTLJJQBJ+WFdpaOA1qPg6uVn6bW4ta6O0vSNVpTPgIvagNygYv/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5LC6kYJlRSRG0a9kHqbT3qX2Gqfi4Fm9U82wfEci9E=;
 b=nLStaahvjw1s1CjqnPhGUn9K3b+h9m7P783ZyDn75vnwyy7Q4v1I9x/H3xLCWe5Nj1sdbEVTIKJxGHVGebzFycm7NDAOqArVT1gOme8lLzCACwVHyaRX5sSe24ACUfu+XKkqtbcMEsBM8Co7BSeWz7CQYygVayEKF+ocoBBnXHMHlOF2XwCsMLWrlVAToi7bSnds2+7IOhGA9VCdqwlExYspv1+63nc8Az/HX9LHyClfhNzDAfvztLaRdY20j+4Hx/KebSdjvkInXCv8gly76XFvbhoFk+cnLwSUotmmzFapYDXbdwZTHT/S7p0pQKnxTW6BQMIvYS7qPBsa91Nwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5LC6kYJlRSRG0a9kHqbT3qX2Gqfi4Fm9U82wfEci9E=;
 b=Hfq8tr1ENl0BPRKfGIL5aBqjveQKstyLiNDu6AurtafE4giFbBg3mm2MiGix6JGbi6xuOwHoqP13DXTbNRrahlKjTGeHMKXhVoIxWI4CG1sCVoAMAKHrbn9WtC94LphUNjXQtPhEs2NU0JpvNZbvWwzGyF460rmHpKhUUCA6Kuo=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by CH3PR10MB6881.namprd10.prod.outlook.com (2603:10b6:610:14d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 10:17:14 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::76c:cb31:2005:d10c]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::76c:cb31:2005:d10c%5]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 10:17:13 +0000
Message-ID: <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
Date: Tue, 15 Aug 2023 12:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Content-Language: en-US
To: Jiri Kosina <jkosina@suse.cz>, ksummit@lists.linux.dev
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
From: Vegard Nossum <vegard.nossum@oracle.com>
In-Reply-To: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:345::6) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|CH3PR10MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 335ed3d3-a705-4548-4afc-08db9d78cb54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	syX7D1vm931fmiYUMrXmmVxSoNnkjkYvJA8eUUuFFycfXCK4k5SE8VdeX1PqL9VIPxRPO96escf2fONJTPQkdEoz1IsRFc3ISuz0KQ3zDQ23jrRU5+Ztw2yBzh/F095XkVGsUIFTp7tYgxx6Wf+7UKfLb5xLTPvwuPVdDeTqoM1A8wPKt1TLojCA5AHM5DWmSQst4YzEm4WCaMXVCmkuumYPsrKi/vXMzNk91Wt1qwAa3RJ3ICPIo55gUma+hJ9K4jFCN78K9qiurw6dGLO3JYKeBXdasjcN0ZKIe1Jx5XYYTHrXuoCVPHo2rTZ/+hZNcbUweeboZ/JzCNFXB9QMUiJooZtC0Xd9daPVADXI+bjatNFFV68oKSQxSnBGxv3badkdHhkeOfVB9a6vpRnfUDF38V6J+2b85cpqHwy1vVHXj2USQRrHS9BnfH6CRL/n6y5CBrTpS/qWy5dVY8cY7I0TBSSJbLWOia4YG53kuA2tnSgEVGydlimNQv3BEwq1VWgQXb1msIMG89jxk8ERk2p4tcH8ArlVCTZKKJq3Gchu7BfZZmPECsq8oidxQ5UJcpvfj2a13vikHBRRbFLh+WOdmSARxOk1fnXg7k2lbNPyNlrjHKcY7kl/1NLnUd5kJFA23ayTRYdPQ1hIC4R2wWLPDEYct5lDs1++TOdE5oUrFpAj92t9IHQ65eUORSFHM91cap9zpd8xRedCcqdpCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(1800799006)(186006)(6666004)(38100700002)(19627235002)(6486002)(66899021)(478600001)(2906002)(5660300002)(36756003)(86362001)(15650500001)(44832011)(31696002)(66476007)(66556008)(66946007)(41300700001)(8936002)(8676002)(316002)(6506007)(53546011)(26005)(2616005)(83380400001)(31686004)(6512007)(966005)(35693002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnVyMjY4U1duSGlzOFlRaEdxTFk3VnYraVVLbjN5Zm5Zb2g1V2RQekNZSklk?=
 =?utf-8?B?UDVDMkd6RmtsY1VKY3FkUGpDM1lyZHl3WHF5ZFMreXBkTjhNaXc2ckJlcENT?=
 =?utf-8?B?MWhhdTJLYmIvcDFlQkxjTGdOVmlXbVp6YUo5QlVmbGk5a05LUm85YWI3RnFx?=
 =?utf-8?B?ZklJWUNKSFZDUXhqQnYrSXE4RVdtenVXVmMzMmUzc2FqTmhlV3ArRXF0T0hh?=
 =?utf-8?B?YXhZRk9EUVI4NFVlVDZTVkdpRGNWa0s5T29xaHdTVEs3UU1PQmdBclExT3Ir?=
 =?utf-8?B?N0VKLzdXQW83TlVHTHBmZDhzSyt1Yk9pTW5Qc2RtU25XcHNtbForc1VORlZ5?=
 =?utf-8?B?aXpFbVh6RzB0STVFOVpFM2gyNUNtd1NBczZ6VGlrNDc4aU9kMGRoblNrVmtK?=
 =?utf-8?B?eDVob01Kbk5nRTd3aHRPUHJMa3Q2MmI3Tmh2aEFXb25zbUVuTmk4ZEJhd3ZH?=
 =?utf-8?B?dnQ1UHFEbEJRaktRN3VGY0tvbG4ySUk1c21jbkduYVRLVStYbFRaN0Faemt5?=
 =?utf-8?B?UjFBbkNGTlltdzhLTThXQ3RoeEtGOUYwbmZhNkhnK3VJbll6aUlzMVVGUk1P?=
 =?utf-8?B?bm55MW1QVW0vblE4WGxyK2ZPSFJ6bEwzcDBxRmtnbXF3N01Jc0tTZ2U4cHpz?=
 =?utf-8?B?NUZScmlrRjRrK3MydkxER0J4TXBNM2xjWkhvcnVGbkhqYlQySHZ0WmFhQW9U?=
 =?utf-8?B?WU1vMFFSaDNNYm1icUN5and2d1JiUjVnUnRBTGF1b2c2Mkx6VGZoYmxkWjZ0?=
 =?utf-8?B?OEprckt6Q1l4alZiQ0VKOEl1bGVuRWZ1dXZ4NUlUaVhLK1RsMkQwSVlvVkVJ?=
 =?utf-8?B?aGl6aFpsTVEvSkhWZnVGQTV6N29zU0Q1MzR1VEk1MEp2TktJY000WTBFeS9p?=
 =?utf-8?B?cVZ4KzhtV1VFZzNpVnp4aUIxN3IxQlFLRUlsVTQ1cHN5V1VXOEFFejZSaWtV?=
 =?utf-8?B?WVlVazljaklRWUtlZUVVdG50d0p6SDVwYnJsTGpRb0VEUFhYcmZPRW9qa0h1?=
 =?utf-8?B?L1I0ZEJSaVRLMFRvSjZzcjdURTJCMWF1NFFkbXFGYUdOVjR5SlE4aWtJMUgw?=
 =?utf-8?B?UzlROGorRWlYKytlbHBrOXRtWHlDTXNseWpJNEJCU3JiUzZ2RjcwK2JQMmVO?=
 =?utf-8?B?OTZWWjVWcWp2V1JEWm14aGdFU0xxY1FXQ3k5SVowN2tGZzBwTFdrbVQ3VEpY?=
 =?utf-8?B?UXo5cTlMZTE1S3VjcFlWbU44MUpMVExINThFbTNjTEI4VDd0SW9rYUR2eC9O?=
 =?utf-8?B?RkJLQjh6MWJtOS9kOGRhSFUzbXFkbjhIRUlnTkJ6YkpTd0hRZm95enZERXE1?=
 =?utf-8?B?Z3J3TVdRbmFHeWFTUDFsMzU3a3cyYWtDVWc4NGNrbzRPRktNRVJDS29vRGNz?=
 =?utf-8?B?MlkxZi92bDlhV1VBMkMvUyswWmU5QXlCbW1nTEFnUnM4S1VscWJ6SlY4bEZ4?=
 =?utf-8?B?NllGd1FGZmwwWTRtUVc5VWV1QzFMUXNEZmtHMEFwMFVMOHJhTkgydk1QWnZ6?=
 =?utf-8?B?MFlhbFJJTjFnQ0Y3am11VXBEWnQ2c0E4dmZwaVdYbEtlNVpIcytOTFlZY0xS?=
 =?utf-8?B?dkc1SkdrUkw4NTNKTVRIRDJEVVhaM1lvWjNCQWt3TkpuejFlSWpOT3JHbHBF?=
 =?utf-8?B?S3FIUjFnUnlzMjJHRkR0TGhXM0FpWkNJM1lRakdoV2lPY3AxaWI0S09sTndK?=
 =?utf-8?B?blBVdXlXRTdtMzQ1aVhhYUQ4bnE0QVIvbmZvTThncndlczlJRHMwVjNtTmFS?=
 =?utf-8?B?a0tVRUlEUy83VytPRitCZFg5VENFekhpTjcwd0xxOEVBQmtOZFluQUYrZ0o0?=
 =?utf-8?B?U3kxdjJTV0pZSFltbmxFN2ZicDRhVDZnQlE1clRoYlBrTGtwUGRrMFhpQUw5?=
 =?utf-8?B?eDFFVXVoOTNyR0N6RDMrUDFuRk1aWkhFZzJlNWRnci8xK3NyL21CQWpuQ1dN?=
 =?utf-8?B?clJTL3pjNEs2L0NIaWcxak93U2YwQVpjSmNsNXFVRVl2a0huZDRYOGNSR2JV?=
 =?utf-8?B?OEcvSkZHRVJ1T3BrZExtZ2FqLzUxZERKWm1OUUJ3azNOaXlmTG1PQ2ROdmcr?=
 =?utf-8?B?Y0w0a3dGS1dEc1hkQzRHWWFGMUlxRGdvTzlETHc2QW5XOTlwQ2FlaUYzZCsw?=
 =?utf-8?B?K2dRSmZwQ2tlWEdYSzVXekUxdGtYNVlJbzUwaDExK2ZyNFhpMW1jS3JTZjhB?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	31L25Y/fCVlEyrgok5f4VlmctXmC7/5TUFVXTPCOx7KSMZ1zyCRWsCSgbgrUeSZUMqReOtLUj5M9ehThiV/h0XER+WXBCRe7ixeK/KsAbTNi6V5DEEPPS0vL3HtsUR2xIcsknPwAKuLVPjaiZ4Yw+o66WdoPUbnydFd2mcHPzUQJY+24hyIgjVUzSDOlRWBLyLHdAstkqXr7Z8ewdHiZoau50GWxQ6LkudAu7VkyTxTtF/bM6bK10imwiyNDTuYi8/rsWer3kNH3lHUNZmmVkAsgmTZJwoSi6TFndJs2YbORSsmjzWLUZAONXCcd/fYNh1YmnzZ8fcICy6u6LKnWlLGKHXbi2rkGUOedIjlSFWw4xilkZReUh3VvcDQcr9vrLyjIM2p0S1dWHes3Ce8g37CxDJA6oNaxy//JeisQO8q1LonD2WCS1Fl5YoPsjjYtvwtuH0FTl2QAF0wbUgS2Rb+ZIvqJjGAM65nxuv4BL0rckEpi72sUMcKO00W896oNp1GdrUDGJGxu2cHCAIZ5b7134blVqUq3E2UC3QtGgPHwvy0k5cFRmyPiSlpBz2KXQ8/G9FQaL57qqfYYIgGKABdoWOzzBlJfBNQRuFvLyxWOcLgCytl3rAp2dtrdAOjs7jvoinA+lYBHgo6++NDbCaswMo38uiK34Tpfn7Flv9hqx+UUA9+ZPvxmuY9QXn83VXI/qFJjhOs78x22gXPGNkCIL70pxKvxAOeWN+24n0yBmDvN3UuQ0WrP+fy22jMIm/2mpTlKIuEza7Ev7C3pGTRp6Mkb/rwioyJu12UDNorC4ph92QBbbudahG5DsyqbMrLOGZJYltWFmkjmd5B3gBLplunW9TUbaQIONoepFsw/4cASOvWlQ+1oEfLytTL8
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335ed3d3-a705-4548-4afc-08db9d78cb54
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 10:17:13.8612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glWOw4HBXdRZc6/MSXrY3s4U8O497FIv0fsCb7EmEDBAN77zBwKKUaLG3u6YZSsNh7LAnEXArZKgnt9vlQ4Qh5XTRoyyC1A0AKSqAW/8vuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-15_10,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308150091
X-Proofpoint-GUID: jWHlWPU1uzhAoPhfLE_dVUhxQqc5k2_r
X-Proofpoint-ORIG-GUID: jWHlWPU1uzhAoPhfLE_dVUhxQqc5k2_r


(Sending this with a few extra people in Bcc so they'll see it without
getting spammed with replies if they don't want them.)

On 8/15/23 11:28, Jiri Kosina wrote:
> Hi,
> 
> I believe that reporters of embargoed security issues have always been
> confused about reporting to security@kernel.org vs. reporting to
> linux-distros@, as those two lists have completely different ways of
> dealing with the report (different purpose, different deadlines, different
> obligations imposed on the reporters, etc).
> 
> Our documentation originally suggested reporting to both in some "hybrid"
> mode, and the results were not great, quite often leading to confusion
> left and right.
> 
> This led to a slight update to our documentation [1], where reporters are
> discouraged from reporting kernel issues to linux-distros@ ever.
> 
> While I generally agree with the change *now*, given the current
> conditions, I would like to bring this up for discussion on how to deal
> with this longer term.

Sorry to toot this particular horn all the time, but before this update
to the security documentation I had also submitted patches to update it
to be much clearer and more explicit about the s@k.o and linux-distros
distinction:

https://lore.kernel.org/all/20230305220010.20895-1-vegard.nossum@oracle.com/

The main objection was probably this response from Greg KH, but I had
the impression he was (at the time) not totally against wording things
in this direction at some point:

https://lore.kernel.org/all/ZAWB5kwcG9IpWvE%2F@kroah.com/

I think it's worth pointing out that the latest update to the
documentation (where reporters are discouraged from reporting kernel
issues to linux-distros@ ever) came just after a private discussion (on
both mailing lists) about the StackRot/CVE-2023-3269 vulnerability where
Linus in particular came out hard against the linux-distros policy, in
particular the requirement to disclose PoCs if those were shared with
the list in the first place. I therefore think that Linus himself needs
to be involved in this discussion and that his arguments need to be made
in public instead of just paraphrased by me.

> With my distro hat on, I really want the kernel security bugs to be
> *eventually* processed through linux-distros@ somehow, for one sole
> reason: it means that our distro security people will be aware of it,
> track it internally, and keep an eye on the fix being ported to all of our
> codestreams. This is exactly how this is done for all other packages.
> 
> I would be curious to hear about this from other distros, but I sort of
> expect that they would agree.

+1 from me; the distros list has been an extremely important resource
for distros in order to get fixes shipped out with minimal delay.

I keep saying this as well: almost all users get their kernels through
distros. Very few end users build their own kernels from source; in
other words, it's not enough that a fix has been committed to
mainline/stable git to consider it fixed. The connection between
upstream git and end users is clearly the distros, so distros should be
in the loop _at some point_.

> If this process doesn't happen, many kernel security (with CVE potentially
> eventually assigned retroactively) fixes will go by unnoticed, as distro
> kernel people will never be explicitly made aware of them, and distros
> will be missing many of the patches. Which I don't think is a desired end
> effect.
> 
> I have been discussing this with Greg already some time ago, and I know
> that his response to this is "then use -stable, and you'll get everything
> automatically" (which is obviously true, because stable is represented at
> security@kernel.org), but:
> 
> - Neither us (nor RedHat, nor Ubuntu, as far as I am aware) are picking
>    stable as a primary base for distro kernels. There are many reasons for
>    this (lifecycles not matching, stable picking up way too many things for
>    taste of some of us, etc), but that's probably slightly off-topic for
>    this discussion
> 
> - For several varying reasons, our security people really struggle with
>    ensuring that whenever CVE is published, we as a distro can guarantee,
>    that fix for that particular CVE is included. linux-distros@ provides
>    that connection between bugfix and CVE report, and that is lost if the
>    fix goes only through security@kernel.org
> 
>    And yes, I hate the whole CVE thing with passion, but it unfortunately
>    exists and is seen as an industry standard by many. And with us not
>    being able to systematically / automatically guarantee that fix for
>    particulart CVE is included, Linux will be not allowed into many places.
> 
> I am currently not sure what exactly would be the solution to this.
> 
> One thing to try would of course be to discuss with linux-distros@ people
> whether they'd be willing to adjust their rules to fit our needs better;
> but before that happens, we should be ourselves clear on what our needs
> towards them actually are.
> 
> Another option might be to ensure representation of distros at
> security@kernel.org, but that would completely change the purpose of it,
> and I don't think that's desired.
> 
> ... ?

I'll throw in another idea: distros@kernel.org.

A closed list which will be notified by security@kernel.org once they
feel patches for a particular issue are ready for testing/consumption by
distros (and hopefully before the issue is disclosed publicly, if the
reporter still wishes to do that).

The members and list rules would be totally up to the security team to
decide.

> 
> [1] https://git.kernel.org/linus/4fee0915e649b
> 
> Thanks,
> 


Vegard

