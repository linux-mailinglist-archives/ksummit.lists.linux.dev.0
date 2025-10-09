Return-Path: <ksummit+bounces-2451-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA7BC718B
	for <lists@lfdr.de>; Thu, 09 Oct 2025 03:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42B594EF3E5
	for <lists@lfdr.de>; Thu,  9 Oct 2025 01:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FE210FD;
	Thu,  9 Oct 2025 01:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="nv0GHCfJ"
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3B34BA2C
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 01:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759972560; cv=fail; b=RXeJCC88K9AJxQgcys4LIWZijDqCmp1lBZnavhFG9LEHApFoqlD20H4WdXO6rPsf7yzOzC2++T2IgscRUnH24eEsCArhw6DDJeA/YuicvT5b+niznjfT/hWUCyqV340NSaRRRB0zJeuw1I1GOuaFPRoV+fDZLmuIu+YtTKX53Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759972560; c=relaxed/simple;
	bh=PAetphUBis6SX8l+AT883D0qe1fg76pnmRY4dUxy62s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EiJnL3lM+tCTK0dcqgXMzIgl4UucVDfQzold0iLPREyO/WUa3rwBI47ShHFfK+UK+3BvSeTrc+5mqPm4wM/aEAHIcWclCe+SNENv/cZcbf8s0hcinyyEFKRl7zofpszoDUuMjBQRm3h7Kz+zoK6WvIeXRHhz6I4inkco7aeaP6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=nv0GHCfJ; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598JMj852601348;
	Wed, 8 Oct 2025 18:15:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=tTrFJbW5slBPIQSq2gOc4HgkPo2L6HrMEMmm+vgQnDs=; b=nv0GHCfJoTaH
	EZ9+YtBV3sXNkLuBPgDEsMbrO/ioffABOts0Tvvd+vWJXl1mBhIfK7Rwx3FSTSJ1
	VEjF3wGqo+1Suk+NbI2+T36oa7b4ItZdooMI2h2xW4i8+YsQZAUZpwNuFJDg8FL3
	oHisSvU4s5dCr9VH9IrtqomDDQYT2ulOX82bjLWUtY3cOhbC62nj0UxrQe3j54qb
	Fvj8QVNuJv17hRQSgwAuu+161IWHwZ5680wHmA4/KDd4fKBOjvtcfJMcvftyEdl7
	CjaQkNrnaC+YkK2IUU9DUzgAGNUMNnys6btRx6kduFt9xPzpz5hXZxWbzpb66gK2
	N5hYARoQSg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 49nx2ftep8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 18:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yO5YbKE78FGa083GF46kRqYCudtgx2O41l3v/kB+EgpUNGbPYeHnQHSpNd7Mbvm0W2B+qWjgeXWamHARwcV/JbKgTBIfaSsp5NiVTa/YQvHDZO2oXxwypYgF6LJdq77NafTsLqwZWT+dt6l37QA7BJvsNDpaVUEVUq+/dTupEHoM7UpomqzBebErIQ2DsfBggc6WiZ+eF33kxT7xiULt9mU9h5jkJ60HD8Gt7fZaFE2gba9EK75Uc1e6aZqytlzhOI5Rxv5tbRsLT4ZK2z7RrZT7Lyo+Vtgj1x0JzjhoTsg1h6che8cBtD5KTmv/vgtnOL/tT92s+HcVKyqgA6nxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTrFJbW5slBPIQSq2gOc4HgkPo2L6HrMEMmm+vgQnDs=;
 b=P/ncP81pF32E/dzitPGo0Y2qpdWAH+y806zCK8FmaHnvZFop3k/CIfm8piZ892TCcTkZJbTTEzXXFBuR0CSpgvz0y0u4ir0gQofRUq8gSVg0Qs0DB4UG/TyiofxR0412m0UqIGm8ExD8Vzp/hIsPpzh5OcBSPHYDGAFV8mwxgQKJrx4Z+730Fq9RqNkCNiOo+O6jBL8Y3FLwjZdxK+SyZoRA13cm4W1svlKMI2+QAwgFCwDCGoi5jyQind0Abe8T2KnB/TAm9w97HtWxrjCrN2KkBQd3RpKJm0tg8I3LMNsWLnYyfcFciqubBlJNtCA0J8qL+HzNJ5nuKsiBzca4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by PH0PR15MB4400.namprd15.prod.outlook.com (2603:10b6:510:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 01:15:51 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 01:15:50 +0000
Message-ID: <f3a859ca-3bfb-4f56-82d7-1d9fc1c1ad65@meta.com>
Date: Wed, 8 Oct 2025 21:15:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Bird, Tim" <Tim.Bird@sony.com>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov
 <ast@kernel.org>, Rob Herring <robh@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::16) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|PH0PR15MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fcd9c8-f156-4126-0414-08de06d162b5
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlQ0SEZUcDZYclpabUJuZXVyeDRpcHpRcXJRUVI0OGptOGkvd1luMDhPQXJH?=
 =?utf-8?B?bVdRejF6VVM0NUEvMGswNWEzSjBMUDJlUmhISG5tNDFnT3JqWWpDeXZsTTNu?=
 =?utf-8?B?dEZMRVBxRWVva0dpblpNbllMNUlaNFZyTmFjaTRVWm0yL29uRFd3dFJZYlo5?=
 =?utf-8?B?RDhQSHVZS0s4b1hTU2RZQVl3ZGhORVNxZDltTXljbWNYRFk4NmFLRzQwNEVx?=
 =?utf-8?B?MHpGQW5jeHZ0Q1Q3V21oT0tuNXZqYXVEdFlYdVhQTGoya3ZlWUNXZ3NyaWgx?=
 =?utf-8?B?MUpTcEt5UE96V2dFeWlGcCtqTXY3VzVYRHAzTU5HNkdwN3NrWFRsS2xkcmhQ?=
 =?utf-8?B?RFJlYmZFd3RqSm5odkpQTTVuVXk0Nm83U1FleVMxUGk4aERlUGxyUzZMcGM3?=
 =?utf-8?B?ZU9PKyszMXVnUU1Pa3J6NVlZYnM3WmdrUCtyN0liRFZzcFpRemp5TUVUYVZ4?=
 =?utf-8?B?Y1A3SmR2TVdCcUlIdk5YR1F0MjNrM3cycW9rMlZHTW0xTjJpQWxiVkl5V2NF?=
 =?utf-8?B?aDJhelRMem03UGEwZ3FmcC94ZGdRRU9QY1YzaWx5VDBYUDZFWDRlNWVkN0pI?=
 =?utf-8?B?T1U3dndzM1dTdWxPa0NSdVFmU2pKZUlTeHdjeStKQk05WnVoVDRQSTdrZEhM?=
 =?utf-8?B?K0IwRFJCcDJQSmtTVFJBY3R6TEROcFc5QzN4eFBZb3RNOGM4dUNvYm16cmdP?=
 =?utf-8?B?V2ZsMXBhblRTT0tnMEVFZ3BSUHdqcWZkcHJpTFo4MnZVcHE2YXdsbUZGYkhT?=
 =?utf-8?B?bzUrSFNaT3hYVGdHY3FBT2ZXeXh4UE5PVTFBOHkwK2pEWWhaR2FPanM3TlVG?=
 =?utf-8?B?UWFEY0dZeFFlRFZTK2t4UEVKTVNXZzg3WHpYa2JraGlTblFLeXFLc01wT2x3?=
 =?utf-8?B?SGZoZ2FpenVjSmRMdTVzVVZ3ZUFzQlZoMk1SNnh4ekNFY3RMRS9PQXg4QTBv?=
 =?utf-8?B?VVZ3NXdjU2RWM3BFOENNSUs3OWJaVVdaQzRKcEdYRTYrenBtd2NwRnRSWFBB?=
 =?utf-8?B?UGJIc2RtNFM3Zk5nSXJVeHFqOTljVGhNYm14aGNRNGtwcEFOSEZ5aGFMQUg4?=
 =?utf-8?B?cE05RGtkRlNBR0NTQjd6ZXpiSSsvT1NRZUhjM2lOUkNXSCtweWNUNkZJWXFk?=
 =?utf-8?B?eWJZUWp2RHdoK3VuSnFaaUY1bjArNmJOL1lGZTNhb2pvWlByeTREczZWOTdi?=
 =?utf-8?B?MEc1QzFyWEluN3R0Y2xYNGxDb1ZrT1RmYSs4alZMWmU4OGE2TDM0ejZQbDFm?=
 =?utf-8?B?Q1lkdHI4bWxaMU1zR0E2TllHYUpGOW1VcDJwZVgvamQ0dHBqRlhPbGNScGky?=
 =?utf-8?B?emlrYVpJS2RjOXlYQVE2TTVqWVNrd3FLSGNOVVBuVkRwelRsNTJZUU9sSHBq?=
 =?utf-8?B?WHRMbTNoSGFURjJ5VkFycnRGN0ZhZUJPY0htMmNKS0JFMmVtOVo0SmxuRUNr?=
 =?utf-8?B?alRlSWdHTDBNNmlIWUpoaFYrR2RTVHo5Z3BpR1hHUC9TZ29JQlZndHorNWFX?=
 =?utf-8?B?ZEdFNUVWa082bVhaRm5CL25kQkNLVytQY0ZlQitxQUtiOFdtUEN2SEhQOERZ?=
 =?utf-8?B?ME1ZTitlWkE2d3o4dEhqM1d0VkF5dmtpdFRSWElxanQ1RkRqOXlueFFvYWVU?=
 =?utf-8?B?YU84OGhweVA4bzhYVzlWNEx2d2dQQnBKTFZET2hxd0VNWVNSMklNOGNqWjRz?=
 =?utf-8?B?dVgyZUxDRk5ud0JLMzdpSE9oZUJqTURnU0xQb09FVWtDRUtvZDNEaWZpaXNJ?=
 =?utf-8?B?dGROOEo0OFBwbHluci9DS3QwdE9rWTZuWmdpdnVZMmc5RW0wTk5VOFE5S3hq?=
 =?utf-8?B?Q2V2azlYZGlnSkdxd01kVFYxdG9hVkoxdUozWEFYamx0RkhEbVFJSExWTFZM?=
 =?utf-8?B?VFZldDgzaFJ0MUl2YSt1OG5pcU9ialMzcFhEdUJKS0dnN3ZBak1HczRqaElT?=
 =?utf-8?Q?3lUWPt389ArQuGH2cP0v41zgs+3byIvy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3dUcG4rV1JxaHVuTGg1dTkyU1BodjBaN3JZcGtkdjJkSW1ob3ZOWjRsUkta?=
 =?utf-8?B?MlRBT3VoWDZoK1F0UHN1cUMvaTVINEdhd2lVNVBJWGxqL2VEWjNnWkVKVVJy?=
 =?utf-8?B?Q0VScWdibFgrL1JWSGpyeXpDR3kwZWFadjI2WU10RGp5NzFLTFdjblVMQ2lr?=
 =?utf-8?B?alNtcnFuRGxlQ01LYUpqRzVGTWNmZXhrQkxKU2ZFa3IzTyswZWdOUU9JYmg3?=
 =?utf-8?B?THdiOTZzTk1kcW9wUnFzS3ZGYXJXeDZsZTdDUjdvRXpZM0h5eFlnK0xRZU5L?=
 =?utf-8?B?TGtoVUFXaFlhNHJOSzJJN29MR1pUT1F6My9yR01TaXZJRnR4anU4ZEY1UmZq?=
 =?utf-8?B?ZG9KZGFvbGVyclJGUU9kKzhlaFRIdE5iNlNjamtSOEkveEJRS2VPbkRUSnpK?=
 =?utf-8?B?SlpuV29rZlIxd0dxcTNONUlWTW1ManpScFcyQnZPb2NrWHV5aHdJelFYVjA5?=
 =?utf-8?B?VGNCOGlMUVo5NWNTSjEzWk1rZ3ZEbmNUeVV5T0lEZXp6VE1SUCtVbjM1SGN5?=
 =?utf-8?B?Mi9OQUJmLytZSm9tVHYxMFQ0TFJzZlVLaHRXU0VNK0RMN2hXSURrSU1HclVu?=
 =?utf-8?B?Tm02WE5LUDMxUGFPancwYmFEN1NTZWdrMXVJcmRibE1VbnRYTldTTzRZWVJY?=
 =?utf-8?B?c1prbExTakFWM0p4RG5qS2RoWGJqdWFKbDF1V1BwM01qQWxTdDVISFFGK2g2?=
 =?utf-8?B?WVgxSm1lSm1pNnIwekdBSmFuRU5IMkM5VmpZU1hkQjRGak9HT1ZRUUhEdkVU?=
 =?utf-8?B?Y1F6VkpEWXFWYnlQcnd3SXdsa1llUTZsdmsyMkh0UUd3NWQrNXRvTmhtRjA4?=
 =?utf-8?B?bXlvY25YbUQxNnloTks5MnBzQXBJQ09tR3YyYythQTF3d0Z2emVJR1FLTmlt?=
 =?utf-8?B?ZUY0cUlQQlZtU05IWFZCNWRyOEVhR2pPRDBweW82d2FLTGNScFlibXVYQ3lj?=
 =?utf-8?B?a1VnYVIwdHo5U1hFbVBQbWNTRDNjZS9OdWtPa29Ecjl6cUNxK1I5VkhDTGY3?=
 =?utf-8?B?U2F1OFJGcGFtVmdEYWRKYnN5eEVMYjZpRTRHZnQvOWcxREJIMEF4bDkxTk53?=
 =?utf-8?B?N0ZTTURaZWtRbW1ZVTJvaVV4YXBQTllFUGI4ZWpMaExlYy9yaG1BbEFqWnlI?=
 =?utf-8?B?Rzl1cThPN3BaTUZtM3dvbzY1VW53TGRsZDBCaGxVODQyVXU2TjhqNDAwYktF?=
 =?utf-8?B?dXhSeG1qUmR1UWpDdU9hek1PUElUS0RjNXJGUVZPZlMrRlNhNDU0MVBsclhq?=
 =?utf-8?B?ZDU5ajVBZXcxU2h6b0U4TEdiajJoazJndWZVM3B1RFF3cVVpaHBiY0V5UDh5?=
 =?utf-8?B?cWV4bGJSRTNzd1F1bUVrcDkyVTgzOVZPQWFFUG85d0NPMGlCVDNMeVhPL1Ri?=
 =?utf-8?B?OFJ5NjFnZXFwWDMvdVhqSVhqelNsTzRydUpXVnBwaFlaWHlpc0hpVjZQSEw3?=
 =?utf-8?B?bjhveFR2WVNVSERWQ1RiZ3JJM05qQnVDdWg3V0U3WTJ6RVJFRFRNNk1rL1dE?=
 =?utf-8?B?REFJbXhqeWdiWUtNSUcvQnFrdFRveSsvL0lueDgyQlY0aUJwSVFYRy9SWXNl?=
 =?utf-8?B?Q2NjTXRDSjcyV2NnV3RGazA4WHd0M1p6TUIvUTRteUNrL3VPOWpCS1AyREY5?=
 =?utf-8?B?NzRidDRsNDVQMVY3Y0dmdG1mUDljQmtMMWJVeVBHUWFVZ1ZXVGs1NFBVOTBT?=
 =?utf-8?B?QnorZlgrSWttbUlVZytpU01zc1NXOUR1WkFkeVFQTFhoRnRLenlGV2pzTTND?=
 =?utf-8?B?cWxaRUYvM0FORWN1dURNdmhaOW1MK0dRNVlwR1h5MkJ6NGxCL00yZW4rQ1dX?=
 =?utf-8?B?NHNOS0hyTFo2NVFrWDhQQkYwNWJDbFNGNzYyOXJkcXZhWnlwbkwzUzZKNkhV?=
 =?utf-8?B?dmEzRVhuWjNvdVIxRHk4dFpxS0hQZFZJbERuQWZtMlBjMUJtMzFhdXovU25i?=
 =?utf-8?B?TXJXSGxTOXMzbEVHUjFZc2s1V2V3eVZEaUVvVnpQdXRDY0Z0dkpIU2d2YXdz?=
 =?utf-8?B?cGFrQkZvZ2xxZFNOY3NubTM3UFlGMDRvSmJTSWpzVzBaSXIwelN5NXRBZG5k?=
 =?utf-8?B?VGp1K2hDRG9ZWFFUSVZ6WUlvYm1DQXlxVFZJQlFDZ2o1SlB2cVIvckFyVWJS?=
 =?utf-8?Q?V/OU=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fcd9c8-f156-4126-0414-08de06d162b5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 01:15:50.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCXDTcPM0WR5zZX0l5P5Dr1d7I117UCL6zJwtwASn4LNnBUDSgXunlpiJf1IKvky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4400
X-Proofpoint-GUID: UnMDdc8O5ZaRZI9xaIIfL8IGXKsJHgKK
X-Authority-Analysis: v=2.4 cv=S6jUAYsP c=1 sm=1 tr=0 ts=68e70cc8 cx=c_pps
 a=6cA/pxPA0XCUgbB+gUSklg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=P1BnusSwAAAA:8
 a=qBPHUkEyIN9rSt_qRucA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: UnMDdc8O5ZaRZI9xaIIfL8IGXKsJHgKK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDAwNSBTYWx0ZWRfX1qK/Pc2ql6m1
 B1vALXrdN9n1+UCV4YV4/Ohpeb96/dZHw+NAsOH8ANJBqX+v6rPd3a7t17ydwF1yrSWZYtvO7LS
 uE9BfTiimcr0EWJuuEcHTi/7xXtkLzO60W8XflQgXsQjcBuKd5SKDM/TCl74onkjTY61WepqSyZ
 w5WcIfBFcuWxqICPbgS+FEpQexqv2dcDtXblSiS9IJSakv1UxMYC3b/1yvMvO0K5P+9c9TBW2Wb
 K6ibcmM6nnL8t8vQllmP+QQ/WfKrI+Y+eknIvLzbQXV9TqIr9RZnalvQpKlAWtGjR8GeZ/T9Ul0
 8i49LB3GB7/wg3AeTWS53lDjY/ma0AhL0v64mrSgaGEvhO1pUVIHp7RmTJd0Sjhj5zs8fRNHGkF
 9Pmzoc6arBCAqnEojIShv8Tvic4YGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_08,2025-10-06_01,2025-03-28_01

On 10/8/25 4:30 PM, James Bottomley wrote:
> On Wed, 2025-10-08 at 19:50 +0000, Bird, Tim wrote:
>>
>>
>>> -----Original Message-----
>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> On Wed, Oct 08, 2025 at 09:08:33PM +0200, Andrew Lunn wrote:
>>>>> My goal for KS/MS is to discuss how to enable maintainers to
>>>>> use review automation tools to lower their workload.
>>>>
>>>> Maintainers will want to use these tools, if they prove to be
>>>> useful. But ideally, we want the developers to use these tools
>>>> and fix the issues before they post code for review. That reduces
>>>> the maintainers workload even more. So Maintainers just need to
>>>> run the tools to prove that the developers have run the tools and
>>>> have already fixed the problems.
>>>>
>>>> So i'm not sure your goal is the correct long term goal. It
>>>> should be a tool for everybody, not just maintainers.
>>>
>>> This raises the interesting and important question of how to get
>>> patch submitters to follow a recommended workflow. We routinely get
>>> patches that produce checkpatch errors that are clearly not false
>>> positives. Rob Herring implemented a bot to run checks on device
>>> tree bindings and device tree sources because lots of patches fail
>>> those checks. I'm sure there are lots of other examples that have
>>> led maintainers to automate checks on the receiver's side, through
>>> various types of standard CIs or hand-made solutions. Submitters
>>> should run more tests, how to get them to do so is a broader
>>> question.
>>
>> Maybe it would be worthwhile to annotate patch submissions with tags
>> indicating what tools have been run on them.  I know we're trying to
>> avoid overuse of commit tags, but maybe we could automate this a bit,
>> and/or' reuse the 'Reviewed-by:' tag in the commit message.  I could
>> envision, in some future workflow utopia, where a missing 'Reviewed-
>> by: checkpatch.pl AND claude AI review' would be grounds for
>> requesting these before human review.
> 
> Realistically, we can't even get some submitters to run checkpatch, so
> I don't think the additional tag would help.  What does help is having
> the 0day bot take a feed of the mailing list, select the [PATCH] tag
> and run checkpatch.pl as part of the tests, so someone could do the
> same with whatever AI acceptance tests are agreed.
> 
> Although the problem with AI acceptance testing is that these models
> and the inferencing required to run them doesn't come for free so
> someone is going to end up paying for all this AI ... unless we can get
> some cloud company to donate it, of course ...
> 
I agree with James here on both points.  Maintainers really benefit from
having some automation consistently running the tools they find most
valuable.  It lets them know a basic baseline has been met before they
engage, and it fits into the workflow in a predictable way.

When everyone else is able to run those tools as well, great.  Some
people will and some people won't, and that's ok.

-chris


