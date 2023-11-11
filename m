Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A44DD7E8AEB
	for <lists@lfdr.de>; Sat, 11 Nov 2023 13:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD211F20F26
	for <lists@lfdr.de>; Sat, 11 Nov 2023 12:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462DC134CC;
	Sat, 11 Nov 2023 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pO2ZaIix";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O3t9NTCf"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3B134C1
	for <ksummit@lists.linux.dev>; Sat, 11 Nov 2023 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ABCdbhQ021448;
	Sat, 11 Nov 2023 12:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : cc : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=1O2ErbjBEV2s1eIUqZ3osCemaXJyyiKdKRv+Kvfkb2A=;
 b=pO2ZaIixNIqXJOpJYnpxamcAe6Tv25MF33kWgwGh/01XiEo1AycUGLnddqjjOSbQZeqv
 47ug9LV04GMzVEMIw7nklWo0GBqysCGfMJzso1YQpoGwgSyqCpKhAtTynYDAX1kiTXmV
 mg1loEWf+JUCu58oD0ZxAScN22o4M5lnwL48xVUM+ZzPppSaw+5VhDZR/hF1Fg97bG7J
 3LAFmMc5IaQvEjpbuBuCsOeCx2rHUtcdj/6/hOZltp2Xb+r3dZnmttDiaOkCXklc+7QA
 6csTXWhGnbhvSE1Kx3CPeP2JyrZoGBW2gKmsF3WWjJUWVBFM8qqgPNCKcFOyxWnn/Hql QQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ua2n38cnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Nov 2023 12:43:33 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3ABBP6lE017637;
	Sat, 11 Nov 2023 12:43:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ua022n5kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Nov 2023 12:43:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWIT5QikQQ+RVNABssh+rNc+J8JBp9aZPp17315j0ipes0Odlmg1VLUNfh/3EgB53vUIwmZ/l1Xcnr18Z1ABh+O7Ub6sbETLlHzeom9FpIhLm7fR0T+D/s6IVvz5lotuv8LEmT0LXC+F115a4vJOBimmLd1rYg0oZJga4dtztNljgsN542OHVRpxiCmWGJiy6LshLM+zdhIaYz0ZNfQRz2jn8ayE+bGE1vvgOEr7hnXwSXj989sPln+3Nq/eF4qttp7qqa/okCcqBpevpKDuXBsSQHrD3pV0+q4yeM8fdMpKFRt5/LWbUPKaM0QSwRHJwdxv4JFIke6pspsqO0gCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O2ErbjBEV2s1eIUqZ3osCemaXJyyiKdKRv+Kvfkb2A=;
 b=WgmgLCZVf6rnAlg4lVmngYBY4bA4rP86wDB/SuBUG3zLo3pKVNvMFdB9BamUeRSrGphAW9UYFyIXphrILz6WamTtAFb5uU22voEAPoAREq0Tga2XZ0OHEmCqHsoY3xZyDoxCdFooaJkiUIpcv2w8WoFKUMg5P/n1ZSbn0asFtyE2c0z9KjgTMDC4DDlO7GMuZ6pn+Xwde1vOfSby0Cyyu74N0YBBkV65pezFSPkpS4Py+NfP/M6id2atsttHcvNzGoqU+/W1MjeU1ZAu+xKgbIR4L2umKH5BoWjhiW3cVOJq4deGOhpbelVXArvd+AEhDYbuB9uAXbiNpbYdgFjOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1O2ErbjBEV2s1eIUqZ3osCemaXJyyiKdKRv+Kvfkb2A=;
 b=O3t9NTCf508+CJl28fjUnA2IK2Iqx4Rx0VF+0z+Jt+m8GLv78yW54Z8u0s9gxagGZxaRaAoJI/CMfMVS7R3bI6+uWcQgU7pFXAx3+YuILdSSi8WwjpB4ib333+Eh3jvkf5vMMH/M69iuolNCPniikRWyE9lJZhA9/JAVNC7lF3g=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SJ2PR10MB6964.namprd10.prod.outlook.com (2603:10b6:a03:4cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Sat, 11 Nov
 2023 12:43:06 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::c402:ff32:c3f:deb]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::c402:ff32:c3f:deb%4]) with mapi id 15.20.6977.018; Sat, 11 Nov 2023
 12:43:05 +0000
Message-ID: <e79d53e2-4a1a-4f7e-850c-7f412ba43d35@oracle.com>
Date: Sat, 11 Nov 2023 13:42:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Kernel documentation
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
References: <87fs6rxppz.fsf@meer.lwn.net>
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
Cc: linux-doc@vger.kernel.org
In-Reply-To: <87fs6rxppz.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::20) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SJ2PR10MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd75642-16a6-4820-1cf6-08dbe2b3c00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ys1ghzxVT8R90kUirsz9GWyp8k6pZ6+kPB6m7qgUv+wsYjhxlQGEk6WccukP2J4KHTslWNt03jyzQK8zlWO5pxpF9dCtANpSVOSOM66CUvxONWwbZIyjKM/XUMYlA69jkDuJuhk6J5HXnYTF+pK4YJT+Y6taJE/OcykksXEhAczUK3rbRZWzCdh73x0nrxpZmChBb2kg6h9x3SOerwLWPg2NzFAnACp7TTFcjLjsGYs/xz0dgRYtSeNKSf2pKUYLjuVDTCpCkfNzO57hxHqoDoYxtsv4QEQgaunYAHQTjGowAXlgQvCyNkACi/jjGoIPW//2QMNqe4+X2ksI7hoGkblvAc5DUxm0waPVAmp9ioX7M2AILXtChfnrw2PVqWX1FUZRDKQOKetfVuuEuhKZM0lAN7hYXpN95R0UX8KgLU7dvBRbg1SF2XxB8bsFVff5Ju/1+oGFT4nCinllF6Z+v/mU2A980p22bNTHpCMq5HdfekYOhmMUg8Z5W55SAwP3uHIxgqwQc0sh2QqIAjv1m0I6Xp/UeLQMlt6zAspjOxguE/z3IVeXXAp2QsvdCc2nk2AVePNQ8uK5spy4btPD8EgBvql79iBiJQDm3CPx7j5iyUMIaY7c2+BkTzNt3Cul3pXuoT8NHuEtarqr++y2DchFWmg6s60qywUGkVbxpPs+/yWcPxNcFF6cjp0sxCPmqRT1eHZbhA5tnH9SQ6t52ittvLFh6Bnu3obG6QHRWOc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230173577357003)(230922051799003)(230273577357003)(1800799009)(186009)(451199024)(64100799003)(66899024)(53546011)(6506007)(36756003)(478600001)(6486002)(6512007)(6666004)(26005)(2616005)(83380400001)(44832011)(2906002)(31686004)(66476007)(66946007)(66556008)(316002)(86362001)(5660300002)(38100700002)(41300700001)(4326008)(8676002)(31696002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UHM0OUttM1dicVREcUVrR21BYytxZmZVZjNpeUtqOFdaa29GVG1CaDEwUUdN?=
 =?utf-8?B?SFFSVUtKcHNJOTNKcnhsZjB3N0xIbW5KRW9xTVlnUnc1dFpBeWF2ZDVlbmpH?=
 =?utf-8?B?dzJpRXlpS2RDU1dmNDlzWk5wbVRlTlkvSW9Jbk9adW9lSmoxQzYzY2k2N1ZX?=
 =?utf-8?B?TkZMTDlnVWVLTlZxejZNYlpPek1ydk53Uk9POXo3L2F3Z1pGNzZtWlVOKzJt?=
 =?utf-8?B?azZFdDdmMDZ0VG91OFRhZ2Q4N3Nmc3RDYWNnZVIwd3dWOE1HTGd5WXQ2Y3cr?=
 =?utf-8?B?L2tHeFNGdXRTcmxyOEJlRmtOVFhjVnFweTJPU2RkdGZhL0xQNUY1ZXdXRm5k?=
 =?utf-8?B?OW5sa0t6V3dQNmlPS1czRE94RjQrSEdhS1E0cFVOY1pPR2UyQVR6S0VCTzZq?=
 =?utf-8?B?YUpWOVpLNmI4TUkybWdLNmltV2tvdE1qRUtjWTlYeEd6b2VZdTBXOTVPSHll?=
 =?utf-8?B?SWdKUGptbzBmWGs4S1phZ1k2dWUzSGZsUkU4OGUwelM4T3RQVkcyd3ZSTU5E?=
 =?utf-8?B?QUM4MnUzRjYwZkdaM1BkQ29FdkRQYmJka0RpdGNWWDZHY3l6QnVIOVVmTy9L?=
 =?utf-8?B?YVl2S1Q3K1BmMVlwZSt3WHJEZllrVGNjdTdrQTAxRFJJdmRTaFBtbzE1MEhQ?=
 =?utf-8?B?eGxsTDY2MWdFL2V6WHNVUE5iU1pLQWxmTFJ2QTltMjNrWlF1YzJDT2dCdWg1?=
 =?utf-8?B?aEtaSmQyQU1PVkRQdU12RHVodkUrVmlZZmFNNkZITndQeU1lWDBJd0lBMUpr?=
 =?utf-8?B?MUdsSy9IekdIbm9DK09DY2ErUWRUbzduSm9obFNNOFJHZlcrdEc5VVg5bTV0?=
 =?utf-8?B?QXQwUjlyaXpPWWlsKzkwdmxxWWRkaHhEMFg0SGVoVmxNRXJaSGRkamVOYnVJ?=
 =?utf-8?B?UXhPOXBzWk56ZVlONmZDczQzaHV5aklpYktvNEJ3WDlIRThJS1JwSS9jVDV6?=
 =?utf-8?B?R04zanpVdHpKNFFtci9IMUlzT2RoZkx1M09KOCtrVktvaVd5cEcwZjNDcGli?=
 =?utf-8?B?RkpiekFoRlJtejgrTU5tUnpnYW9HQU1QRTNIQ2FjdmpqbzJqVlFZUHhPWnpt?=
 =?utf-8?B?TWE0RHF0ODcreW9ESEhNR2JYU0h0T3FoWk0yUEcxRmlHWTA4RjAvcXB2aWZN?=
 =?utf-8?B?T3psWXZEOEswejAxOWpjb29iUGd3dlowKytNTkcxOFNjWW9Tditkcm9jb1A2?=
 =?utf-8?B?RDE2WVdVUEFQK0pNaUJ5R2NzYzVuQlJXQ3NsdW1SUUlWM1V1RUVLbnRmOVhC?=
 =?utf-8?B?UTdGT1YxaktnRmVTNTB0VlBaWEplcExpdEJKVWh3VTBSdEh0WmxCS0h6SXhr?=
 =?utf-8?B?eXRLZU1sOWZmSGhodEZhS0NjREtCc1cvL0pzWVNIcDZFWkMzTVV3WllYVGJm?=
 =?utf-8?B?b1U1OU9TTnBEUjdvaVIxWkp2MDB3Yk1IS1QraEVEZVRaa094R2U1WG9xcXkw?=
 =?utf-8?B?R3J3UmdYZUwxL2lPdkxIZVlJamUxakpXcS9Ec0dvY3VPVDZVK25rOXFKQ1ds?=
 =?utf-8?B?QzFsWVNlanVadmlHQ1NvNit3aDZENlBNSGg2TEZIaGhRL05EM1YzVlFFTUlZ?=
 =?utf-8?B?cTVDaEdTT0MrMWVwVEgxVEcxdFpoMVFiYXNHZVlWNDFGaXc4dldSTjFMUnJF?=
 =?utf-8?B?WWtxanpaUUY4c3hjdEUxSEdTZzAyRndjUGJsbUxKNEV5cjBISllzNzZrQ0ZM?=
 =?utf-8?B?UkRPRWRSY0t1NjhXOFNubjBWWkszd0VrenlVb0JkSVhheFo4bzIrY0JlVGtO?=
 =?utf-8?B?Tm8rbjVZaTRneVZCRUlMTzlId0txSlY2dkJybDJ5ZTM5S1FydXhqTHJvbTFx?=
 =?utf-8?B?RmlvQjNodXBucFVVaGRGTWEzYkJaOW5jTGNEU2JwREoxcTdwc0hUempFcVlp?=
 =?utf-8?B?UmtMK1ZHMEhZTDBiODk3MVFLMG5QYlZqNmZzZm5wampXWDBMSkdZOHQ3OU9q?=
 =?utf-8?B?dFdKazF4bVg5VVIwbEQxdHpQbVVWUGlWNXBxdVM5SngyeGE2VEVHd2sycUkr?=
 =?utf-8?B?eXcxR090cjZkMkh6Mjlkc3ovSVloamV4bTlVNDBCS3BoOEJ6Y1JNWGhsSEx1?=
 =?utf-8?B?cWJldW5CUnpNcTMyS1U2RHk2anBEMEFsOHRCNmFlTWpOc2Zwa0lXNDk0c0Z2?=
 =?utf-8?B?L0lpb1IyV3YxRTVEYStLTlJxMlcvU0huc2FsN2ZLS2p4YmM5dUdwcmNYQ3kw?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?dGVVS1VxWmV3T1BEM3E4SHFrMWh1MVF1VnVEbURLdDBPbzBuMDJVQ0s0Vmh4?=
 =?utf-8?B?akxHbXlLcENEV09FTHhFWnYyQkdPRmM2NnlYVFYxNzgrZE9KWUo3Um9WeHpI?=
 =?utf-8?B?Z3ozTlR6OFV0OUIxYTErQWZ1d0NiUjZUV1UxU1VWS0FFVWZQZ2VxSUEyaEcw?=
 =?utf-8?B?Qk1oVThpZWlieS9vRjVjZlBwZ0gvNXpleDlWSjhrK1dtdk5NdW5mdW9iYXZL?=
 =?utf-8?B?VGUyb0djSVhLelNFYVYxcUhxdmZZZEdVeTE0eTgySDJMamNJQWRaMmxxT2hU?=
 =?utf-8?B?SG9LR3Z4V09GMDloMjZvWWlOQUV3cjVQaGFEb1VUYWE4THRMSlNZVm51K3R3?=
 =?utf-8?B?RC9xOVFua2VSMFlsaFdxcGM2Ymp1dFZqSmQxTFIrYUVLRG5yS0JpNzhkRy9z?=
 =?utf-8?B?SmVwVG84cDE1U1h5ZjZzNnZzQlRjajFHM2dEbWhtb1d4R2NaZldtejRWK3BQ?=
 =?utf-8?B?QVdIUGV5dTZ6dk5XR3NNQTBiaU45NDZPV1gyTGRPS0EvUytXdURySnJhMHVT?=
 =?utf-8?B?NjdFVUYxWW9xNVRxQ3M2NXRVeC9Dc0JLSHZiaFBKRGxGcmhsVzAvdDhJK1FQ?=
 =?utf-8?B?YzJXN0cxU0JTVmplcnVQam9TcVViY1djMlBjVU5rcVo3ekhVNDVwaGd5S29Y?=
 =?utf-8?B?MjhldnZoM3FQSzh5dGVwdWRieitRZUp6V3MxWGZBRldmL0htZTI2MkRlcVBT?=
 =?utf-8?B?Z0pmZzVab3hITStGOHA2TlFkdjRjOVpxODcyeG5hWGd6T2gyYUJSUkNCZUJM?=
 =?utf-8?B?WXlHaTZiOER6WERHa1c4bVhtRG1Hb2Z4TkR0R2JmOWtiYURaME4yNUplTDZl?=
 =?utf-8?B?QTZzRFNRS2ZmQXFYRWlFaGNSZ2hWdzVlSzd6ZGZTdUhuSGRHbk0rWWE1TzRE?=
 =?utf-8?B?S2lPM0dJMU9rSDZtOFM2NU5UMis5YXhQVGlOSnhBcno4UE9Bam1keEhxL2pD?=
 =?utf-8?B?dUs1WHU3bDQyb1duYXlyMUlVTFBBOE5DalJLK3p4cS9KWEVYV3QwTkVESEd5?=
 =?utf-8?B?KzJPQzNrZDYwSElPUzdiQzJsS1NITlNVZWdvK01FS0hhakprdlZBTkRtTCsx?=
 =?utf-8?B?b3hvZjNXOWtTK2gxY1YxUytWNEwzb3UyN0FHNTYyODB3OURjSzNmdmtRN1ZV?=
 =?utf-8?B?bWd6TTRqTFN1T3RveWgwQVVWbTRrMGttVHJ1bVhpVFAzWlFEYUZqQTF4b3dX?=
 =?utf-8?B?M0hveHFVQnBpSEQ2bCtlYlBrZWhIb1NFdE9IaDd0S0hZcld2QkpiSzFPVHlv?=
 =?utf-8?Q?X99tcXH3ytVOroR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd75642-16a6-4820-1cf6-08dbe2b3c00f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2023 12:43:05.5050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckH6OC89El26jKTbHbV7B9oZ4n023BwP2xSeQBL7YcEo9NNC4YF6zF9exYrehzDbYu9//yvvuDn5Kp91J2x8So30T7zEtLINi4TUj/6zBOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6964
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-11_11,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311110108
X-Proofpoint-GUID: SDlW6AZiD37S99yPpfY42srbmqp5JypF
X-Proofpoint-ORIG-GUID: SDlW6AZiD37S99yPpfY42srbmqp5JypF

(Added linux-doc to Cc and a few people to Bcc)

On 16/06/2023 19:48, Jonathan Corbet wrote:
> The documentation discussion at past kernel summits has been lively, so
> I think we should do it again.  Some topics I would bring to a session
> this year would include:
> 
> - The ongoing restructuring of the Documentation/ directory.  I've been
>    slowly moving the architecture docs into Documentation/arch/, but
>    would like to do more to reduce the clutter of the top-level directory
>    and make our documentation tree more closely resemble the organization
>    of the source.
> 
> - Structure.  We continue to collect documents, but do little to tie
>    them together into a coherent whole.  Do we want to change that and,
>    if so, how?
> 
> - Support for documentation work.  There is nobody in the community who
>    is paid to put any significant time into documentation, and it shows.
>    How can we fix that?
> 
> - Infrastructure.  Sphinx brings a lot but is far from perfect; what can
>    we do to improve it?
> 
> Other topics will certainly arise as well.

Hi,

This is coming a bit late, but I saw that there is going to be a session
on kernel documentation on the 15th [1] and I wanted to contribute a few
thoughts before that.

First of, regarding the structure, what is the best way to contribute
such changes? Large structural changes would presumably be a patch
series potentially touching a lot of documents from different subsystems
and the individual patches won't necessarily make sense in isolation.
How do we gather consensus for big changes like that? Is it better to
collect acks from subsystem maintainers and then let the documentation
maintainer merge it all at once? Should all the maintainers be Cc'ed on
the cover letter and their individual patches or do they want to be
Cc'ed on everything? What if one or two maintainers don't agree with the
overall approach, does that block the whole series? Does the
documentation maintainer have a veto?  Or do we prefer trickle of small,
incremental patches, going through the individual maintainers? Ideally,
I'd like to see these questions answered in the documentation
subsystem's maintainer entry -- it has a paragraph about the boundaries
of documentation being "fuzzier than normal", but it doesn't offer much
practical or actionable advice IMHO.

Speaking of maintainer entry profiles, for those who aren't aware, here
is the description from [2]:

"""
The Maintainer Entry Profile supplements the top-level process documents
(submitting-patches, submitting drivers...) with
subsystem/device-driver-local customs as well as details about the patch
submission life-cycle. A contributor uses this document to level set
their expectations and avoid common mistakes; maintainers may use these
profiles to look across subsystems for opportunities to converge on
common practices.
"""

We currently only have 7 of these and I think it would be great to
spread awareness of their existence so that we can have more. Please
mention this if there is a room full of subsystem maintainers ;-)

I also think it would be great if we could amend these with
subsystem-specific review checklists. I'm thinking of very hands-on
code-technical things that maintainers will be checking in all their
incoming patches, things that aren't obvious and don't necessarily show
up easily in testing -- things like: for new /proc entries, is extra
permission checking done at ->open() or ->write() time? (This is a
non-obvious potential security issue.) The idea here is for maintainers
to document how they review patches to _their_ subsystems and thus also
make it easier for others (outsiders, newcomers) to review for those
same things. I know it would give me more confidence, actually both when
submitting my own patches and potentially also when reviewing others'
patches. One potential issue here is deciding whether certain things fit
better with the Core API and Driver API sections of the documentation --
for example, should subsystem-specific lock nesting orders be part of a
review checklist or does that belong in the source files themselves? How
do we avoid duplication and things getting stale? Can we add a new
kerneldoc directive that gets collected from the C sources and
automatically put into a subsystem-specific review checklist? (I'd be
happy to try implementing this, if people like the idea.)

On the topic of the overall structure of the documentation: [4]
describes the idea that the kernel documentation is set of "books" --
user and admin guide, core API, drivers API, userspace API. I think this
needs to be emphasized more, as that _is_ the (philosophy of the)
current high-level organization of the documentation and it feels a bit
hidden where it currently is; maybe it should be placed prominently at
the top of that file and called "Organization and philosophy" or
something. At least I was very confused when I came across a passage
that read something like "This book covers ..." and I had no idea why a
kernel document was talking about books.

Finally, I'd like to suggest a number of specific structural changes:

1. the HTML sidebar is a bit of an unreadable mess, at least with the
current alabaster theme (the sphinx_rtd_theme is better in this respect,
IMHO, but that's a separate topic). I think the top-level front page
sidebar should _only_ contain the "books", and then you can click
through/expand to the section that you need. As an example, the
front-page sidebar is currently showing firmware-related documentation,
which seems quite out-of-place to me. In a way, we should think of the
documentation tree as a data structure that is optimized for lookups,
and it should be balanced accordingly: each level of the tree needs to
have an appropriate number of nodes (fanout) and firmware belongs
somewhere deeper down. The "books" are a good guide here, since the
division essentially asks: are you a user, a userspace developer, or a
kernel developer? and would allow you to traverse one "level" of the
tree without having to scan through a dozen different sections that
conceptually belong _after_ that first question of who you are.

2. some documents currently exist at multiple places in the toctree. As
an example, "Core API Documentation" is available from both "Internal
API manuals" and "Internal API manuals -> Kernel subsystem documentation
-> Core subsystems" (i.e. both Documentation/index.rst and
Documentation/subsystem-apis.rst). This is both weird and confusing from
a navigational point of view; it's as if a real book had 20 chapters at
the beginning but also the exact same chapters nested deeply inside
another chapter somewhere else in the book. We should be using
cross-referencing instead. Moreover, do we have a way to detect these
multiple inclusions (e.g. a sphinx-build warning)?

3. I'm wondering if it wouldn't be appropriate to have a top-level
"Community" book (maybe even the very first one) that would detail
things like the CoC, mailing lists and etiquette (but not
process-oriented details like how to submit a patch; we should link to
those, though!), references to IRC channels and social.kernel.org,
kernelnewbies.org, maybe eventually other things like governance
structure, etc. The main idea here is to put the community in focus, as
I think that's something we're lacking slightly -- the kernel community
is large and diverse and in many ways highly fractured. Many things are
not written anywhere at all and other things that are written somewhere
are maybe scattered all over the place. By having a dedicated place to
put community-related documentation it would show that this is something
we actually care about and make the kernel more welcoming to newcomers
and outsiders.

4. "translations" also doesn't need to be a top-level document that
appears in the top-level sidebar; in [5] I submitted a Sphinx extension
that would add a language selection bar to the top of the rendered HTML,
which would allow you to change the language of _any_ document that has
translations, including the front page. I'll still need to submit my v2
of this.

5. I think architecture-specific information should be split up along
the user+admin/userspace-dev/kernel-dev lines and moved into their
respective books instead of being a top-level document. This goes
counter to the idea that Documentation/ should mirror the structure of
the kernel sources, but I think it makes sense to make an exception in
this case.


Vegard

[1] <https://lpc.events/event/17/contributions/1622/>
[2] <https://docs.kernel.org/maintainer/maintainer-entry-profile.html>
[3] <https://github.com/sphinx-doc/sphinx/issues/10966>
[4] 
<https://docs.kernel.org/doc-guide/contributing.html#documentation-coherency>
[5] 
<https://lore.kernel.org/linux-doc/20231028162931.261843-1-vegard.nossum@oracle.com/>

