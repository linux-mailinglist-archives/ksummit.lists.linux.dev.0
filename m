Return-Path: <ksummit+bounces-2452-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F25DCBC71F2
	for <lists@lfdr.de>; Thu, 09 Oct 2025 03:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D055E19E4857
	for <lists@lfdr.de>; Thu,  9 Oct 2025 01:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BA9158DA3;
	Thu,  9 Oct 2025 01:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="sXNFjcWY"
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB317D2
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 01:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759973901; cv=fail; b=aECBNNt8/d+9qD7w29zv27vIV+6sA2ntaxpxItIrk7D6dxAozpYbzI6AvEPqc/HriUNdjT9fzbFkMCLzMpGJ2kY5wCoFu58A+OcKk9TLkkOI2z/NYqZo0D0HOg1KKvuZl/3xm86wGcbMpRqv67bhyUM1mDcCGh4RfxWL00o3IWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759973901; c=relaxed/simple;
	bh=9QtC7qGR/Oa/Mu3G+gawGNB/v1jgrNQ4tPuHjyzURnM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r3Fp3y52huOQ3G9lz0ll42DWWphESYIELZxp/47jKbMPmhEPkK0H4ilKstNhypZJjOTBk4UHEiCb4pDLGOIdlmaKbEFTBQc8Q7wxeRxXf4sySgrGJY+AKZ6iWTFM3NovM01VRkaAAS1jcKQYFmpwZCKFo/ViRhlq8Ff14apcwoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=sXNFjcWY; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 598JNELk1103944;
	Wed, 8 Oct 2025 18:38:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=IoTRViKKTu7wm8eTdwjMkq2GPm1CPM+EKzhAMuSECCk=; b=sXNFjcWY+OoQ
	HiAzQNMYTqPfGD/YzDWyS3jsZZZSweH/RgCHr4Pt0pqmPPxmAAekHPs2WYuQ7BAW
	3Jm8vR0/S2VAb7R7SztGqDsQv735kGY8GnCHaNX0F3zEsYlJd3KqpYwx3Di000dI
	/UgfZaCyre+8W+NCYVCNxaO69FEoz99548eMsLj2hBMMW1ZP9YdIxi3nFCLEHSis
	id6nG36/jXRjFu0OqBfla6MjLAWq4rD6r2mRHnxawA4Bhfd4STUE2OVi4xysubEL
	4+o5OFrY5vdtbtH3pxtC8zIGmtYw/PF+PJkzwvycRkP7FrAExpHkiN8NWUXEyj7U
	+AGsmx6ffw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
	by m0001303.ppops.net (PPS) with ESMTPS id 49nx2j2j7f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 18:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVHA0n3bYulQIqiuUEOQkxUOyFUwDnOnRPSt6ux+ioxvo//tsCSgt9tqUB7NXkd8mF+jAl1GAb9Nm6vuMmHpmQ4gbApJ9wQg8N4mORvfVcE1u55SrlHb7Rm1yVtRRYCbLz7DhRinNREbiLbVYRKEv8VZm50qWIYpfAkrXoe+7YMoLwxTQcA4vOVfwTHSc37jwBf2NwkJLTiMn2nLGEd0+MC6bj/xehiP0TbugMRRDgFoqKYnfDzSGGyhKmE/P7LVWx/V00BJifT6g/J3UlSP01/a1knEiTVOdSBGfCGwfsVYQqAWd8yAsR7hpPM8fWAfax5Vga6ZaWJ5NyyXq206oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoTRViKKTu7wm8eTdwjMkq2GPm1CPM+EKzhAMuSECCk=;
 b=x0ybsYnv45IgE1TZtpbFASteYwHhigMeQOZemwG2VNpZIOIQHEO6XSKhWYnW6tLJhBv13oqLv9U5ddNgDYIZgAewDCeS/uJPbVWBI3Wiu5QgzcnDS3JDTNSs9SZB9UraFmNs862ZWt3bhQ1mtpyQ9R4KofclFRKX9dCgyiWoZ89zRgTubRB6WxMqxPd4Fkt+AipLRIEhho6CZVTlx73qjzJeVJ6l3OS1ERQzrbML11fnUvVgAxO0gjsKV49eYU0FlUjb+RHNFJ/IXKz+qPkNEEPD/Ktj78ufW1+ple0DeLKrXr6ir+olqE4w9G8L7fPftWDr9r1yW81QyP5Afggppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by BY1PR15MB6176.namprd15.prod.outlook.com (2603:10b6:a03:531::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 01:38:07 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 01:38:07 +0000
Message-ID: <fbea6c1d-8598-405c-a3e8-cc1253384308@meta.com>
Date: Wed, 8 Oct 2025 21:37:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Kees Cook <kees@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>, ksummit@lists.linux.dev,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <28cd7001-0a24-4dff-a4c7-714495bff7f0@acm.org>
 <3ffd9164-919e-4fea-8597-601452537331@meta.com>
 <202510081355.99CCDF8A8C@keescook>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <202510081355.99CCDF8A8C@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::9) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|BY1PR15MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb20a39-fb17-4e5e-4d8a-08de06d47f7a
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWt6QllNNmVCSCttRnkxU0dEaVB0NFlzdUhjTFFKNjFSRG1tNkI4UUoyajhr?=
 =?utf-8?B?MTArQnIrMGpnUmVVRGNYUkNISDIzZklpZVF2V0NzeE9JZXp3aXBmUCtKQWxB?=
 =?utf-8?B?NGp6K0VLL0NWNWNrcVBwb1I2WDNyVUh3aEN4SWt4Vm5Gb0NtcVdXbUo0NlVN?=
 =?utf-8?B?UFo1VW9yZ1YyMldHQ1NJSVBlVGhLMTFmblVtUVgvWUlka2NSallkckRDUzJR?=
 =?utf-8?B?SStNUy9ELzB0S0srVXRKeHRTblc5ejU5Y1F3UWV6UVl2OU1jY204ODlhZldO?=
 =?utf-8?B?eFcvVkRsZlEwQ0s1R3lNNWdQRzVHemhkNUtqQ3dKdFNreThCWFVTS092N3VX?=
 =?utf-8?B?U3ZTZUhBQ0NkRWZka0srREFBZ1YzL2V3dzd0Q2t4ckttTk1rejVUWGQydk1N?=
 =?utf-8?B?M0F0bHdjWTl2RjczaDh5dERYbmFKWWNiMGFXUGRRYUhlUU5jOE1uS0MzRmg3?=
 =?utf-8?B?Q2czM1cyRTBvNTY3dUsvV1hVL3M3dEptUkxMSWsvR1ZESXpzTWdPM0pFMFkz?=
 =?utf-8?B?VWhlYzc5ajd0L3FHTGFqUjAyMXV5TmlJa1hzdVkva3Jqazg0Rk5PWkVhQ2Na?=
 =?utf-8?B?YXhqVUhJSGpWaE9EUkRxOXp4RlhBenlkZUlNNE15czRCZVZpWVgweTZKaHJn?=
 =?utf-8?B?MGNFdDNyMjgzUGFtYS9peUwwNGs1YlVmVitXR2NtZHc4VXFiVXJrb01pRHNy?=
 =?utf-8?B?OFM5Mi83WG52dW9QNVJ1Q3pWU00rTDVRY0FoK2Z0RytKWXlWYWdSVzNhODNY?=
 =?utf-8?B?RElJTk9TRHJZdjBGT2ZuYlo4N0hTU1J3dVdocy8wb2xHV2VZNTFFaHBpVnY2?=
 =?utf-8?B?cU12Q0cxRXdhT3pKNytzRUgwVFZQQVJQanVYc0pZUndOYmZHdHI1cUc4WnhK?=
 =?utf-8?B?UFhxMVVXektCTlVOaEhFVlNOdEVwZXJndVgvS2UyVHNTdi81TW5FYklOcWlL?=
 =?utf-8?B?QlJGM3ZEaG1nOGZlSXkyM1hxb1hMMUZRU0Z6VXpFYzAwOTB6L1hCbFJORVNy?=
 =?utf-8?B?eEk1ZHhla3cwRW9KZml4a3VXaHBEckJJUTB0LzBPL0QyLzFnZzJLcnNldE1w?=
 =?utf-8?B?K0R0YnBwMjJYM2J4eWg4Nk5ZRjgyUXFlb3laQ3BJS3NrTUI2Z2xhbnIwanJX?=
 =?utf-8?B?eEJrTkRnVVNmTW9iMjNyYjJhMWtlNmtKWHhPcUhVd1VqRGJGdWpSMms2QXZB?=
 =?utf-8?B?ZEhzRVlyWnplczYzUjhKUGlHdGladGozaVZ1alFRb2tDdlM2T25MU1c1RTlD?=
 =?utf-8?B?QXR6eW04djJabzlHdXBtYUJ4VFVmYzBEYTh2SGpJbUlNSXhKWEdvQ3hnM0Ny?=
 =?utf-8?B?MHFwZ3pKcytKbGZCb1M3aDdOdXphZ1llTGh2N29jMDBkQ2p1ZVpuN3F1S3VK?=
 =?utf-8?B?OVlkNzBjbE41VVlMVE03N3pHa1NveG9OU0RMNFgra0wwdW9MRVpncWtnSFhL?=
 =?utf-8?B?RFh1ODRvdlR1TGc1UFVzTzl4UkJuMmdSd3VDa2VSVEFDRWlVWVdGSEQ4QytQ?=
 =?utf-8?B?U1lka2t4Rnk5MUJDQVhMUWx6dG9MbittWHZJYkU5MWp5RHpiSjJOcm1WYUE5?=
 =?utf-8?B?RkFOM2N0U2VUUHRLcWRvUVNSK1JyMkh2YmZHcDlHK3E2VzkxekdvYTNmQUkv?=
 =?utf-8?B?M0Qxcjg5aWVZb2ZmdEtuY1ZlRmhZaTNVMk8rc2ZFUk5pdlU5VHZYZHZHY2Yy?=
 =?utf-8?B?NkgyRFNOcmpsaGk3VkM5WTc2a0hhNFpQOWJEUnRqTkpwL21Fd20xYnpnU0x6?=
 =?utf-8?B?cUpXZ2JERlpCeGZqdmZDUmZRNGZsYUhXSC81cERUZUpZUkMrNFhQTm95Tm9O?=
 =?utf-8?B?TEZCQVNaMTZFS0wvcnkvbU1LUzNYRU1peXcwUWxTdE5Qd25UNlJ0aE9QNFU5?=
 =?utf-8?B?bGpRYzlmcEdwVjhzcSt2eDdydVEzelBBR2VOalNSNlJka1FRblA4SU5DaFJw?=
 =?utf-8?Q?NQgm22kMcQNRY7WJ4+25dTqJR1/InS0u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3pqT3BjVXhiTFNWYStCK043NXpHNmxzSVhLTm56dlMxQ0lQek43WXJGbXZD?=
 =?utf-8?B?bkc2L3VSNERJY0dYR2VWY2VjeUV0Wll6M2hHRXNHYm5Yc3N6ajJpa2krejNZ?=
 =?utf-8?B?NkZPbTRyQkF6dGRSZDNlcE5KMGxRbEF4ZkZON3FONXk4MFJiQWtEYmJPL1Fi?=
 =?utf-8?B?K21CWnV4L0VNTmJGV1hzZDBJMnBEb0xhendWK2J4WlBGUmRXT1poR3I1VEtz?=
 =?utf-8?B?UkRJeEUzWFpkZjlYa2IxRjhORGJwbVM4WHltY0REeWs5TzU5YkFSb1Bwbmlu?=
 =?utf-8?B?ZzJXUkdKd2QzMklmY2RWVGJFN0E0OWpwdWJkREZFaGVUTXppcEFiaU9xR0R2?=
 =?utf-8?B?VXZvdllqdkVVTXY1eCtxRVNUUTljWGlTM0dHcDFNajQ0Qnp0L0c2RFFlZ3Jr?=
 =?utf-8?B?QzJGdVlEbUpSM01QYll0MEJJN2ZWZyt3Z2Vka0dJaWxRekhKV0NMT20wQ2Rv?=
 =?utf-8?B?WUNoMmdPbTB6OTkwZ3VEV3hLcmxXbmx0eisrSjV6bDhJa2Y2dTBOcnJlM2dG?=
 =?utf-8?B?dG1JekNzTk9kMDZqR29DR05pYmNIWnpnRHRiWTBqakVhaEZVYzVySEkrR2VW?=
 =?utf-8?B?cFBEQmFudTNUbHRpWkNWZXNybSsvVFVMdktqT3F4TmhiN3VVUlQwN2dCTnkr?=
 =?utf-8?B?VmxFWVpVVHh0Zmw5cTNFR25wMm13dGNXM2pNRXdSMGFpREZpbHhGc3dkQVUw?=
 =?utf-8?B?Vys3anAyTWJ6akJ1WmErc28wN21XSXk3UGVpMmZSUUc5YnUyTXZVaDFQSVNv?=
 =?utf-8?B?V2JicVRIRjFjOVh2bld5S1RXZElucWpiNGY3Rnd5YVBsbFRibEpsMGwxWnJ6?=
 =?utf-8?B?Qll5VEhmTkVyQkw5OFVwekRocmFRSVpUOHIxUi9rcW8zaWlpUFk5RnlKWW9W?=
 =?utf-8?B?WnBtMDI5aU52ek01WkcyZG4yaDQ3ak5qRHh2aitXRHhJNFpzZ3FBdVNDRnV2?=
 =?utf-8?B?S2krWmhlTXJoa0ovSysrSlVCVG1TVDNGTW0wVlZvc3JNUEN5aG5rcW5lNUNW?=
 =?utf-8?B?UGxPU0NZbXlzSFNwM1JrSmY5YW9GT3BYdEc5MndMbXFmMnF5NFF4WVUwNW9F?=
 =?utf-8?B?UEJJT000bjgxSGM2akpqR2lOcnFiMm5BUlZFbTd0RVZXRE9jZWdxVVBRa2lu?=
 =?utf-8?B?ZlBQRW9DWFBYc0hJOWdXajVZV09kMlczcy9XazAxY01PaDUyVm5rVGxwZFBz?=
 =?utf-8?B?ZmJteXBhZGRSTnVSN1U1YlFnUTZodGlUTjZWaE1NNSsxanphRmcvd3BNazVm?=
 =?utf-8?B?b0xXZlRHUE9GbkE0YTZSZk8wckE0R3hFb3g5SHIvNkgxNHZKSkQ3bHlwTnNO?=
 =?utf-8?B?TUx6bll6OTdTcC85Nm1jWXlkSG9KSExyZTAvN05Sb1ZLOWVmblcwZ2dRNXZ3?=
 =?utf-8?B?MW05dGJHaUNvR21ZOFU3aUxYUVh2eHJXeHBSSVZkbDhBYzJFbjZzZDdCVjVN?=
 =?utf-8?B?VGJscExJS0xWaUw2Mks2cmdEMjhFd3ZrMWVKeksyM0M2akFGLzZMMXVwSlVY?=
 =?utf-8?B?bURwRmRmbUx2SURWd2c1b1BYWC9zTmsvb0VVckF5TU5VOTZFNFhNM2JVeTN4?=
 =?utf-8?B?ZWFXSmlKMU5qRWNtempZd0J1WGNKNU84dm1odiswUE9oOG1FL2pNRHRRMi8z?=
 =?utf-8?B?Z1NjRUllci9ISGVZTVRPNW92cTdDb2ZEU1pQQ0w2RUNReXlCY2E3Tm1HaE5Y?=
 =?utf-8?B?QnJrNnJOUUZpbmo2Rmpsa0V3Q1MzQjFBTFRocWt4MnVwWkRNM21XUXBQdVBM?=
 =?utf-8?B?cFk3emd1T1hZOXRKYXJZcjJsTzV2N1lNRnVoOFljbFlRQmhQWjVremdIcUtK?=
 =?utf-8?B?aFQxRVdxcXZEalhQWkpZSHRBajRIWTN2NXRIaDdiTTNIVlFIYklaSUQ0Z1NC?=
 =?utf-8?B?RW5RM2JwaVpRRVJBMk4xblFEcXpCTWR0NUpsTTVucDgxTHdGNHZuVDBHS2U0?=
 =?utf-8?B?V3A2SndVeWZ4M1RwWFpxSlhONVVRcm4xZGhhN2xKNm9xeEo4SWl5SUl1b2FW?=
 =?utf-8?B?aXdzelloSzhnMXBZOGNtNGxHVklHU1phcnJ1TWFwNGViT3NIYUZTTG43UkFU?=
 =?utf-8?B?NWpmUElSMXJFNW5IeGVGc2MzaklYTUpmNStnbFVNbFhHc3JmZTE0Z0wvL2kv?=
 =?utf-8?Q?JOa4=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb20a39-fb17-4e5e-4d8a-08de06d47f7a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 01:38:07.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teL1CyBU8Lj9en0YvCfusqm1K9SfXq4UTU/lQ5Opy2h5py6W6F7Ix46GExGIb+GH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR15MB6176
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDAwNyBTYWx0ZWRfX8SIHUou4qQee
 db0zFb6TY2wlVZKUuFjJYfn+eAMlqZgtCXxv2llh6+ZugAAwrFkDzv7oxdP1R/OifPSeQSruUDI
 lx/IqD/IrPtxu44UC1GE4hpHxZueaQhEfZqOGJcvwvsLXJrZa+sFJ53yrtHDwxckriTuXG3+O25
 PSAj3mnBo8GiBcvxDEOktrHCdehBE4KFG55FcscMTOpT16cMtYXe6nk4rHdzEBt3QTjvGsb8rwq
 zMUC2KUfB7bdeSBvaDg+P1xVuUC5Cgl1t5589/xX/cf2xWmkEerc0EBkqELLOJhUvBeAv5bJtCL
 GuXhIBMc4KCzMftCuXyWsqDDo19E5CLzzQnYAIi2QyxtUv+vhdR8LjogG6tu9GsOzr/LfOOEiQK
 bi/tZ9YwEJsT6F3BiLedbkqxXLV5VA==
X-Authority-Analysis: v=2.4 cv=HLrO14tv c=1 sm=1 tr=0 ts=68e71201 cx=c_pps
 a=IFr6uxAXmWssV7p2N+XdEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=6sYbY3tp1ebMAtmepl0A:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: EI0UhC_Xp8Qc7Lzb9PiuQWEqVCYJGAU6
X-Proofpoint-ORIG-GUID: EI0UhC_Xp8Qc7Lzb9PiuQWEqVCYJGAU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_08,2025-10-06_01,2025-03-28_01

On 10/8/25 5:08 PM, Kees Cook wrote:
> On Wed, Oct 08, 2025 at 02:04:26PM -0400, Chris Mason wrote:
>> Claude really needs aggressive use of checklists to get it to stay
>> focused, other AIs may need other tricks.
> 
> So very very true. "I did the high priority stuff; I'm finished now".
> 
> Your prompts are very detailed! Have you been able to use a feedback loop
> at all to have it update its own prompts to help you clarify its results?

Yeah, I started with a very basic prompt and ran it through ~300 Fixes:
tagged patches with known bugs.  So I had the buggy patch and the fix,
and I'd have AI review the bad patch and then ask it to compare the
review against the known regression.

If the review failed, I'd ask it to fix the prompt in a generic way to
find the bug.  The prompts would grow and grow and then I'd ask AI to
streamline them.  I did those iterations a few times and fixed things up
as it went.

The false positive detection was more manual, that was mostly me asking
claude which part of the prompt made it flag something, and then either
fixing that part of the prompt or adding onto the false positive guide.

> I've found that pretty helpful for development-oriented prompting. i.e.
> "Compare the foo.md file to what you now know about the foo process
> and update it to reflect anything that needs to be added, removed,
> or changed."
> 
> Additionally, have you been able to build any patterns from existing
> bugs? The "Pattern ID" stuff feels like you built this from specific
> instances?
> 
> I'm really curious if the "CONTEXT MANAGEMENT" section actually works? I
> never considered tell it to discard specific context like you have,
> "Discard non-essential details after each phase to manage token limits"
> I'm going to try that immediately -- I just have to figure out how to
> give it, uh, context about the context I want dropped.
I don't actually know...I asked claude if it helped and it said yes, but
claude blows a lot of sunshine about how smart your prompts are.

> 
> And the semcode MCP sounds very interesting! I look forward to finding
> out more about that. :)
> 
> Awesome!
Glad it looks useful, please let me know what bugs you find!

-chris

