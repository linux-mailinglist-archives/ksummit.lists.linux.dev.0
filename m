Return-Path: <ksummit+bounces-2467-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D2BCA31E
	for <lists@lfdr.de>; Thu, 09 Oct 2025 18:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4F123C55C1
	for <lists@lfdr.de>; Thu,  9 Oct 2025 16:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C4B1E0DD8;
	Thu,  9 Oct 2025 16:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="j6Nuju/b"
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B4B136358
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027532; cv=fail; b=pxgPpwG93ibTy8GgIlAQdp3P4GPId+OF3U+kd+7lpsKN1VBIgCtu3jD+7aGa9pZ0/EB3d5G/Z4mXZ2+lzWb1BqR1HzU27I5SeYYwgPTjAoFEqhjY26oP8ZZFvt62FXwFA91p4imOXr1p+9p2rSszwN93/ize5KbmTSb2ux8qo1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027532; c=relaxed/simple;
	bh=KKVCkX7R5pCJMc1+89ddwWc53gNxsJvkykLIiJZ0yvM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aQL+Hmr3c72JG8c+iu5QVTMUqLwwqqgywhNeSN9DAfKxpe7tVT3TaaqHhb/OoQsHQyiO5rghhERhhTuoqyyflviOvxBQOisiWfxdZgHVsfTyiyqwIzzAkWnA4GK25XZwakLHZNw+Emu7sD0jiaivwsg8XlMMZCiZ4Ouhl5orVnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=j6Nuju/b; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 5998X0g42819234;
	Thu, 9 Oct 2025 09:32:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=NXyZdx/48T/ZgJygK69iHoIhoBX0qctwsFIiBLEJHkU=; b=j6Nuju/bHTW8
	jkSU0fyhuq8wcyUshj/gaa+wq5usD9NkULht6J/L4h8W5M3zWEikT8tD2Ueo4wl6
	x2skClKJvRWo/bSirJL3lhGCJCquyNTL/sOCvcAXk4FoNz6GKga3tnQyRsUKg+Ng
	SLF7VZ41uRKMswXGFRuTUqlWbcIKoZAhTcQRINm/dk502GAxKHPpQVsnWdNSzHvK
	2K+p5NYd4uBoQlRwcoxvzIaMT241+5UylSQGV5B8/q5+/QTe28ky5MkGTvWWaf8V
	WsQzSLnriyVtAdEz32SBrB9xYQunGQ0+DQug6HdBIF1lyyv4wii5o+lIlVEmiOVv
	juK9fKsrbA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	by m0001303.ppops.net (PPS) with ESMTPS id 49p9mtkprx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKOAoewJF6dfzt8W2P9JVqUnQLOmyMplVqf4BkkaPNg24BQrxzDYaf0Od5YfeC23RqY7vERkY8hhKm0/7EwYrlUrEPSUh2iaia7nDg627v4WI2siuHyiPuz5ryshp73vuwBHgkGdEug8x6PcmCkhaACB5tL2YLeIwRwoHWdTkrW68TFZuVJmbztw8fm0DrX1e0ba7pEpfTZe+QP6AtC56ckuYUNysFPLDkysmwkgSsBC6KWMtM8VQQouPEOTq3Nw5lCrm8hR/MzCqht/ZlAj0Ug/VBqE+q+4cJZGXKriFypN3tkxVyFj9ZHDCms4ITdhrB/CmTbvnB1v9zAAReOncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXyZdx/48T/ZgJygK69iHoIhoBX0qctwsFIiBLEJHkU=;
 b=a1Zg8QhYO+t0NBjG2pvAISAe0xmqGmkt17BPKYkJ2sN6DrREDjf4Bvs3dVqMUPyroCKtNIPfP/tBtY16cPOxmj6cZHO18Ge3+9UY231FfmQvFQkKPb4aG6Q2MsZo4+yW5DhxpiRLIXbJeiKVp8qcJjCkaFmdiPkLCFPZ9RrKrV0W1APij5GbXKlgoBuybPVAyubDlxzsmIFAVeXv+ky614wXDoXn1CshQsv5MFLEOIUpX3uRxuiPFK95xr6xIXu3F2a3ct/1ZXTb4HT6t8oQcSusgvdsWfCbYwRBckITavdAOSaD0spqMsb+ZiA7ROz9cgcDjJwVAlkzRNTTlRLpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by LV3PR15MB6481.namprd15.prod.outlook.com (2603:10b6:408:1b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 16:31:58 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 16:31:58 +0000
Message-ID: <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com>
Date: Thu, 9 Oct 2025 12:31:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Bird, Tim" <Tim.Bird@sony.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
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
 <20251009103019.632db002@gandalf.local.home>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <20251009103019.632db002@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0380.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::25) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|LV3PR15MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad9ec6f-0f62-4ea7-fd40-08de07515e12
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3U1c2c3UnBDTWxNdlJtTW9FSTk0NWNtRG5uRExJa3hSck9YcXdwZUtVWHRj?=
 =?utf-8?B?RkJoZGFtZm1HRHZZc1U0ZWZKeTJocVpPV2ZtdktpZFMxWmxTZ21uYytRMlZW?=
 =?utf-8?B?TC9LVkpUdXRzb05VME1kNXZoVk9CYmVBU0RSOWE3UjBTSUd5ekR4VnRmWUxs?=
 =?utf-8?B?NDdkNU5aTWJqZ2tyYlZUSE5VRHBiVXA5MHZ5TXRVZFFRQ3VQTW5UbkE3Y1lN?=
 =?utf-8?B?clkyN3NlU241Vy9Nb2xtL3hPRWsvRStybEhDeXBpZGdGQWJMNzYzNGZUbk9B?=
 =?utf-8?B?U3dBc1BuSHBjMkVrelR4L01YQXNqUVVicklnN2xmMnhZRVgyNEhIcjFvMk5l?=
 =?utf-8?B?VWEvY28ybmVPOE5kODNyeU03c3lsUU82RElTL2kyUUZHVktxM29acEVPaGVX?=
 =?utf-8?B?QUc5SGczSzM0elZWQW1IWG5Ca1phQTNQOE1sVWRId0R2cnBqMGJkazFsK0hq?=
 =?utf-8?B?aE5JT3h0TEJUTDcvenkva1ZEVHlIZFB6Y3JLa2hjdzlZek4vK3dzaUFJTmhu?=
 =?utf-8?B?aEQ5cnA2MHJBMWp2WjlXQyt3MlNURHBYY2twRC8rekI0a1lFUDcvZmJOKzBD?=
 =?utf-8?B?KzNlQ0kyTFFYSm9VQ0l2eVI4VlY2dktGL3lOOWQ3dVp5OW04STRzeXEvWkxi?=
 =?utf-8?B?R3dXSnBHRkYydUVSaW1lazFhVmZmYlVJdFRQWGpDeFlHZE1DT1pYaWg0ODJ1?=
 =?utf-8?B?clhDaEZsUTQ3dUlGWlh3enZJc3VNcjlkYzRGWHpueVBBYk52bCtqU1VZVGdK?=
 =?utf-8?B?REN1MWU3K1hzOXQydUJyRFZCMmFhemlMN2ptVFE4M29TcytyQ3FDTTJTUFBj?=
 =?utf-8?B?cUk1UlVFNEhPYTNaT2ZnWjl1cFRxRDR4Mk5rcFAvVFI1V2t0Ymk4bUdmUEhS?=
 =?utf-8?B?L3JsUVdsNkFJVlZOVkFDMmtRbHJXNTBKMDBNR3c5dk9Ybkk5eXpQbGtCNU1x?=
 =?utf-8?B?dWNxSjN6a2p6KzdGUmtiSkxVRUp1ck4xNnBRWjBaSlowcldtT3c1dmFhY1V3?=
 =?utf-8?B?cXdmN1M1S0RES1JVT08xZ3Y4aktoWER6MEdKbTNuTi93aUdWQnlUem9MRitZ?=
 =?utf-8?B?R1lFMllnWjVmZ2dIcE9vaWdZeUxWZFhoTFVQYnZGTEgwWGFPaDJUdkJFZVJM?=
 =?utf-8?B?UzhWOTNiWnhUVFl0OUd3VDhhV3MyM1JOMDA4d3oxQ0FZZUpMbzBrM29Ob25j?=
 =?utf-8?B?QkNyQWZ0eFh6YWdYZ2FEN3VNZkVYR3NlYk45SjJteGxBdXQrM2tzb25MRnNw?=
 =?utf-8?B?ZkNiZkdRVzdjUC9TTVdHekZZaysxNS95WDFYeXpQVEZCbE1KUTFZNWY0UlM0?=
 =?utf-8?B?ekZjYVN1amxmVVFnS0NPS0xxMnd3QnE3bElDWVQ3MlRVVFFoZVl0UU5NVlBZ?=
 =?utf-8?B?V0d1cFd6am9ZUHZPSWVkMDd3WkxBWWtNQmw0elM1TWNiSmVpRGJ1YjVPdzA4?=
 =?utf-8?B?OCtJN1hyeWM5SXhSdzJCNHNuc21ETzlPVUV1L1c0bmltRzNRQStYL05qZ1NM?=
 =?utf-8?B?R2w3WldISUo0cHpja2VSenZWRC84MDBaWVNobzJHazR3UGR0N3N2WUExdVpK?=
 =?utf-8?B?aGlkaVNiTHB2R0drVVlOcmRvcmtkcjdhWk1lRWY0aUx2TmFKQjJBeEFsNlNv?=
 =?utf-8?B?THgwbDFqVkhVRHBjNzlLbWhDcGZjT1Ura3Jtd1RKbTdjT1RGbFoyT2FlYnNT?=
 =?utf-8?B?eE9ydHdEWGVLYzNsaEMwSllZL2tSK3UvdEJaTlM3VWxod0pBemZQNVI4aDAz?=
 =?utf-8?B?YWRGZ0tJMG4xZzVtMkhEc2JXK29UTHJ6dzdLWnFqcmhGR1lnVW5lWHIrejVl?=
 =?utf-8?B?UnE5WS82cWFXU3dPblpOVHdZeXN6RDVNTHhEb0pRZ21aQk10SExSU2lGa1dh?=
 =?utf-8?B?WlI5QmNMUzUxNDhnNzNSWXkwb3pVZEc2RitXMmdQZThJREJvZUJVZkV0NEZ2?=
 =?utf-8?B?azdrQ21wOFVlU0FnQUZQVUlsZ1poaVFWenpxbTI3SjdwRmhHam9uZllvT20r?=
 =?utf-8?B?dStkWEtxVjRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXJYTHkvR3NsNG5zVk1MUENTNC81NGd0M2hnY0RUU1VHZXFXanpnVUdoSk9p?=
 =?utf-8?B?eEtTd2xJWXc5YWEzaGdadFpCcUVJZmRCTGdteTdsendMMVhVeEJuc2VRRUFh?=
 =?utf-8?B?N3ZGT3dwblkxYVJSTVFweE1ud0R5SXExMkFTNGV0M0xSMFRCUktPQkNCWVho?=
 =?utf-8?B?Zld0TEpqbXZSZGN3RS9Ra0xOWUdlZzF0MWZKMm5mUnJxeW5HZ0xxa0t3cVRG?=
 =?utf-8?B?Ylk0cjRBNmFQTzdhMGZvNFFHQlREZWdsMS9GMm9kYVVJQjBWWTJBRkwveGIr?=
 =?utf-8?B?VGV3NTJHZWhkSUF2L0tFNzFmRjVMcnNyUmttaVlCZ2RpMHB3NkxpamRaVU5W?=
 =?utf-8?B?Z3pKaUpkUVAzbnlBQTU3TWNFeHBHSEtON0ZRajhsT0x0S2YwUUFEMUFaRHgv?=
 =?utf-8?B?RnpvY2tkamVQM3VXazhsWTFqenpBa0dVcmFWdTU0clc3YUFSbVhXa0p5VDN1?=
 =?utf-8?B?QTViam9NdEZZQ3dSMjkyd2VrSHpUOVlCYTFlVXROVXc1TEJkenZyZzNRcERW?=
 =?utf-8?B?bXRlMnRlQkJHeTJKUVJtb1RlQ0taclB2UUZZVGQ3WWhvVGltV3F2R2xoSThi?=
 =?utf-8?B?bkNZT1VhWnhVeXhMaFp1b2xVNkJFR3FhRzM5VnpLVGg5RVNoeFc0TTVXNFM3?=
 =?utf-8?B?S2NaaXljd1lHS3FDQXZhbDVwQ0ZiWStBWThkNnpUZnh1QU0zaTlqb2tvbG9t?=
 =?utf-8?B?dDVscEhHQlplMm1ENUhDZHdYTEU2dkNSUjIzb2s0Y09aV0FxZTNLQ0VpUHZP?=
 =?utf-8?B?dFBabDhtdEJES1EyS1BtSGxGN2NsYVpRUStvangzQ1krb1FweG0rN3VXNyt2?=
 =?utf-8?B?Nks4QjRlTFRBY25UeWxIdVk2UGpZdWNKeTQwbk5vTThzUHoyZXRNOGxHV1dj?=
 =?utf-8?B?RHpyRnJJQkdHT2I3UVZSOXM0TkxzS0J6WnduSytqMFE4dmM3eW13U2lWeXFn?=
 =?utf-8?B?ZjRoblh5SWRrVXNJVSswK1l6VlZNOWd4ZmhpZ0s0OWtjUkZNcWFPZkFtSFA2?=
 =?utf-8?B?REltSHB2eHNweGtBVXR1YUpOOGMrWjNkWmNtWGYrVFZiYTdOaGRhU2oyQUdn?=
 =?utf-8?B?NWVTZ25sOVlteXQ4cEw2UjVDdVVKQXZRTmxodExpYnczQmo1ZnRLQ1p1cGlP?=
 =?utf-8?B?Z3hSR2xOc3hnNVpyWnBXV0FXWGFrTkFGaXgybHlEZnQ2bTkrWk84eGlwSWdk?=
 =?utf-8?B?MW9DYTJvQUo1VHBhQUsxMEVnY3FJYXFZdSsxa0ljSDY4S1VBZkd5eHdSekRS?=
 =?utf-8?B?endFTklZcVNQV0hlRlRreFlDUStIbUpVVDdKTzg4MDFvamVjNWhHQ2ZNUGUw?=
 =?utf-8?B?VG02aFJmVVZBcjNsaUxnb1I4ditJQmV1S3VyRHFnMmxJdmEwVUE3cWRRZjQ0?=
 =?utf-8?B?S1p4M1BTMFBWOHNhMExKQ0FTeWVHcG5Mbjd5WGVpZWNBSE9nRjZGc00vVERv?=
 =?utf-8?B?MjJGOEsybFVIQmIvN2dxMnlOaHFDTG9XUFdFZGFwaFBEbmNLOC9IOTV3UDZI?=
 =?utf-8?B?SCs3YXd4V09mTUN3bStWdVpsZWFjWm9IUHpKZmNMcjJZemRxQzd2MUgvYnR4?=
 =?utf-8?B?MnByOVFzdEJnc1RIWXhweTNzRWdWNHE1a29BV1dhMURIdXUzZEo0SXpkY0VC?=
 =?utf-8?B?dUgxSVovRlNPMlNSczF0dTVWdGlvaVo2S0FoQWl3enlncHBoVi8vd0V5RnFY?=
 =?utf-8?B?RzRON2xMZnE5Vi9BVWFxVEVjTGdoY1VIaHBBZXNJT3E1cFFpTmNUM1p5djJv?=
 =?utf-8?B?ajF6N1g4bkRkcDlYbGYyYVhxYm82L3daZGpoYWV0eEo4enNMRGpSOWlUNVEy?=
 =?utf-8?B?OTFwQ3VvYzhQZFpWNlo2NVpOaXNEc2JUY0VpZlRaWmFidUF1Q0JZSkFYMG9X?=
 =?utf-8?B?ckhWRXlxRFVSY1lFdUlkSjA0bGtrNUk5Mnk4VFZvempmSk9sSGJEQ1NKaWw4?=
 =?utf-8?B?KzlVb2VYbEprOTJqTG5iQm0xL09YRzl2aXdaeEN2OW9kenJIbkxrUUNCU1Mr?=
 =?utf-8?B?dUdmWXFWY1ZmWm1VSys0U2ZnYStkaHZsSlhvYkhqNFc2djhPeUdvamlJTzZl?=
 =?utf-8?B?OVErVlJWdVZCQjRXV25yMnZIOHFTditKa1p4TXgzRFpCcjVDcndWWFNKZklz?=
 =?utf-8?Q?+aYU=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad9ec6f-0f62-4ea7-fd40-08de07515e12
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 16:31:58.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoTdrndOZq4oDlPTTnorARs58GrSlZBP2CvI41E2JLEZS79GTk83rMhwTkZGG4Aj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR15MB6481
X-Proofpoint-GUID: hl0Y_MhWXYc2vhKGlw5Un1E1VQ-NUqAO
X-Authority-Analysis: v=2.4 cv=EtnfbCcA c=1 sm=1 tr=0 ts=68e7e382 cx=c_pps
 a=S19i2aQNi83ZBCZ28RB3Sw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8
 a=P1BnusSwAAAA:8 a=Delcv-7GqBnOjYKChMMA:9 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: hl0Y_MhWXYc2vhKGlw5Un1E1VQ-NUqAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDEwMCBTYWx0ZWRfX2DLa60aeW4qI
 PyB4KR/6bv6GBl3hzPYjWbnBrwr0hpfVelWurFzCqXO4C9nCg3t3lv5dfDYdNunqeqsbu15nNLA
 /r3COj2XqGDfOdCs45O1CbbOAskLvoGdldhf5kVZZuafK+y4TX+7h3rLuJo4PzirOYRYrrayf+D
 FK+2NRXAz2DVL9lx5Tgg7/zk6+YGTXMtbcbmje9QgR9GTEs0i8RgE3i4rJiYmNosuGNvMt3BmT/
 n3Sl+HgfIz2XFolm/hPzzvqycLg9n91FJkMlfiLoimxadtMrKI4WQlOCYVcMC/v7+xTIDDes321
 u90Ei21Hk2oR5DWdhI3vF+dNKi5CBEEKGdvqKtJGBByIzUqKcTzrX7vZULGfmHq/vhAQyCRclr3
 eewqWFp8IiSi0zHimSKEi0NT7CJkQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01

On 10/9/25 10:30 AM, Steven Rostedt wrote:
> On Thu, 9 Oct 2025 12:14:05 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
>> Forcing contributors to pay for access to proprietary tools is not
>> acceptable. Forcing contributors to even run proprietary tools is not
>> acceptable. If maintainers want contributions to go through any
>> proprietary tooling before submission, then this has to run on the
>> maintainer side (be it on a maintainer's machine, in some form of CI, or
>> somewhere else).
> 
> One way I see this working is to attach it to patchwork. Sending a patch to
> the BPF mailing list has their patchwork trigger a bunch of tests and it
> will tell you if it passed or failed. I'm assuming if it failed, it doesn't
> add it to patchwork and the maintainers will ignore it.
> 
> Attaching AI to patchwork could be useful as well. But this would run on
> some server that someone will have to pay for. But it will not be the
> submitter.

Just to clarify, that's what already happens with BPF today.

Ex: https://github.com/kernel-patches/bpf/pull/9962 are all from the
review prompts.

-chris

