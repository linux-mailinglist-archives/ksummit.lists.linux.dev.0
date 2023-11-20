Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91F7F12B8
	for <lists@lfdr.de>; Mon, 20 Nov 2023 13:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14632282591
	for <lists@lfdr.de>; Mon, 20 Nov 2023 12:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AA818E15;
	Mon, 20 Nov 2023 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="guex2JEs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Kyv89Qgh"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45F1944E
	for <ksummit@lists.linux.dev>; Mon, 20 Nov 2023 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKC3rkl030550;
	Mon, 20 Nov 2023 12:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=8mDZB0aelyt6DLOTWCH4uIt5dPPuBmDTYJYc4rMt83U=;
 b=guex2JEstc1K2y05m+dkusGyXi03PV0TETDb/LvjMaInenSXmjYKXPo5XPsfMKfiaTlf
 kRmMqVxFzQbBKJqC/lq90MFCN9I4fbOoY+hFOHUyW+W1ew8P1ONWhlzTVJ4zrdtul3XK
 JmOLBzoVhDtqfyH7VSBg2v7tZfT/f1pc8ATHSOh+n2kDnqvH5CDISz6Zb1yxwIsoU/5O
 boNkqyMisb/vtiSb1AzSXAYDQw0ez6FHOR6hDUXwcx8tFgFvTmH/b0GU8av1tegAzfGi
 +0VyDptnsvbReDBLhDrpRVV3ahgEEnriof79YWoEG/F3piNhzWMUCb209I8Mah8zkpKi cA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3uenadjggd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Nov 2023 12:06:23 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKB2ZSD040642;
	Mon, 20 Nov 2023 12:06:23 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3uekq52cu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Nov 2023 12:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cydmStBv4kjbCLgBG36YLsBxiPztpQWTx4J7SpzAUscMdVxk1kFR7505X2ruuzcANG4f2CkgF3uBx6FOkeVAFpOY2ewRLemURqc+sT8hKFGQJHliaatzMFGhEThZXFUutNeaiO+dKAdEyiEANIavdO9sFOU4cj+qAF70HK2U54F6WZQANgjfZhbFzh3OE89Xm2g29e8p4eV6qaAw5LCKhkgHOKFeY9Ys0/Yn19FD7YOS6objGQytbrjH1TWee0UIRw3f43+KzggnVEQ0xp5uNrGthTv9QLKlcKpOF1+t8yICyCaeMkqwTpZRwviZiopGFV8c5I0ueGe7u0lwHLFQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mDZB0aelyt6DLOTWCH4uIt5dPPuBmDTYJYc4rMt83U=;
 b=nEfOcY2IdeLtHgrp4vv8CVdIhet7oxc0E/It5nSI13H+/OYVmA/5KF4WEwjjVQ6h/yaEQ7ieSpwUHjS7H39V7C4zgBepI32vb8erhi69K2+9xQu5Yx+R2HVeCuBstNfSl0lQmZzijHvoEOxAhzFoMSlGebIwmjrpZTRN92yjqDqTLHxUffr/Xf8UxPVoYNrtUNCDLiqQ3A2eFSDdZ7jArWzkgCclPYD0cC3SDaijs/KB6Q9mh/7KQ7rn83q2AaF6ER721tPMK4njN6Xj/ZomOlofToniOLEs9+iM0H5HnnUdVuhHTWQRlKrL53chNrIL7bpSydq+GKqiSNjkek5Q/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mDZB0aelyt6DLOTWCH4uIt5dPPuBmDTYJYc4rMt83U=;
 b=Kyv89QghmR/8RcPhk4y5TcQmWsz/DnKyLZqEBe8wHBWAVsy1VQeRQgQciDvj7ryU2Gg9DDiMud2UP8iRHztL8YYENQ9DsdUl4ZeKBFNKUcF9Hbc1b41xaftSC7gGV4gdwzIPFzzv4WDLy3qqMFg35M6oO/yiUNFX4dUJfuJAB4Y=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DS7PR10MB5261.namprd10.prod.outlook.com (2603:10b6:5:3a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 12:06:20 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::cef0:d8a0:3eb1:66b2]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::cef0:d8a0:3eb1:66b2%4]) with mapi id 15.20.7002.025; Mon, 20 Nov 2023
 12:06:20 +0000
Message-ID: <430ee6bb-2556-4674-ae9d-fd7729bf8afd@oracle.com>
Date: Mon, 20 Nov 2023 13:06:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Kernel documentation
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
        ksummit@lists.linux.dev
References: <87fs6rxppz.fsf@meer.lwn.net> <871qi6glzl.fsf@intel.com>
 <87v8fiq6cl.fsf@meer.lwn.net>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <87v8fiq6cl.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0001.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::6) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DS7PR10MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f46d19-ead7-40f2-7d86-08dbe9c11ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b1saPn7hcXkAyGoEUlT4K18Qo7zZaWMYIz3tr1tFyM4pGJV01qgxCKIx0PwKHNQ0RTqLb9siWW9AXeJwTRsYbDnmn7dQqonzRWJYSY5nh3WydE9smbH4EmLifL47A1N5O+sDLzA65FY8nSfZGyag7b5go0Uggm9qtWWkjiSHnqCpfV0OBWBIMm1C2yfGQOJrWljWecufdQU6gxIZGmeowCVCRKe4VNghEpxd62agIybU6S7yB3GbzqLBVZl+w4Rkebt+p2PVCwBGu/Q6i6qeukNfcRQiH/iGzqi4BlMcOPf7Gj+NlEX0b283Je8ohfiozw1HC6Ld1FbY5Quoj/IT5IlRuV/Pzn4XWDtJz1mkpzVYOr4aZ7rYqczAChJ30mRhrwB1JyPry6N9BtI7qzXKvJyvVbJNHM5kGBas58eXFReaAr32nJRGTY4eUmVP+2RDhHCEo97bidaNBY5xUkCgYFYjoe6SPXucWyOnWdVLpkvK+nn1msbLCvs7sayixOAQeDmpA5J/ffLHl15VvjljB++4znOpCRBft6o1qq25ZojKKSuHQNnWCAH3ZJ+X0Z4XrqNaiFw5+T3byW1dme+tjlv8J4fGtao0SqiU+DlCXTeedKI/JmAr+BCCmdQeJAOa6LHO64GFQP/8qv25fwLICQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(26005)(83380400001)(6666004)(53546011)(6506007)(2616005)(6512007)(44832011)(5660300002)(8676002)(8936002)(41300700001)(2906002)(966005)(6486002)(478600001)(316002)(110136005)(66476007)(66556008)(66946007)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGd1ZjExT2hJa1ZiUkw1MGRPKzBjRUFEeG5ndDd6OHFCQTRYbThYSjgrSThN?=
 =?utf-8?B?Q0ExZk5BOWk4OEp2TENIWVBSTWZUcUkvYzBDaytNMHNwampRZ2NESXNaY29U?=
 =?utf-8?B?K2tFUEpUWS81RzE2MHZlemdLNENGYmhxM2tDU2Nyai9ldkZKZStxdXdZWlpv?=
 =?utf-8?B?S0g4RnhRYlJEcGhTU2FQVFQrL3l6bkovT1lWWndPS1RJYjAvOXlMczVPS0Fz?=
 =?utf-8?B?cGVHTWd2Y3FGUE81OXhKVHB1VTBjV2xENUIzRjZYZndqZVVKNElCemxCaHdn?=
 =?utf-8?B?THlvdVAyeHVMdU9zTkpBbVlqQ2tnNnB6VFlGYURYN2pIRlBTS0xrM2ZwQWgz?=
 =?utf-8?B?eTRmM1JwMkM0VFBiVG1oaW02TVpjcW9iTUlHbWRocWZWbUM5OU1mc2pMaDJZ?=
 =?utf-8?B?Y0krMStJTUVmV1JNSE1JeUMyVnBiN3dycUZ1SzU0MCtKbmoxendCUm1EWkYx?=
 =?utf-8?B?d29HMVJtRmt5TjVnNlpCZFVYRjVCc2UwVFFxUGxUb1pWN1FHNHcybkNlUkRz?=
 =?utf-8?B?N0xXamtKYzF0ZEU3Yis5dmUxS2M1d3E2a1FESVpsTEZwQVdpUE0reHRodko4?=
 =?utf-8?B?dHlDdFczVGg2b2VSZE9wZ3B2NmRMdkJ6KytpcGxxN2tnSUt3VXRvVm9uQXFw?=
 =?utf-8?B?WXd3OFZRTkg3UVJQWlpwQVVpeEdLUGgwMVRwWDI0OUdoRWUxODVmZWV2SmFY?=
 =?utf-8?B?V01LMzVkNVhkWHowUkUvdVR1OXVjWE5vL1NzTWE0RjFtbjZxWmdBWGZUZnR1?=
 =?utf-8?B?OUcrMTkwY1FlVk1zMWF5ck1zZm5yeDlyRUN2ZmhnMFkrVzlwUDh1SVhxYjlt?=
 =?utf-8?B?czYxZ1Z2eGlyWlNaQnRRSWlqMUZZOHo0UG90dGdYSkd1SFJDSU9Ubmc0ZUZD?=
 =?utf-8?B?bXJ5VG01ZGpkOFptZlZ0RnVYZzkwb01HdDVmcHdHUStybStRTzhINjcvYlB6?=
 =?utf-8?B?em9ibGRucENQS1NCczcvUkpmRGR3aWUwdHBSSXZabUhzZDRtV05hYzRCUU91?=
 =?utf-8?B?UzdMNzFmajhXZ0V5RThPN3pIVzFYSU51NTN0SGhMYndOVGQ4UUJSajdTdGFw?=
 =?utf-8?B?OGNYeG94dnFtb2NuTmpYVWNJUUxMMEhDS2NGSGFsRWVkOW12eVMrbG9IbFZS?=
 =?utf-8?B?N0taODdZVWdqRnpLSHdQNEVlbXhxODhMUENiczF4eWxzaTBzaVdEc0IydmMx?=
 =?utf-8?B?bGMwNXFsOHJwQ05VRTdDWFR2eGc4Z3ZZZjY3bXpWcjc3SEt4YjZOQjBseith?=
 =?utf-8?B?N29VRWVoWUNIVEUrc1BOYnBkTEZHQlZSYXRpN0dQNmxFQitQdldMaTk4aVdR?=
 =?utf-8?B?emZjYk5ObXEwYk8yRUZ6QjVoeE0yMzNkVk5oUWFRNDVIY1liNks4TkJFKzNJ?=
 =?utf-8?B?TCtLa3NrZVhNUFg5M3l1aTZWRmxPRi9BNldyK283d3ZjWmVueGw0YTJZK3dz?=
 =?utf-8?B?bHc5a3I3bVlmelpHOFNXYTN1eHFQY0Zva2tVSmNWY2NpMUZBTTgzK0RXaHVi?=
 =?utf-8?B?Ukt2YllMK3k3NU56dWxCd0dOVlorR1FnbXVkWEdnZExHQk9CZ01xSmVibVAz?=
 =?utf-8?B?SHliYzBJWHdoYlZlb3hIVEJwWmxqODUrWitMM2VNbjZDSk13Nzl2T1hhb0xk?=
 =?utf-8?B?OExwa1JoWE1WbmttaGZwNU9YUE9zakNndDh6ZGxMdzF6aDV6STRQUWVaRmxG?=
 =?utf-8?B?VDNQQVpPVC95QStONUZXeTVGK2ZpYURZOUJsd2lOU1FacXVxQVFRNGQvbUN4?=
 =?utf-8?B?RGtNZWVJUlY2azFQTWIvbDJWZGNXT0YwcTZVRk5PU3VpNnMxZkZXRTIweXZp?=
 =?utf-8?B?S2N5ZTE3aXBGR2gyQUE2VXJ6NEdvUW0ra3liWnJITFJidm1lS3FYVGxwZkw4?=
 =?utf-8?B?Szk2QVBPOFVlR1VCYzhCeWI1TVg1UW83Sys2SVN0UnZOQ2pYcEs1R1JlNU1T?=
 =?utf-8?B?WGY4cWRSU0pWam1xMW1kdzNOdk5mRS84M0NxRTFvZCtoaDkyOHpZYmYyMXB3?=
 =?utf-8?B?MVByS0pzaHNzdnoxR0N5UVZsWWxZa05IeHhjMUpEUXM3ZFRjc05nc1pyazFW?=
 =?utf-8?B?d0FENlVZeS85eGVEMUJsK0xpMjduaW1rZk1qWXFrZlZ6eFNkTmxUZWx4WVYx?=
 =?utf-8?B?RHcwcTJicGc2bFBRM0ZoTmQ1TmVaM1V5enFFYzQ2RktoeUEvQ1NSUmtJWGFa?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	W4U/PZ/v7/ZFcJoNjAZFmoFW8cKvKb+DlB6o6dnpocYMmgprJf2aditJ9AbXYGYTxeeLU6y2ElPyEI0RTp6ix+CkNaWwtY8HIrxoWmC/iK9Za+zQJvs8piCA8RE5h4r6QGZCky4q5+UGnHst6FqUc5c5jGIKNGViAe6JnNDFUxCE0Jhe6sd3uBUdZRcrFAMt0PJaN9jOrSmd15ylpcKED/T9I/FBoTsCTjqoWkxB+5ahrn/Uvwi2TpbE8v7Tm3aj+kGP5PTD+sz0pYx9Ux8hzN98d5gCRoMdypWmYdV7jch8YtMY5Tk1+j+CszgScdq38+V5im4Iew0NuB5B4vU9Vwc3L9ItHP93HtK1HmF9pHC5+hI1IjQAjjqop69Yi/UIi3t3APgtI0oaWqUkALlFzyy7Ikc8ddWWqUgy/VqMJmLTYGzEmJJU9azjvGTDFPsgKU0Hz7TR4Sr7g24MGqPeNd8+8zfS7GRpEPgJj4az0G7TKjsNh39mdIPJI5qAppiLXIPPH4aC7FS3jecgg2N7Caez6rfEEaXY0U722c/9QYSzZ4V80f9BgXJ7H54zDLRYC2dM1CL0+uyxH+vhRbcb6Bf/ncQzssMubYEyJcajIwmSchj+duzEjt3Zp8Ov4cZ4qJlNapFjHvDLy2dsAttfEPagZJBlC5KHBE9szQ9W0o5+jOihF4XpIwJef0ECK9+ufK8btcBdRBO8K/07dQ4YCJg6r/3tYnPfl//oSl4sKXbZI3L+6ZholIO/Oj5fCrClKCwNGugLEoWDQ7ZlPgKJtBfPyu45zhTw/OImCRYJaoplabdTyTC2B0aD8sFxsy84
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f46d19-ead7-40f2-7d86-08dbe9c11ba3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 12:06:20.6115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyuMRenC+qoVJeQKX80ENIaKk5SHNEAEjBexnkB8L81l9WhvIqSqtSAd3M/L8Q0Y7xMuEbRjTksbcU3qYUIsB4I3ZwqOCHOn3KzbsCs9vi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5261
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_10,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200083
X-Proofpoint-GUID: WVLilwFxDAn2On7ZV84P_n2ASbmbe3rm
X-Proofpoint-ORIG-GUID: WVLilwFxDAn2On7ZV84P_n2ASbmbe3rm


(We already exchanged on this topic, but repeating it for the list:)

On 20/06/2023 21:30, Jonathan Corbet wrote:
> Jani Nikula <jani.nikula@intel.com> writes:
> 
>> It should be more feasible to build the documentation. Make it
>> faster,

When using PyPy instead of CPython to run Sphinx, I see a 22%
performance improvement on the kernel documentation, which is not
insignificant.

> A while back, I went into Sphinx with a hatchet and managed to take 
> about 20% off the build time.  The C domain stuff builds a data 
> structure of incredible complexity, then just tosses much of it
> away. I've never had the time to figure out why they do that or to
> try to get my hack job into a condition where I'd be willing to show
> it to my dog, much less the Sphinx developers.

I also profiled the documentation build some weeks ago and came to the
same conclusion: around 40% of the time is spent inside resolve_xref(),
the exact same C domain stuff you mentioned.

The gcc project/documentation has the same problem, albeit in the C++
domain code, there is an open ticket for it:

   https://github.com/sphinx-doc/sphinx/issues/10966

If we're really not using the functionality provided by the C domain
code, maybe instead of ripping it out we could provide something like a
conf.py toggle to disable it? (The idea being that the patch would be
smaller and more acceptable upstream...)


Vegard

