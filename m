Return-Path: <ksummit+bounces-2456-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E349BC8662
	for <lists@lfdr.de>; Thu, 09 Oct 2025 12:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9203A97FE
	for <lists@lfdr.de>; Thu,  9 Oct 2025 10:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5002D47F2;
	Thu,  9 Oct 2025 10:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="IZvvvOhG"
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B135C1EF36B
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 10:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004251; cv=fail; b=HQKMmI8WgN/T5vWQ2tIEATrWX64HH6alMbAxXQt7+lSmjXejDmmDX4zRHolrl1Rh5p8p8ptyJBX6Qbmyb+C5C6k8LFtcSihkEVXgpTq8a1MjlM0Hd7scOYFprhFTit/yxkgSBsH3ZYlEMT06/07Kz9BS/DTeMp68e53QNKNwZdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004251; c=relaxed/simple;
	bh=aGYGVy9w2vx4HKCmyC0c+ZM+wrX8iQ+42A3lBUNOi8U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FPRfghzJPXZ5rBDsVPgKlU9rqKDSRoFz2hOFyB6Rc7V0ZQAbb3Ty7YNtECDruhN6tSOKVLo/GvnS0NqZKAaMnS6T41L4cgV9Ls9Q7E+kSJ0bLXhhpU28fT+/VjIzGoPGxeeEKoMniEBRTDmqKlN1MMsrDIIluT12p10byq9XmX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=IZvvvOhG; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5998AaT93668294;
	Thu, 9 Oct 2025 03:04:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=hJNeiaNWj2kLQMj/0uJ79KgS/w+igPyPRmISqI9+x1s=; b=IZvvvOhG0jMt
	L2rPS11ffiY2n+9ejSjjjoZp0S+SLZw5I7myl90cfIl3EBLMhAhklvlWjl2GbA2n
	l3SU/TOiNfXdjy5Gxazbe1NLuEUwYgInwZOZ8UGcqNOzw5L9TzrIcG+IZa+DMu3Z
	/xzzEhdcN/Q/M8/hqkNsSaEPp0iO0WkRdYsTQIrCBEBHpCYJ4agLkCXR2O50SoP/
	WOLnprjNV03Y0OsDlH204I7MNb/D83BLRcOXafzTDjMxo8o1HWF4VIHX4RtdAkNS
	RCajNe7V9rn/g2z1cYcpJ/f1Y0zQQ2HygdaeNEK3ebrbHJlYrgKGl1drdPPgVhcB
	Ns8dmlStpA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 49p9adgsnw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 03:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U536CJBLKOSeAWFFyuOHhqomEojzmZZL5zeHB2+peAjR8BaFkRrz4yXt2u5GrlehiVPaOacuW1aORQpynR9nXzAzoDigROdj1fZrV5e0LG9Ew0j3FJzjoZ4F/QjwzIAeLH+e4XMmU+XEdQvNg4zelF2XZNh7+hd9A0Q30uCUmzH7beKHlpceiqS9GTsRuUv3G7DAA+Sy5b2XJfBmXnR69YT6LhVs9updFnTEnLRn8bJkvTcLZvgvNpiB2uGlSJII/240pyXuPtVBhH7j1ebaezAGKzcRXXWE90wAHfj32q64Rte8WEBxvgkLlsBavmiIvyMiloFSz2EO5i5ZhB54gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJNeiaNWj2kLQMj/0uJ79KgS/w+igPyPRmISqI9+x1s=;
 b=dNeU3tY3W/pUDAf4tKawEUAsM8MHFZGShEQzCn2f1f9rjsU4Lx4Wndl+ijCLlWtJB2k+KFwU9ixyKfzFxVisNBVtDWQv2zn56AGRXQh7G6zChta7oFwvVRxqfWh1Qk54wPqh3yq2wribRnBLUpaRHLmnQVI+AV8XpHvJnAj5UC0l1A/icgXSCh+t5SD+rO8MWJVEK6CfOR9tKP41lNn1h9Zfe3gjxy/EU4+K79Ij5DBtm1KDQ18+YNSMlXAelQFjYEqkV9bBNqSB+C7UDyvJeLQqoZNUGSiK34r8rrqujm3bTX7lbtFSBoQMeo5H69GYGF0Ii1j2uUU/g2aJQ8juLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by DS7PR15MB5327.namprd15.prod.outlook.com (2603:10b6:8:72::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 10:03:57 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 10:03:56 +0000
Message-ID: <d4f98276-ab5d-43ca-9662-017420154e4a@meta.com>
Date: Thu, 9 Oct 2025 06:03:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Bird, Tim" <Tim.Bird@sony.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov
 <ast@kernel.org>, Rob Herring <robh@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <20251009091405.GD12674@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF00013E01.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1c) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|DS7PR15MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f42b068-4c1d-4d4d-d821-08de071b28dd
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHhjSUhGclcwVElnQWFYMnREeXk1OG9wVmQ3T0hTYk92ZFpjTGxBemhVMmoy?=
 =?utf-8?B?SlFEMFd0TGpna29PdzBXN2R1RzgrdW52UzVRL0FNVHhReUx3NXV0dnNJaVlV?=
 =?utf-8?B?U3dUS3Y0Q0haam41S3pxMEo3d0NiVkxnNjc3aXJKaXZNWU8yUmlrQVQ3M1Zp?=
 =?utf-8?B?c3ZHM2FFaEN3L1Uxb0RSbW5yR2c0UElPVzFjY0dvOXl4UnBJRVd5MXpZM1FU?=
 =?utf-8?B?TVo1RGgvbDVDNjI4bEloS1lnbm9zU1FWcnVWSzRYOEFVLzJDUDJXb3B5Sm14?=
 =?utf-8?B?RkFmOGRjVDJudnZBbEJhWjl4RDVaTWo4VkdNaDN1R3A3bVE0THFoNkJBc0Nk?=
 =?utf-8?B?SGlnRWl3T0FKcTdncjRxT0FmVmQ2bkVpRTN1eUNGZlBKQ0NTcHFqaEVSWlJX?=
 =?utf-8?B?c0lkSDNaSjRWYmp5Vi8zUXpOYUwxV2RCTXhsYUJIS21KL3JUWEo2VXMyZ1Q0?=
 =?utf-8?B?R2lLaU9rK2g4SHozOUxDZkswdGlMcnZzcU0wdGdxQW9pejNMVjBoYUFBYTNw?=
 =?utf-8?B?Ulh4Vy92R2htS2VvTlU4Vi84NjhWMyt5NjJ3UERqYm5WcmVDZmlkREVxSUNu?=
 =?utf-8?B?UkQ5azhEclpGRGdRQXIrWkZtdTVnQnBiaFlXWXRPaWdoVDFOTDQwU1cwYTRq?=
 =?utf-8?B?R2QxTHRhVmNzUHlWTzlWeVlYVWxwU25OZlROUUV0dW9CdWhIcUNDeXZwRWxy?=
 =?utf-8?B?YVB0RFFLNTV6eHRHcUcxaTh3cElNbjBLTTQrK3FPTGd4eUF0UWV1WFFVNU5B?=
 =?utf-8?B?YXowOFlWYUNXZ2ZvVGpaeUdDU3BRc0dEeWRsUnVnSEhuZi9FTXEwRnBWUDJR?=
 =?utf-8?B?b0JmOXVQbGcrK1YwYjE3a1lyRnJ0N1ByN2RsNWpNYzdDMWU5Ylo2MzZJQU9W?=
 =?utf-8?B?YUdDRm9DSzN2LzZTWnlkQy9yN1hqYlpzVEpvK28zZVphV1lmZkx5dWJhZnhW?=
 =?utf-8?B?QkE3SFUvZHUzRVRiYkpacG1oZzNsN0E3UFR3dncyR2VUWUxMZ01xTTNvSGE1?=
 =?utf-8?B?OXg0anIyNGR5cnlVc1cwaHJLSmRtaTZJWlpYOE9TZGRid0c0dnlUR2NhTnRq?=
 =?utf-8?B?MHlDQ3B5bXRBaG1SMlJYdFZ2aGN0SEsxOWYxMFQ2dGdTSWcyZGk0OUVCUG83?=
 =?utf-8?B?TFJJSUkveGRBTmJESzdJcmlvK1I2NmhhUXdFSldBQkFtN2szV2R1N1IrR251?=
 =?utf-8?B?SjdDQmVEMzZxVWdXLzlzdzV3NmR2ZElDTVRZbzBPYm10MzFjeEFsUWxQTHpJ?=
 =?utf-8?B?dVN3UUJ0VmRGengramR3dlZ0MUFIOWhVY1d1N05hU29ubDdYVTQrSWpVVnZh?=
 =?utf-8?B?TStoN2xXREhtSEEvUkxMR3pqRUxYd1JyL1FiYjRJOFFCZFE3djJ2N2NldnRt?=
 =?utf-8?B?cG8yaFNDMnlGT0k5SEFCV2VkeWxFQy9UNHNEQzJRQzJRZ2IxZzRxY2ljTHdV?=
 =?utf-8?B?YjNTa2pmOTl1cDkxMCtwdHQzYzRkbmc0eUg5WVFZZUhoNTZYVEJRTUZMeEIr?=
 =?utf-8?B?QTJKK09uQUtHZlVUU2ltcE9LWlc0cUJnY2xjS3NaMC8ya2NobmFTT3lIV1p5?=
 =?utf-8?B?V2JVanphVmRSRzBtTHVqa05kSjBZNXRaTyt2Z013ZTVRWlRBMXhuQlR3RXhk?=
 =?utf-8?B?cWVVZ3ZQUmlzbnRHdFV1N2RkVGpxdXBBRFZNZmovd1Q3WENQOHovT01oNFAx?=
 =?utf-8?B?bEpMeDRXT1cxMUV3Y1ZnNG5NQVhyQXlSZy8wSEhPaTNmM2xHa3MrMng5RHNW?=
 =?utf-8?B?aUdqcU1jdG1wVGl2SGlDYkgyZzFjVk0vR1k0Vm5QUWZkQnRscUt2ZjVLbW9Z?=
 =?utf-8?B?SjVRcW5WcTZ0UCttUEtaSDlOUThQOUxDejZwWlhrQW41cExsK2w4cytFdmM2?=
 =?utf-8?B?V25tN0RxLy9mQTlMYUo2NEkzSlFSN2NBekVxUHB3OEt5bkwzYWpDVjV3Slk4?=
 =?utf-8?Q?jGV/ZUpBavzBMp6cFswojlno63mb+AoA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2VYbEw5bGE4Y01pVlpFYnNNNXRFZHRobzdJelRLeVFKakpZTmV0ZytuZW4v?=
 =?utf-8?B?ekJmYmxKaEZFYStPK3NUNlFMNjFLRlJlcFd4dE9WaWxCOVJkUnlYcHpVY28w?=
 =?utf-8?B?NXZXZjlYTVpVQ2JCRnpwS3dtK1lPY2FDWHNwcmwzWld6MkY3WDRmZ2w0bjRt?=
 =?utf-8?B?QjBjS3RrSURWanpYNFFENGcwTmgxSVh1Uld3YzZVZUVxd3RoRTBlUGtYM2c0?=
 =?utf-8?B?MlRLSEJCWFJCMnJDRlpoMjV0M2dadkZKUVNRbGg4ZHY2YUdZQjA0WFhsU0NC?=
 =?utf-8?B?b2FKUTFOT0N4clhMdXo1WXpFdk4wMGhDTnJvcGJ3THBYb0hBZjhTSDZWeXF2?=
 =?utf-8?B?cHF4R09oM0Q4YnpnQmw3dFZUM2twQ1E3TytwakVJM01hbWZZWFhWODlVTjVJ?=
 =?utf-8?B?QU9kc09VODlmRVZQK3dhVHNwbE5WNHh0Z1ROaEFwcXEvQjhWT0J6T2s3cGdq?=
 =?utf-8?B?L2lER2Z3SjNaRnBaTW50RG9EVHhwbmcrYmdUZW5HZms4WVA3dzJFVzgzMnlN?=
 =?utf-8?B?Wnk4Z2RiZnoyZk9kR3d3ZG9Nb2J1TE5JZGlySzZzVjBqc25IVGMxQUFrSml6?=
 =?utf-8?B?N2ZqR0NlTEtrUUNEbmdSOGFxNGg1YUwyUG5xUldvdzRyYkRXMlA2aGJDeVhX?=
 =?utf-8?B?ZDZBUWNJTjYvWXQ0MnNlRzBVS3RYYnUrdVNxL2ZzdmhmdEJVSjBuYXJJcU8z?=
 =?utf-8?B?TEJuK243NG1nZ2xEcVlGVGdKN1RqbGtJYXBIUW5kUVlPSVFhSm5HTmF1Q3gr?=
 =?utf-8?B?aHpiV3JMMmFhRHM5Y3h4NDVoZnM0eVlmc0tyWWR2d2dKcWdNWGdrMnh1ek9t?=
 =?utf-8?B?amhNbXRQSkFZdFdYWGEzNlpIT2g3VXJTdUluRE9UTWNISGlhRFBxeWZRaUs1?=
 =?utf-8?B?OCtGTUg5cGo4VmxMOUF1K2NNMDBjT2JKUmNTSGp5UlVtMW42RTkzOVJmdGhi?=
 =?utf-8?B?cFRUb1k3cG1FVDh4MW41UDVkMmsyZ0d1b1c2MjhkNlZycHlXWDl4ckV6cTc4?=
 =?utf-8?B?VkJ5WjlWY0t0Z3J3VXVmUDJHd3g5cXFYMGZIQUc5YmxaTmxuZHgrT0tLOHdF?=
 =?utf-8?B?NEdYMXJYT3F0WEd0ZmVrWmZOS1U1bWFBOVFpRWNzcTZ3ZitWT3lxdXNoWk1u?=
 =?utf-8?B?N0NUWlZmN3ZCMzlSSER4Q2I1Z2Jvd0xrajN4MzBmT0RHdVdpSHZKa1ZyVkNv?=
 =?utf-8?B?ZFJFMC9qcjJhSTdqc1ZScDRmRjI0ek91eVcwL3VQNmZOUzhYd0U5ODJKWUQy?=
 =?utf-8?B?SFBvVk1IeTRVSFFhTGhPYzRlOU4rR3JDK1QxbUNSSDVDNkpBOElMWWgxL0JT?=
 =?utf-8?B?V0NPN1YxTUk4RGl1bWUvWnptV25Xby95L0dCQmdsYVdmbjl5Ui8rbkJxMGs3?=
 =?utf-8?B?N2NKL0xVQ29iNkVGbXB5ektjMWpseHI0dHg5dlhINTBUMytnNTRLcVVrQThs?=
 =?utf-8?B?ZVlBclU5bDZrcnJ1ejVWQ1pxMXZidHlMa2ZXelh0S0hlRjlIbXcyQUJkdkFz?=
 =?utf-8?B?TDdqNTNwWC9OM1M5RnAyMjdlTzRDTzNMM0VSdGViQzQ3MXM2Q1VhVWJ3OTNa?=
 =?utf-8?B?UmI5MVRvbEJ3ajNoeVFXSVpIS3lOYytvTU10SlZnb1A0OWhEdnJyVTNHNm0r?=
 =?utf-8?B?c2hGYUFUWXlGb0VkdkxrUmU2Z2Q5bzJNVmgyQzJlTXNPazQyaWpQeTJCMzJV?=
 =?utf-8?B?VDZkVjA5Q2ZHNHBMV2dWVDhSREZWbFllbS94T2syTUErSmszT0lvNVdpMHdJ?=
 =?utf-8?B?MkplWC92MjBhYVFHVCtXQmk2bWVtUTlDYjIySVNDYVA4NzI5U0FHVnJ4OVRL?=
 =?utf-8?B?U0ZrNjVPWU5DWEpFVUFLWVRMNXFtdTZMRnV3Ym9WYm9zSzFHaG9OeCtLOFc5?=
 =?utf-8?B?bmFzQkN4MmZSaUxpWnh6ZUJVRkthUzRhR0FKRzFuU2Z0MnZUWUdkcEJnbTJV?=
 =?utf-8?B?Zm10WFc1bmdqUlBpSFRBNjFYM3JzOFQxSHhyaEE3cEdtRG9pcjhsU0FVV1Yv?=
 =?utf-8?B?Z3l3OCtjRkd6YkZ5d25UTzhEa1BLVU5SSjFBd3d3K092eXd4NUw0cXpIRWdm?=
 =?utf-8?B?Wk41SEEzMEw5TGFhbW5CSTI2RW85YkdjWnM3cFpSV0RnNE9qOU5tTE9JWUtv?=
 =?utf-8?Q?w5JQ=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f42b068-4c1d-4d4d-d821-08de071b28dd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:03:56.6086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEetN9N/f4C3WvomxiMmQwScvsjiXD0F/sGsVmAux+t3dcBDDAXPegwz5VWfEfiW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR15MB5327
X-Authority-Analysis: v=2.4 cv=SfT6t/Ru c=1 sm=1 tr=0 ts=68e78892 cx=c_pps
 a=Ja4avHF4q49+S+GKa94BQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=lVgtHpeB4pcTOMVH2UAA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: b2Ca3Xvw2Ept7QEjbBXq3ndvignnLm0J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA1NyBTYWx0ZWRfXxn72Liqsj0F3
 sOrcxRehqbz6RJpJDpe3Mtc1Bm953Dj6pmwQYIr9hYHiD4alOfiEhdZk2rqjJqjOH+iahb1+UPA
 8pXIZW7TkfXm+rag9PyjzG4CVCiJ44fvV0L13KRrXDXannp4K5YkuPPA4pd6ttPCMjw3hZvy26P
 F1WpLCtjJvIVhRXl5bv/1gwGU6il/ZSHz3PFeDGjcXukvN3FIyykSjcGjaYKQStzzmHxoJ26oYt
 jCXeEwuXpLZUmfoyJzNMikqeUyXO6Qj7v/r+TV+kff0J4zxkE8Bs83jZ033vEK7IBfUhfQJYR5R
 jM8qc0/f7vNNIuxX8ClK2y41mE+eqvLmzs4POeSz8wocA0j254nZYO+JuGerY6sBjPR51N0YqL2
 FSxgq4DUmmLHCEGhUndwdSHloVkG0A==
X-Proofpoint-ORIG-GUID: b2Ca3Xvw2Ept7QEjbBXq3ndvignnLm0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01

On 10/9/25 5:14 AM, Laurent Pinchart wrote:

>> Indeed.  All the more reason to enforce it at the source.  It then becomes
>> a cost for the contributor instead of the upstream community, which is
>> going to scale better.
> 
> Forcing contributors to pay for access to proprietary tools is not
> acceptable. Forcing contributors to even run proprietary tools is not
> acceptable. If maintainers want contributions to go through any
> proprietary tooling before submission, then this has to run on the
> maintainer side (be it on a maintainer's machine, in some form of CI, or
> somewhere else).

I strongly agree with Laurent here.

> 
> You're right that cost would then be a problem. I can certainly imagine
> $popular_ai_company sponsoring this short term, until we're
> vendor-locked and they stop sponsorship. I don't think rushing in that
> direction is a good idea.
> 
I don't think vendor lock in is a problem though.  We're in a phase
where there is a great deal of competition and innovation in the space,
and the prompts themselves are just english text against a general
purpose AI.

-chris


