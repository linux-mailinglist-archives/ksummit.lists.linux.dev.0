Return-Path: <ksummit+bounces-2436-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 758D2BC650D
	for <lists@lfdr.de>; Wed, 08 Oct 2025 20:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38DE1406782
	for <lists@lfdr.de>; Wed,  8 Oct 2025 18:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CEC2C0F73;
	Wed,  8 Oct 2025 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="YGbnbn1O"
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC52D2BEFF1
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 18:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949001; cv=fail; b=DK2bP7gb++mlqIsflqWHq0MOb3cfpprD3vOimJ58CSWMWQMxWlbZtO5smdEWVZ75wwdyhpBmXNeEK5TUvK4ugTdx4pUOC6Wmg/YvOXk1OII3seFTwDF6y0eGFZfg1nxVEdlfLE7l0v0vbGcATpvZrofmM0f5+JDdqCnvhM9dTGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949001; c=relaxed/simple;
	bh=vCGicN+GLgQowGHpmF8t4nYqovwRGbgf1W2e0u81mYo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E0KH0yjSqDrGAZy5iYaugd8RTUj2au0NcNvl3fEz0VuXu+WblDCqYSCdAQUxmdAntVAQIK3RIKJWY6dSq6wOdTqmZlPy88ixfw3D2U7aMeMBEGAgD8WKPuFsTvGsImJMzB+uQub6yOnPCicBtrZLOKGPIFmdJ1QzorGuWsZB9Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=YGbnbn1O; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598HeLjs1505731;
	Wed, 8 Oct 2025 11:43:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=ykyxoKSCAbZD8cHKvgEGqyxGaZRG98scn2iIeGVmw10=; b=YGbnbn1Opco1
	64KED41lkk8m11QYLQY6MkfDHo53BH56FZqhNd4jPYGKdem0U8ytFXv7RTW9FmPM
	KXhT5up9bQP47Nd/VGzz/baOH+v5cU2sAutkIZ1dIaTvrH4Zm7lerG04B2wjFyMl
	DaWf0XIE+XEYC3v5VrjD2uPRxjBJD3LsqMgvg/yuVWnNWPGwgc/YcqhxBOc2f201
	vENs/HU/djBdgphibs4Gru+vS1ysliT4Y28RYZD5zRg/JqlXwJMVyZtcZeq0DMPy
	10sH7FLwVMeNTO79GW2kBUe9rqlHcFE3bnsmrB1GBQYYQJF5Xx8axtLeNVO11jfg
	g/tbJmM6Ow==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 49nvjcgkn0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 11:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUFCIRZRndLv37eI2L0+q4+kL/WIZ/yoDtvUiQHM4Oo0+Xw2MGKhbOgTKRFYvLn9lsuXMedyrza/t9B67kRtGIGVbhMiRq8k7Eez2UAMRaWQLFVIA2BMUUgYED4V21ovjOnhxG3Z8ZfiENAIs8bI+36mUQmJlYvX3sOIXxlAuHSb4jAlByiVPbBey+c+NjDqG2AniIRgOoB9ixRcVU2ddMMBvb3MdzLWQ6qfnRMy+vHzyPkAChgSK4xvGxg61j1QDgQcfTMtfB9bqWjsd3Qu8D2Ej6E0wVUYNqGqwLuFiQNg1f1VAVpQllSxrhcTpc8o09fkXIEYHK2HnrN05tc+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykyxoKSCAbZD8cHKvgEGqyxGaZRG98scn2iIeGVmw10=;
 b=VViGbjpE6OX2aNglvJiGY1nFtpfRaa3QNQH3cw6InnF544jVJR+clUcIjpyGZLDW7TmaHi9PoTfnieXWP0+8Qi/XpoQxco/j1rDY0TZiZ55Jq0ak2FZb0sT6Vhznpw4fGlVa673aRC6t3aihH8TsDWeONyjZtdjg8NE4TS2SnqmO/jLX2kogFcN9M9eyF6kM7rjv6KqjcEhck9r4v+0sHjM3jPSznBNnbV+xOhQF5cfizpH6NDcXBkfGhUT88eosmhyZ1J+wICtlXwCS/ENc74UiUiq38lwQAeFQfuN6pG0wzh92zB6+Af9bH2PMBuLs2WHjzhX7Sv+R1uh7JdNIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by PH0PR15MB5104.namprd15.prod.outlook.com (2603:10b6:510:c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 18:43:04 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 18:43:04 +0000
Message-ID: <3d8174c7-add2-43d7-a960-53c33d4c400f@meta.com>
Date: Wed, 8 Oct 2025 14:42:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Bart Van Assche <bvanassche@acm.org>, ksummit@lists.linux.dev,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <28cd7001-0a24-4dff-a4c7-714495bff7f0@acm.org>
 <3ffd9164-919e-4fea-8597-601452537331@meta.com>
 <adbaa57a-4dc8-4929-b319-8dc96ce08e89@acm.org>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <adbaa57a-4dc8-4929-b319-8dc96ce08e89@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::9) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|PH0PR15MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: e581463d-c933-47af-f6ee-08de069a83ab
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDk0dHJWWElBSXd3V1RhOE1CZzV5Y1ZheGhEN0RWcnZuTVQ1dkFVeUFHU3p5?=
 =?utf-8?B?d0ZRMzMzYUh2cjUydG5GaGthRmFOaWlYQmxTckpCbmlYVzgvaisvVnZ5d0ky?=
 =?utf-8?B?OGNBOFlRaXdsNEo3YjBOVHE0YzE0REs5NEJYa1ZidFljUFhLdU93QWRQN1Mx?=
 =?utf-8?B?VFNGaHdINW82ZFJmRWI0V1ZnQmk2T3VNQ0s3UlJoOGRhUXFldTNDOUw2VnhV?=
 =?utf-8?B?WGlZNld1azJKZnJmaXgxdzZVeEwwRWVjOTkxZEFNdm8rTFhLS0RRNVh0MHJX?=
 =?utf-8?B?UDl5TmpOMVV4SXhFcG1UZjcwUUxaQXZRaVgzbFJ0NXRpMGZBN3BFQkEyMGlE?=
 =?utf-8?B?cjVSN2wzUnFZODFQNFRnNWRoWXNPc2tnZWZRL3U4UGpLZG5kRHRwcWRodlpi?=
 =?utf-8?B?K0pMS2ZZZGJCM0xISlVnbzVUUFhEaWd0WnNGaDkzRWRtVjBrWWFJYjJMeTRp?=
 =?utf-8?B?ckVNRzc1TXgvNDRoRGRja1owWGUyTU4vK1JZZEFuVTcxZlVpQzJPdjNsbG02?=
 =?utf-8?B?TW1xNXdOMjg1Y0tUWGhFb2JCbFBWc3QzK25VaGRKWFUvWElFSEZIU1lyQVhy?=
 =?utf-8?B?VjBBUUY2WmFCSTVxL0kwN3ZiVFcyaVRQVXFxQmNPeVlhaWpxR1dpcmE1emJG?=
 =?utf-8?B?dDJGUDBvVjZYSUNzTnF2WHJIWmVscXJOY29EUWtFTGd1a2dKUEhRK2Zscm9z?=
 =?utf-8?B?WmhvQ2djRXJVR2VlWStHeUluTjJuOWlLYkRRTS9XRytuS1krRzdqQzRkTWNF?=
 =?utf-8?B?NG5xYW5FMWdlSnEyM21naElMT2x2TlNmUUVYOTVIS2NyaEVtM3B5V0xHdDFL?=
 =?utf-8?B?WElyVXJtTTVILzJDd1FXSFlXcXpKRGxBVU43NmhYWnlzS0wzdVkwdEJzQklM?=
 =?utf-8?B?ZXd6MnBkMDdRZmZveEtzRWVtalVGZHlNVEJEODdmWGhTTXNIejlRMVdNRXl0?=
 =?utf-8?B?Y0dNOFVGc0l3S1habUE2dnF6TjlBNllIQkM1dURMeUZYMHh6N2w2YitKYVZn?=
 =?utf-8?B?UE9RY1RoZzZnMnhsanVGWWFUdU55ekl1YXVuMWZXaGtmei9KdWMyRk9rYWZX?=
 =?utf-8?B?VzZMc2x1RVpRb0tBK3cvTVNzK2pKUTV0S3RiTFJUVDZTQ1ladm9TL2l3RVJl?=
 =?utf-8?B?ZTJ5YW1MNDY5eFV5cVZtQkNQWkcwV3NNV3dWcFZsUG9XK052MTB4ckRIU2li?=
 =?utf-8?B?bXo4TGorTlhENm1uZWhldzc4NjVHYWs4RlhFbDNKNlcxR1hRWDlUajZWR3B6?=
 =?utf-8?B?NjZwM0wzaEl3THRKdmxOc29ycEhPN0JPRUptdlFaY2QzNEEweTNOTVBKVGRh?=
 =?utf-8?B?RHFxSTJPTHZpakpOU1p6d1FXVlF6eFhBSXEwQUJiNWorcjRKank2TmxyM3U4?=
 =?utf-8?B?c1VHY2pIOWd5YnZKaXl2NTNicS9sYWVQc2p4VDJxZmRqOG44bkZrZkkrTG83?=
 =?utf-8?B?VXhhNi90aFRsaVFwdHkycWt2L29ITitpSHpKcEJTaVc3a2JMd3RNQnZrQ1V1?=
 =?utf-8?B?dmI3WGl6ZkJQRCtTc3dpWFZZS2ZMcFBlTXozK1ZZS2phY1hwR3BybnZVa0M4?=
 =?utf-8?B?cHViQSs3TVRkVmU4dFFRKzBHVmpob2pHM3ZtVUFiYnh6Y2RzcVhPeWVsY2FH?=
 =?utf-8?B?ZUNMV2E3L1NsdDVtZ2dzczYvL2FXS29OMzUybktxMFl1emxBaS8wYXBuNStp?=
 =?utf-8?B?WlFCeGdxZER5WXF5NzNBSC9mZTdjMmg1ajBISzlqQVYzWk9CbTZDejJkUDUv?=
 =?utf-8?B?aTJGTDZkUHBPUjkyTmNpSEpUbFhRaEZKckVObXZ0aVFEYTZhWDBSN21ja0Vl?=
 =?utf-8?B?Y1R1OVEwSG4zNktQWm9oMGNXR1FzTStJOTBzb2tkNnNDMGc2aWV2ektnbHFT?=
 =?utf-8?B?WGpuajVkWXRlWDE1dGszVGRSMTNPWG8vV0wyYUdRaFlxNFpVTWFsSHQ4cmkv?=
 =?utf-8?Q?0L8ax/p+mNbvBPQX+SG6xCqfXTEetpVE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXhWMkdxSEhvRUFjTnlpM3JOZFB4c2t4ZDlBaTROS0hBOTdNOVdOdnQxNzhF?=
 =?utf-8?B?bU9TYVN1R2dlUng4MmhJS2NjMlJjNzBPZCs1R3hoc3ZNazNXbmF1KzZnS2Mx?=
 =?utf-8?B?MlRIM25RdzFUalBjdEVjWktJMHJjSGExSXBlTmRjRy9QSFJIY3lIcys2WVBq?=
 =?utf-8?B?a1pjc1hBdVJ2c21URDNjK0FNUFRUeldNdGlvSklTbU9rNTZzQjllTnNud0JK?=
 =?utf-8?B?cXFvcUorMWhRcFNTaW50cldoUlhPenRuZDhXZ0FaRGl1OFBzQ1FrbmRpb0FQ?=
 =?utf-8?B?c2hZMVlyMHQ3dXNZeUVjc2NIU0NVK0wrUDlOT1NUVEU5T3lyaE0zdGFmclFh?=
 =?utf-8?B?K1ZsMHIvaFpQVEczYmQ2UnRkYkl4ZEtIQ1pLemxnUVZlRWVIRVAyWDhhSngw?=
 =?utf-8?B?akd6SFdtWnRGd0NvSkEyeHNiOUV5dnVJeFdpaDZpczJnOEYybm9SaWg5S3R6?=
 =?utf-8?B?YlVpZVNpdmxTazlJZnRmeEY5M3hZV215N2xOeWkveEdVM0lqOWVBQ1lyaW1V?=
 =?utf-8?B?TXBFU2ExeXhzY3FzMEswSGhucU1jcWI1SWpSMmN4WmQyeXZvKzNQektZdzRW?=
 =?utf-8?B?UXk3TGdFeHdJT0N3TzZROW4vdUdVbmdMVnllUEwrTmttcjl4TlRYS2dYMWpO?=
 =?utf-8?B?T2hjZ1QxcVhqSi9RdGhOU1NUWjRrUmtsNkpsOTJxbVBReTA5Uk5Fb1B2aXhS?=
 =?utf-8?B?a0RTdE5mWFFUZ09jWndxaWYxRzAra2huelBLM2tWQUF3M3gwTmViRnVhQWJH?=
 =?utf-8?B?RzFYMndHWnVoVHZ1bGp0SytLVDBXdUlRN0I1UEN2UDFkallFbk0rVEJ2TUEw?=
 =?utf-8?B?dGYyNFM5bjNCeHMwV2hFWUV1cUllTVQ4WTVWYW91bVlibDV2K0pCOFFPN1dT?=
 =?utf-8?B?TnRJdjdCY1U4UlhDT2dIVU9pQ2lXcTF1UHVaY3h3cVlvOWJxbTR1cHcyRGRw?=
 =?utf-8?B?MEZaWGs0Q1pOUVM2R0V0bDZNRFJTZkRWZjNadzRzRmQ5SzFzcjg2MURKNXlR?=
 =?utf-8?B?aWI5Q2EzcmY0Zm41bzlPRlZzeXY1dGthYmVjQVQwdTlFVkJUL2pVMlE2dGZw?=
 =?utf-8?B?VExPVjhGRVRubTgxMGEzNG5wemtxbEs3R0RjN3AxaVFCTk0yNTFwMzdORlor?=
 =?utf-8?B?ajVCdW5yaGFhNTd1aGtmT3FmVEN0aW5qZy8xSHpkb2hQNWJ5SnF1VjNWYXls?=
 =?utf-8?B?dXZCZkp4c0F2bUtxUVluWWFubi9BU0hoUmREVkZmS3FxdUtsNXVqb1o4d0ht?=
 =?utf-8?B?MXBoaGtTdnRwZkRsSTZCMkxtc1dhZnllRnpEUXh1cXQxKzloVzlyUVRNdnFH?=
 =?utf-8?B?N0pJSDdCd0R3NG8xcFIzWHcrTkRQNEo2NWwwMVlteDNoampqOEk2R3RYcXdm?=
 =?utf-8?B?WWZENXZDblJvd3JTRVE2cUx6cE5yQ25GclVHNWZVcmI3dkd4VkNoQk1heExJ?=
 =?utf-8?B?WlRNY3ZKUHZFOHNuUTBScldJUnBBVVg2VTFnYjFsSGJISnRwZVRuRzFib0Jx?=
 =?utf-8?B?c3NiTFB3ZE53Y29BYWVOeWVSL1Y3aVYxQ1BPRVo0Q094NThUOFVzYmI5aGU1?=
 =?utf-8?B?QitzS1p5RHNLQVJOMlI1NVVsVzVVL1grek5qNnpRdy9seGx4cWlndENpd2sr?=
 =?utf-8?B?VzVWNk1YKy8vcjdzeFJsQmpEZ3luMGZGRmlhWkYvWjJRUUVWa1padkNaR2g4?=
 =?utf-8?B?UjVRMjN3TXpJWXJqYUhpazUzZ3VHN04zUEZMNkxOcS9aQzcycit6ejAxNVNM?=
 =?utf-8?B?Z29sbUdIZFVadGRhR0JRQ3Z3KzJiRG4zc1hEZXhGcmtVRGFGNmNhMkhkWWE4?=
 =?utf-8?B?amhCQ0ZxcG8yTTJOMEladGZZY0h5bEdMTFZQbUxpTHdWS3dYZytMU1BndlZz?=
 =?utf-8?B?djBXTERBMEdFWFc3ODdNOGc5ZHgrK0NobnNOTEo2WmJLOVZUNVgwWmhjMzlZ?=
 =?utf-8?B?T1B5ZnhRQmRPWGg5cnpqZkt6WmYvNnJaTVZhd2ExTERxSU8zcTNpcnhWOGpq?=
 =?utf-8?B?MTJyNTk4V3Jpb3hTOHYwZmduOGZ5ZEl0UmRBaUhpdTk5YThiNzltU0srcVd3?=
 =?utf-8?B?ZU1wTlc2dFFUNlZrQ0dZdjAzTENnbmdkdVNkeDlCM09CMzVROENqSFNUVkRS?=
 =?utf-8?Q?KfqGOgK2gndwcmr0ZgTnQViMW?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e581463d-c933-47af-f6ee-08de069a83ab
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 18:43:03.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rCKvNNJnl1QBBdDk7xhumTfe9fphJoeeTG8xydPS4Y6hlMNV9p9K0keu0+OJx1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB5104
X-Authority-Analysis: v=2.4 cv=H9DWAuYi c=1 sm=1 tr=0 ts=68e6b0bd cx=c_pps
 a=ZegHLSctVnYqdC7w6owYpw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=USy5DQ90FZUUm0RM6wwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: vaNAmwE20-p2hzqo3qMZ-N97EqOgI63W
X-Proofpoint-ORIG-GUID: vaNAmwE20-p2hzqo3qMZ-N97EqOgI63W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEzMiBTYWx0ZWRfX1f13Tn+htx8g
 c8A0EzNSofNsDHcMjE/cymrKFFz1B8l5Fum26WhYgW+VfgBW/KTQqH5qoDOZq5DngKYwxWLD3rH
 cByi/kwmWxBhPcTOJTzagnhYN5531TmfnfwXQhkaX41dGZrC29djwZYVIRW3fLQeu5RXXq+nUwO
 CHFl9KQa8n66ceymZXkxaM4qWQAH/AHy8O7u1R6CeFNfhjWKMii53eQCxBYv9MUmWwxUj7CWb8K
 mcsIlvn4lbOurupfO63hpVpAm/NPTlG1dvoWAY8T2bn4yKH61bfpr9KJ6jVnk8S+UUUjTFSYQ6E
 aYY+VYJCyFzkbeNPXKbl8umy5IwtMauoBxuJdZjO49xfA5VvYxWNMxohl9JiwFGTC0uBKoupljZ
 C+dhv4ppJODo2LKC+R2k2nlYbiE1xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01



On 10/8/25 2:14 PM, Bart Van Assche wrote:
> On 10/8/25 11:04 AM, Chris Mason wrote:
>> Claude really needs aggressive use of checklists to get it to stay
>> focused, other AIs may need other tricks.
> 
> Would that be a reason to avoid Claude for code reviews? All I need to
> make ChatGPT or Gemini come up with a code review is to tell it that it
> should review a kernel patch pretending that it is an experienced kernel
> developer and also what issues it should look for. The AI kernel patch
> review prompts I have seen from my colleagues are about 30-40 lines
> long. However, I do not know what copyright license applies to these
> prompts so I cannot share these prompts.
> 

Absolutely.  If something else is better I'd gladly switch.  The
discussion around how we decide what's better, and how we make it more
broadly consumable is the part I find most interesting.

-chris

