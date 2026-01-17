Return-Path: <ksummit+bounces-2779-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C6BD38FDC
	for <lists@lfdr.de>; Sat, 17 Jan 2026 17:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E92B3008CB7
	for <lists@lfdr.de>; Sat, 17 Jan 2026 16:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AED8240611;
	Sat, 17 Jan 2026 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="fWNWGu7d"
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5889475;
	Sat, 17 Jan 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768668903; cv=fail; b=YogTAVzolwr8d8eM5JKE0MbgHjsJfUT5WpAFwhZMTGP552iUfcksmliXA8my1EstN6JJY6DvVYMBkHDnYfZsaksQ7IlfldByD/n74SsuOcn57pg5OZ0fuhAZ/1QPLOQSVIjZGLIMWIq8kr/PZvVWjIH8tWgBz6kEOiMqXif2t/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768668903; c=relaxed/simple;
	bh=je7Y+izrH+sAbSv/kwEDrou2iCR74mQns9fCCCxgspw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uMxLHUi9T9jrN67exZTNnVa90dFGirvDLl/plcyUbGygX+eLrU8JmAfhmFyy04R9jHNGGhDdfsWBQKVO6HVxNJ6Uj/42oVDe7CglE/aV8x6sqMSVNy9iGd4pTWH6cDtHTIjPfO13Q1fph9h17j67p4CVSyrAJNU6CtJSHDm0umw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=fWNWGu7d; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60HGBJHv022747;
	Sat, 17 Jan 2026 16:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=je7Y+iz
	rH+sAbSv/kwEDrou2iCR74mQns9fCCCxgspw=; b=fWNWGu7dCLcNFsePIFsB3ym
	ldonsP8omgYdMgx8CqnIaqDtBjAwrP1JUcqoAq1/gZhDGK1RiapeEp/T/CtYRoRm
	i4rYysArFCXn0OWrA9DnIy0uMWye5Dd4CMMitXSOJqq7Dr1+LZ/+hzbiNfA61PlH
	yvlm99WN4NvA/S0oEm89Wesf6Pr1YqVhrUd53qH/oQbi99eiUUrV9uXqVRYR8TCc
	4lYRRE0JL1wDF0tWBC6aXzRNwD3+nGa5f2FL6zfMH7TkpjerK3OmSxrCdyxxcSOv
	InsTlTDHIW2rk27sqPE+nqGSFTvwBm0692dDZuSDqggwuG5emCNswXKscvlEDqw=
	=
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4br2tpgf4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Jan 2026 16:54:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfQQYKWhnNk8fFPbaeru0mRS/kE6hA6aLn/J3Nf3y/fw3eoEkwCTLSWWbuDv8pJdTInwKoOaJCRBxar2dw4e8lu2z8cX1st9aqDWtuxqjQDZwB/37BzOyZy7MjEgD+K1rhuOQs3swXp4SU4+pqc3KoePIc6jjSvXXvUopBvkIfWyRKFwIh0p7vty+HFOddsvDOsDoatUKYKSm2SRN8XAZSJVUgJfW/DJYZGEfbUV0Ev2R1wI4TFIFrI8PvoFt1O+ZJmS/DHWwa5uJahsFqFvC1dBeJeCcdyGe2n+rDH5nth4UB22+LqaPH8UjBrkU7FR7lTiGBkLSAseMMqfUEDNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=je7Y+izrH+sAbSv/kwEDrou2iCR74mQns9fCCCxgspw=;
 b=L2NdI1lPZe+weM831V40Fwqu2+qt4/UX3NTXiws9c7ql+ifNevrnJl5Ir7poeoeAbSChpskBSo7ASh1Ky+pVIteqbBRe5C/3PV9722eD3Es3KDmD1I5OrvmkCyI80VKXt9/kUtiP2Q9bdvOX+whwfA6sjgBg3ebabsyqbJvxQ5gdMFjpObiepUzWX/Ikv42vTnB9gEOUL8E12S4xzFIKffGQDJ9ISWssT7V+UGeWa05G25RcB6vesuuKEa1CoOYMaiGLcpWm36t1yPq84xKjRX7c4MB/DndxjnA/qL77XuC9lluzSRse8oPflT51234fS8FNswt/k1EEmW7tc5EaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PH0PR13MB5639.namprd13.prod.outlook.com (2603:10b6:510:12a::14)
 by DM6PR13MB4432.namprd13.prod.outlook.com (2603:10b6:5:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sat, 17 Jan
 2026 16:54:43 +0000
Received: from PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4213:f165:7017:52a7]) by PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4213:f165:7017:52a7%5]) with mapi id 15.20.9520.005; Sat, 17 Jan 2026
 16:54:43 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Alexey Dobriyan <adobriyan@gmail.com>,
        Steven Rostedt
	<rostedt@goodmis.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>,
        James Bottomley
	<James.Bottomley@hansenpartnership.com>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter
	<dan.carpenter@linaro.org>
Subject: RE: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Thread-Topic: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Thread-Index: AQHch82QTuFm6QsXuU+ZcxDFTDwO17VWkO8w
Date: Sat, 17 Jan 2026 16:54:43 +0000
Message-ID:
 <PH0PR13MB5639535AC3D1232831FD2380FD8AA@PH0PR13MB5639.namprd13.prod.outlook.com>
References:
 <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
 <aVUUXAKjiNroU5tR@black.igk.intel.com>
 <20260102095029.03481f90@gandalf.local.home>
 <38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
In-Reply-To: <38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR13MB5639:EE_|DM6PR13MB4432:EE_
x-ms-office365-filtering-correlation-id: c936ac7b-cc2c-4995-1e82-08de55e91ce8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RGRocVRSejBmMTlHSG9COUJQck01bWNoWEl1Z2RrZ1huQTl0WHA2Q0w1QmVE?=
 =?utf-8?B?a0dQTGpEWnZRYWpHckxCekdRTDIrWXJTNXpXVTlsa2R0ejRsNEgzZnhxVzlt?=
 =?utf-8?B?c0NBU1F2NGNCclhHemx6MytIOGJHZjJJZlhIL05ycUNTTXdlQmdEUUNrc3Qx?=
 =?utf-8?B?djRXdDQwZE9VZkYxbjZHL3VJS0ovN1FZd2UxVU9wd2d2K25pME1MVGxTNURJ?=
 =?utf-8?B?c0ZIaDZMOWozcEU1cE40SmFybkc5ajI0OXRUazJRVWJxVlhTQ0g3YVpwMUVs?=
 =?utf-8?B?YUkwYnVKQUV4d2RwMFBHU1BXSmt0K1ZIMTJKQjBTNDFSbVM5RFdZL0w5aVZo?=
 =?utf-8?B?eWxvanUyYXg5TXdIeE5nNXhPUzJnTVlRZkY1OGF4OFRDTFlFZkM1ZFpUcmtw?=
 =?utf-8?B?Yk92bjZSREVDSGQ2ZTRFeU1rZGxBdDZESzdwa09WdUpKcGJHOTI1WkEyQVVM?=
 =?utf-8?B?UVU2dVM0SWdUZUxpbHltUjEvd0R2eWZCcWtxZWEwS1FjSVJzV2p1SGwvY0hv?=
 =?utf-8?B?cnZXdy9EK3F4dGMyeVZXeUQ4cFdPM1dIeDRLZE11VkJEZzhTRXdNVXZNcGVS?=
 =?utf-8?B?SlRiRWFnMHFFd25vYURBcEx4c2d6Y0t2NEUyNi9wNGdmVEpHY3o0aXRKdDg3?=
 =?utf-8?B?TkI5TE9EQUR6OFNlQUhhc3FSbkZ0akxqVnhwdjBLY0V0b3F2MWdvTmJWNUNu?=
 =?utf-8?B?YVlyNFNVTVFZeEtINHM3YXJHY3FJUEZ0Yzlsald2d0tubjJ3M3FKUDNzVlIv?=
 =?utf-8?B?ZjVsTzdsUy84Q1p1RHZlTjNoQ1g1ZEM5S0ZtWXFtbmdSZEVPL2RBQVRUaFFN?=
 =?utf-8?B?SDV0dThQNjl1Y0F6ZUZjYWlZTnFwNjc5NzFUaG9mS0FIOExaSHo4Um16MXJ4?=
 =?utf-8?B?WnFqZE5mMUh0ZWVOeitMUDJCTnlrSld4RHFqOGhmM2p5NFNUYXZwWlZSbU1y?=
 =?utf-8?B?MUdkWmcxTUhoYk4vWEpPZk5KODFoK0tWU2tkS2NwWTFsZDFJdWxFbkVGdnBm?=
 =?utf-8?B?YlpESUJVTFAxWGpQcUVRWVUwTk5NNGhSQlNpK1VzRUpwM3ZKMUZJRjd6K0d6?=
 =?utf-8?B?TkVGakttUlk4SWxtVURiOGt5UTZXWU9KSjJ0b1FHUEk2MEpod1dIc1hzUlZM?=
 =?utf-8?B?aXlLN21zSTVWZGxiL1pNVmszdHZnemdtdVUyb0ZxVkE2b0p6SkpxS0lwRmcy?=
 =?utf-8?B?ZUx6azFyVEpxNnhkWTBNblRNazR0NXZFb3o5SWZoS2x6Q2V6ZDhtaEJubG45?=
 =?utf-8?B?U0VFd3plNUtDeDkram5ZWDlhOVFkYTdzTmVRWldjN0VnMzBISGNPZEY1emhZ?=
 =?utf-8?B?VnlPL3NNZFBHdzhySWxabUMyd1VEdUJZb3Q3Z2lzZ3RvMitQd2NzeFMzSkE3?=
 =?utf-8?B?bmhvS0VqMUdnNlZqZ0Rmdm4zaVZzQUl5OXFjQWkvdVFXSzUxY090RTAvVklo?=
 =?utf-8?B?WkFHcjZMM0FPRnB5TWE2WjgzM3lqMUQyN2pGcGlGMWpOQVJYemdNYTdFZWNS?=
 =?utf-8?B?Rk1mL3ZWeGV1dDgyZkhuaUFmU1JpdUVRSjJxc2JOQmpPR1ljcXc1ZnF0dGNP?=
 =?utf-8?B?ZWdYQ2FYTW1IazB0eTlPcVhkaWRQVWdyT1JZbDh5c1BVb1kvdWZkRTd1aWxF?=
 =?utf-8?B?VWV5MVJ5Q1ZWZGV0RXVpcXl2WXQ3OWZhbm9WU2tqcElwckdKdlJGbXZMUFdP?=
 =?utf-8?B?UTBlbFk0YzZjMklQYlpBV0pMdkowNjdMVTh5U25RMHdObWRLMXFmNkFiRW5Z?=
 =?utf-8?B?aHU2bjFCNWNkWmR3Z2huQTRQR3cwWmUxNXVMMXVoK1NGR3N6N3hjR0tXcmFo?=
 =?utf-8?B?Z2hVUGJuZ2t0cllkZnJtbzlKcTBmVENmbnRTdzAxRldjMUg4WDRtWGhtM2xY?=
 =?utf-8?B?V0xDQUNMTEZ4TmtGVHpoSm5DRXA0RHY1MENxaUFuTjNERzZ1OVZyMXZ4WW5B?=
 =?utf-8?B?T2hxS1NKYUN0eStZRVNUd2FEakxFeDdxZWdNdHg5VEVhYXNUWlZLOXlDckVy?=
 =?utf-8?B?cHh3bHgvUHV2VTRzM3hKblBjNFpFWGxFVlBseDJRZEhDSFhlaU5GaDJBdTV0?=
 =?utf-8?B?eU9UbDR5b1NKSXBHTHJvLzdyTFBTdFhkMEl4d1lYN21iVHlNYUhaR3ZBZzNH?=
 =?utf-8?B?YTlkU3N3ZGVtaUZ1NjNvb3pqUzRXdXpldkdtVStFNDdaUmk2eEpNUUJBQ0Q4?=
 =?utf-8?Q?9b0dIuNwltkJnX0yhrjA1dk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB5639.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUlmVFYrT09aNHI4MnFncVNmTlhqVHpiL1JlY0RrNVpQUnBWVmlrdyt5UGtN?=
 =?utf-8?B?WnVZRlZWSVoyTlRFV2d3SkRtOFBJTWp1VWFxUm5xRWJ6bU1vME5QdHJZMzdY?=
 =?utf-8?B?aVl1aTg0Q2dMSmowR2FJc1UyajZGUE1kbC9PbGNuNm91c1pVNE5DMlN3cjVP?=
 =?utf-8?B?b05Ma2VCSzdrbkNoVGFpMExQV2Fhemhid1Nwemc2eFdFQTNjT0sxM01sWUlL?=
 =?utf-8?B?dko0ditSemVvRFh5aFdxVFN0ZG43dVlkYks4ekoxVmxTRFBKMFBtdUxZcWFE?=
 =?utf-8?B?c2lVeVUzUjRnV0FBSDluSmhKUi9pY0pJbENSSGk1eTRoZThBbkZwdnZDU1RB?=
 =?utf-8?B?WTIxa2E0bmF3OGx2ak5NR0xHalhrUE5TbGs2OWE0WGgzbnhjcnV4czdyQkxI?=
 =?utf-8?B?NTEzNTdXL2VWL2lNRDZpUVd3VWFWd1F5QjJFbW5lUktQc3lxa0dZRHd6TG1q?=
 =?utf-8?B?V1NVUVd4dVJWb1NIRzZkWndaYnNHNzFJV0xGOVc5YTExRWRTOHNYSjJ2OWRF?=
 =?utf-8?B?T0VOYW11VTZiaWV0bDI5dlFhY213aVpiVGIxWFQvRWxBaDNrZmNSbjNxZ29M?=
 =?utf-8?B?WUx2MXY4eGMwb3NFUmNVSlNDVWIxSDN4ZzhHd280VVVORUVYaVZPcjdpWmww?=
 =?utf-8?B?ZDN5Zk5yNDNWRFByTnM5RG1NbElzQS90U1NQU203dU1IV3RIWDBPdk00YXQw?=
 =?utf-8?B?Z3VmYmlxSitxYkRYKzh4bTc3NnIwdTZibHA0cmkzaFVqRVp6USt4RGVTNnYy?=
 =?utf-8?B?b2p4U3YrVlBTcU1jVHAwa2JUVWlwQTM3MWphZGFTK2d0Wjc1aHRYQktLNGNX?=
 =?utf-8?B?L21JMmFybFJZMmhEWXVyUVpGanNCWkdKblNPTFlYUzhRSGZWaGJPdWxIczEz?=
 =?utf-8?B?WEZyY2V0cFU0YTRISTFTMWZlMmpnTWFibVpYcUk4L2hwVzgrb0ZFUWZ1VFNu?=
 =?utf-8?B?a2tieFZWTWV4M2U1MjN6VzAzN0dTZi82cWI2UGFLMzJYdmNGWjNLQ2RqM0x5?=
 =?utf-8?B?ZGNnd1hRRTAxU1NWd1MrTytTZ3o0MUJlMmZwSVR3OGZVVVdvaXFwQ0NnTnJH?=
 =?utf-8?B?dmlrbGFRcFNhaGNvc3RxSUd2MGJ0Y3U0eWxYWHdvRkVPZmZYOUN0R0tCRnU3?=
 =?utf-8?B?R29ud2h5ZnFtL3FOREVsUjAzRnpqWjE0Vm1MYlRYdTdwbFR0Y0VzZ25XTUtn?=
 =?utf-8?B?eDdSc2VET0ltV2V2QXZGKzBIZHc4MDU5cnJBYW9zUVdWSS9uTy9RaXArRzVF?=
 =?utf-8?B?R2xEZ25NWm4zbmZFZDJtZnBncTF2WTAxSHovaW9sMmFWVGg1QUdrK2xBWUow?=
 =?utf-8?B?VXExSFBDSFBwNVJJaHNlYnI4ZVJQOHNmRFZJY0p3UitJYUo5Y1gyNzFBOVox?=
 =?utf-8?B?NlgxV3prYVN2d2ZuQXgyQ0hTOFRoMjhhRGhQaFc2Yks2VkF3VERwN25kQ0xR?=
 =?utf-8?B?TUpEMXdnWGhyUkNQTGpsSFV5ajRob1RpbkhzNC91ZXhwekVqdU5NYkdjd1RB?=
 =?utf-8?B?RGQxWmZ2WXczZUY0bzdJY1FGeWNjUEdHa3c0Z1Z1QzlFRHRBMnVwR1RDRzR0?=
 =?utf-8?B?K1ZYT0E0YkhtY29jS2NZUEFqVi9XdGtyNGpndlFnRGpSYXgzbHUyTWljQnZ5?=
 =?utf-8?B?WGRHSU43UHpxY2RMWkdqd01TVUMrRjNodUdlYkt6NEx0ekx1YmVoRjhjcThU?=
 =?utf-8?B?WFZvSWY3a000YWtqTkp4RUZ4OUhxcnllVGwzTlN0K0FoSm1GZ3d1OStLUU9R?=
 =?utf-8?B?Wi9vZUwrUHVqRmdkaUF6RkJHOWZ2VG0vY29YL3pLQVFtZTQ0VzJWRUtscEZr?=
 =?utf-8?B?TnJJa3BqWGxaeWtJa2p5Z1ZlOVN3enhsc0h6Z2g5bzAzSlZRN1lNZk1aWlZH?=
 =?utf-8?B?RnFaUHIzOWxwUHdFMW1WUXFUc1BuM0FmWk42V2wyZkdSWXVGZlhGTGtsTXRq?=
 =?utf-8?B?YUkwR0w1NFlzVzI3Vm42eG5JZ1dZWmg4TTFqcFE4ZGM5STRmbzk5MldmbUxj?=
 =?utf-8?B?d2dPREZ5Qnc3ekU3YWhuNHIyNGVGMDBJaTBjUU5wM2MyVUFTVDlXU0hMQkVN?=
 =?utf-8?B?Y0xCN3B4WDhKRy8xQnFFNlp4OTFydE93bXppcU9WRnRiVTFpWU9YbUNUQlli?=
 =?utf-8?B?eDE1eDNNZExkMDhwTi9zeFFLVjZrTmR4eVpMTzdwak02MDM1SVRuVU9sL0tR?=
 =?utf-8?B?N01ELzdLYTE0T245TVdmd1JYOUNsZzlHcjQveC9YZWNrZFFxTHJKKzhqUEll?=
 =?utf-8?B?aGlhR2FvWFY4M3hwTWc3S1pvY1dpRTJkQ2Y1TExsNHZDaFc2RlJKU0RoV01z?=
 =?utf-8?Q?QC3znRaEeowK3TW29K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DlNayKkinQhUACci31Sf0x7RrpvPrpJNEQ8D8rxIs54UqpmIqxeCuXmPj6pXlLje8y46JC6jy32q2EXbmOEGRNB0Co7kM5WkVLyeoUqG50cJUul+985sFzneH99soO8fHPILosoISW2Hx20ooL+bXLHSZ3YBJAnW3LlZi32rB8jwki/AuSc6Gp1hkeOq2lZJBxM6i+HAl9eHGsB3RfjIm6stLUcdDa+kPV8Y7SdWMQJ9mSUs/yTiudo6d8tbQc3zb5F1sB2/+XHiqZwtAh4eOHt9yoTpNpJBZIE2K71W6Cr01xLRit72uxag2u2RZuBuR90eWxP039Nz9IXNXEx16h6vD0+/DRyZfmcSvrH0o+5HSwhO23aqcxx7EASrD4zBz21/4NDG+brXO/QWHgFC88qFu8yvNASA08eTD0AbUt34Slr1r4OHt6eqOl7b0VQIS2Au+fLP/mTyV/TysgPBH1lEAeLL5GTjFUk0mrSoqS5JlL/KJwZjwlPHIQW5wsBmqNfhL7XhEYrkxTxNvdusX5iEXmNbMMqSrj00TLf5nFxiDiQmpcKwDoXwzodzKPjmFhLGYEsnhTdTJ4i/8inHAw9xnQ9JDW8ceEacRBBObcx7/9VNgfIfFaLEcrovFROw
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB5639.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c936ac7b-cc2c-4995-1e82-08de55e91ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2026 16:54:43.3567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TI5q5mwZu1fRja0MXOS5321uIJg1PXFFZBj8on9zD/3dNgIb58joIap0r+bmSJqq4zFuMpQ3IN4ir2CoGsAlfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4432
X-Proofpoint-GUID: 2lpWTGKX9221s4r94W8y3z0dB3-vJ9LI
X-Authority-Analysis: v=2.4 cv=E73AZKdl c=1 sm=1 tr=0 ts=696bbedb cx=c_pps a=iUWcX4Zb67NrYBHNvjZ/UQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=9JYnik1BGoTEG2zx5TAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDE0MSBTYWx0ZWRfX+bEX7UboxvDR DHtMP/IpUyIF2PGqaISEIbg0uvW8RYBeKLfhDIwvSX1oPq1C4y21zM8ql1s1odVoFtWKL1wIFFo 3en4P3vW7ziDN7zogEgJPOsfWiZqqys9I7MIqf0WQF0s+Vr/XNGJcSn7J6bwLyvIkeh4AHeJWXw
 4KnXaq35gpsEJEAbQR6kbNDw7Jnf4LSTGqBUkmcS9Ukq9YhVrsZT580HUYMlSY3RsZ5o2rbDqOv UdabG2Ztb2J+E3LLtG/qGY3XU0MQaaaFxzXsBYtQBrgVgbNY9HQr9cSWGjfg4mwScwAGSCfhD5y JkWKvlvRs5OXttt6x2NjqUy6GmtkLBnunGlsPKfiYuRhPOg8rtnyj3mulpjccuOHg29L4T7mtFj
 tErWdLlgxYmbmr31VEQo9Lr9YMYJPMQuMTvo82WF1cEWMjT5vmnSNOAjqAswgk5j29DFqeoRS4H 1wKym22G0PUJ1EO4TwA==
X-Proofpoint-ORIG-GUID: 2lpWTGKX9221s4r94W8y3z0dB3-vJ9LI
X-Sony-Outbound-GUID: 2lpWTGKX9221s4r94W8y3z0dB3-vJ9LI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_02,2026-01-15_02,2025-10-01_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4ZXkgRG9icml5YW4gPGFk
b2JyaXlhbkBnbWFpbC5jb20+DQo+IA0KPiBPbiBGcmksIEphbiAwMiwgMjAyNiBhdCAwOTo1MDoy
OUFNIC0wNTAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToNCj4gPiBPbiBXZWQsIDMxIERlYyAyMDI1
IDEzOjE3OjMyICswMTAwDQo+ID4gQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0Bp
bnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiA+IFRoZXJlIHdhcyB2YXJpYXRpb24gb2YgdGhp
cyB0eXBlIG9mIG5vbnNlbnNlIHdpdGggaGVhZGVycyAobm90IG9ubHkgaXQgaGFzDQo+ID4gPiA+
IHRvIGJlIHNvcnRlZCBhbHBoYWJldGljYWxseSBidXQgYnkgbGVuZ3RoIHRvbyEpDQo+ID4gPg0K
PiA+ID4gQnkgbGVuZ3RoIGl0IGluZGVlZCBzb3VuZHMgd2VpcmQsIGJ1dCBhbHBoYWJldGljYWwg
aXMgdGhlIG5hdHVyYWwgbGFuZ3VhZ2UNCj4gPiA+IG9yZGVyIGV2ZXJ5Ym9keSBsZWFybnQgZnJv
bSB0aGUgZGF5Y2FyZSAvIHNjaG9vbCB5ZWFycywgc28gaXQncyBwcm9wZXJseQ0KPiA+ID4gcHJv
Z3JhbW1lZCBpbiBvdXIgZGVlcCBicmFpbi4gSGF2aW5nIHRoYXQgYWxsb3dzIHRvIGZpbmQgZWFz
aWx5IGlmIGFueXRoaW5nIG9uZQ0KPiA+ID4gaXMgaW50ZXJlc3RlZCBpbiBpcyBhbHJlYWR5IGJl
aW5nIGluY2x1ZGVkLiBBbHNvIGl0IGFsbG93cyB0byBhdm9pZCBkdXAgaW5jbHVzaW9ucw0KPiA+
ID4gKHdhcyB0aGVyZSwgZml4ZWQgdGhhdCBmb3IgcmVhbCkuIFNvLCBpdCdzIG5vdCBiYWQuDQo+
ID4NCj4gPiBBY3R1YWxseSwgSSBsaWtlIHRoZSAiYnkgbGVuZ3RoIiBiZWNhdXNlIGl0cyBhZXN0
aGV0aWNhbGx5IGVhc2llciBvbiB0aGUgZXllcy4NCj4gPg0KPiA+IEFscGhhYmV0aWNhbGx5IGlz
IGZpbmUsIGJ1dCBlaXRoZXIgb25lIGhlbHBzIGluIGNhdGNoaW5nIGR1cGxpY2F0ZSBoZWFkZXJz
Lg0KPiANCj4gU3VjaCBydWxlcyBmb3IgaGVhZGVycyBhcmUgbW9zdGx5IGhhcm1sZXNzIC0tIGhl
YWRlcnMgYXJlIHN1cHBvc2VkIHRvIGJlDQo+IGlkZW1wb3RlbnQgc28gb3JkZXJpbmcgZG9lc24n
dCBtYXR0ZXIuIEJ1dCBpZiBvcmRlcmluZyBkb2Vzbid0IG1hdHRlcg0KPiB3aHkgaGF2ZSBhIHJ1
bGUgYXQgYWxsPw0KVGhlIHJ1bGUgaXMgKG9yIGF0IGxlYXN0IHdhcywgYXQgb25lIHBvaW50KSBo
ZWxwZnVsIHRvIHJlZHVjZSB0aGUgbGlrZWxpaG9vZA0KbWVyZ2UgY29uZmxpY3RzIGR1cmluZyBw
YXRjaCBhcHBsaWNhdGlvbi4gIEkga25vdyBwYXRjaCBhbmQgcXVpbHQgc3RpbGwNCmRvbid0IGln
bm9yZSBtaXNtYXRjaGVkICNpbmNsdWRlIGxpbmVzIGluIHRoZSBwYXRjaCBjb250ZXh0LCBldmVu
DQp0aG91Z2ggI2luY2x1ZGUgbGluZXMgaW4gQyBhcmUgaW5kZXBlbmRlbnQgb2YgZWFjaCBvdGhl
ci4gIEknbSBub3Qgc3VyZSBpZiBnaXQNCmhhbmRsZXMgdGhpcyBiZXR0ZXIgb3Igbm90Lg0KDQpX
aGVuIGV2ZXJ5b25lIGFwcGVuZHMgbmV3ICNpbmNsdWRlIGxpbmVzIGF0IHRoZSBlbmQgb2YgdGhl
IGJsb2NrIG9mIGxpbmVzLA0KdGhlcmUgaXMgbW9yZSBsaWtlbGlob29kIG9mIGEgcGF0Y2ggY29u
ZmxpY3QgcmlnaHQgdGhlcmUuICBJZiB0aGUgI2luY2x1ZGUgbGluZXMNCmFyZSBpbnN0ZWFkIHNv
cnRlZCBpbiBzb21lIGZhc2hpb24sIGl0IHJlZHVjZXMgKGJ1dCBvYnZpb3VzbHkgZG9lcyBub3Qg
ZWxpbWluYXRlKQ0KdGhlIHBvc3NpYmlsaXR5IG9mIGEgcGF0Y2ggY29uZmxpY3QuDQogLS0gVGlt
DQoNCg==

