Return-Path: <ksummit+bounces-2552-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76291BE3652
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEAAC19C537F
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA7631D732;
	Thu, 16 Oct 2025 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="AqfGPRM6"
Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020072.outbound.protection.outlook.com [52.101.191.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB84941AAC
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618111; cv=fail; b=mgMCFgF+OlpGoKxYi9qkg3Ua71HRRTIUX8q3ipM9yAR+MdVTC2IJE9K6bWauU8L/nUNNxT8TANcDynF9fNdvx3KUHkrQtP/0OvCbsqmB0AuBpMDvNa+L/nDP8TwDDdNNEsIDp2r0o8UL8aEykj23nyuKsgPexbBWoOAPP7O03XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618111; c=relaxed/simple;
	bh=bUSmVCR4AF7R8xxmsX6TODbJR1dfSFmET1C5q06MABg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q+zBywr9DPh++5kz7uc1dCigmYjXzhEOQSi+1I3S0UfvyuPuhWyNL13W6OW8g4smUg8PvTyGMHinAcdU3s2s9SiRpNw4YDaOe5fLlH7dteoqnyxEMc0vqKzkZwL3zphCbnAnwaSz9Vmhr8kxkyUuR81DzpVsiYCeSZ1yG14Wo3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=AqfGPRM6; arc=fail smtp.client-ip=52.101.191.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJ8T9zkpLxU5zHXzj1s2kUgCp1g3XILy6VwT1ar0XvLZj3fRNOQwKVOvCUfBhduozBWaBnXdPy8HEpqYIq+z5kgcfREDtpEDYc4nlOCx6m50UQupBr1CWtQYh31xMCfJkv3b5F3acml0tMB3pK1Gj0oew2UBmaWMoTpWaJF/vYOdaD98voQ0NfA4LNbiPwcNvSF0cj5GZluWdb/6sbTKDQkhkIYeMJDThwVgLLTclltCEQibZxv27dVtiuyYSHMM9Dyo96STBYr1BWOPW0aZodFKGl2GlqcejFnSZYHRsDf0CaqMSaAfT7MOs/yjeOKlcP8ENd+IErO7sNEMkQlaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE4CtWVUrWgu6dA8hNe6AWvZ/EvQi2U7KtCt0o50qnQ=;
 b=L37v6e683cQKc8sM9AHtNG2D4gUzHjXSta5gKlGHKpNIi1unhEW4QbAjUH1HiDirSI9/3UB7LpJCB2tbB392Wds0EUdO+0drgxtLXaYc9V1gU/OALbxiKVAbWpnXQFIS3DSoNrMbdt9e8vZoAyyT+Kq73xsJ/bqk3RrtkLBi9aRDOZ6zoZCVxyntuSlBCYJo4we1HIDrCcKkOWVVEob2Tw2wQjswBCMyOQYJhPIZHMXv4fBaQEZcj8KWjvmhOaQOWk8kbD9dVrmTyRUqmNPUPxirLRmrsZIVckMjaiWR0RrZ/zcP0QMkfiOC4L2uzFEJlwu9YtuMVqGeVdwX4GYV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aE4CtWVUrWgu6dA8hNe6AWvZ/EvQi2U7KtCt0o50qnQ=;
 b=AqfGPRM6QwUWCGG7J3sV0QwGObS+5rDpAxDyPHCIg2wTBUlOEyz176RPH2Fj9UnVmiYqJNWq85I+cLGtYwt64kdWiGyaTCxl5qsCi5yf4IKX8Xxoik4pUw/Z/AfzdHjD7+tPDv6lGL5q6L98yV2T6ab5pD3tpqI++hMulEK1ueXP+WHkpuKS1UiuPhO/l9cqfTVoS+k6is3uI+K+JRegPClqUI5Eu3WXHiDqphlGqPQs1KpcaO6rcdbhZluzfH8XMHkkSU+2/6rCW+RebUwVtN0nr6Uct0+ct8iGg3n12hqiMnjvoRSF2b6YvkzZEtqdTqVZZ6NoXErziassuykbkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR0101MB9230.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 12:35:00 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 12:35:00 +0000
Message-ID: <1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
Date: Thu, 16 Oct 2025 08:34:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
To: Greg KH <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh>
 <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
 <2025101639-thwarting-press-f0f7@gregkh>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <2025101639-thwarting-press-f0f7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::31) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR0101MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 02acb652-e0aa-4284-98a9-08de0cb06c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFRZQTlWZmlYMnpkM09Ydkt2dlRra2xOcW9zWk9ZUGZZTUZ5ZDNwcU1ndG9h?=
 =?utf-8?B?eGZsZVpaUGI3OThDeGNmREM1MDFPODFtdmN3UmhLSGt4dnJIaGtYMU41Qmhj?=
 =?utf-8?B?MnQwaFd4WTlpOTRyS3NmcDdXU21iaEQ1czlJdnE0cEhxOXN0US9Rc3l4M295?=
 =?utf-8?B?SkZiYUZYSGUyMU94eElLV1I0d0grMTNZSlFGa2VBS0UrZDJuckNIbHExVzJx?=
 =?utf-8?B?MEhzUExObjROanNhcEhRclVKc0pFenlDUWhmWFpMSnFreXNWYzViM25ncGhx?=
 =?utf-8?B?T1ZXczA2RlZweTJrVTR3U3RWM3FSUlBwbVZJcjJ3SGtwU0sxYzgyU1dQVXdJ?=
 =?utf-8?B?L2tpM0dhdmIyMVEzZ1ZWUUNRSG14WE55bEpQRmFKYkE3UmhtSWxjbTFNZG1t?=
 =?utf-8?B?MlhhY1NMWmpmeVhqZDU5WWY4ZVkwQkFaYTZpb0YrUW5MaTVCcTU2TWQrK3dU?=
 =?utf-8?B?eVJHRUM5bk83WW5iaGlNeHV3cUZjdWRGY1cySk9zbExGaThaTzRRb0gxNCtS?=
 =?utf-8?B?ZDMxSy9ZYVE4UVVMSkZidmJPdWwxSlpQWGdyaGllcThvVmNXUm1aYVZCdkx3?=
 =?utf-8?B?QlUveG15YXl6RDNUMkUrOXR5dmJKakFzZ3lYYnhzd3V2OVpESjlRVlh3cHZU?=
 =?utf-8?B?bExzQmE5amE1S2hlLzNDSjlGcGRSTUlOa1BBMW9QbTFkQVVwczdaelhrQkhm?=
 =?utf-8?B?ajZqaVY2cnlRVGgwd0E5ejgzc1VvWkhyM3Z4cktDSmR5Nkh0R3V3K0YwVnNw?=
 =?utf-8?B?cEJNMG5BZzIrYnU3by9mUDFzcCtRSnFzdnlsYzUxUnZiYzc0MkZIcXB4VnR1?=
 =?utf-8?B?WlRoUWRIRDhrd3pQeVNtYk50Q3NHd3FJT3k3cy95MlFjRmZrMkIyMVd1c0dY?=
 =?utf-8?B?TWRiQWZnV2tnUS9yeXBNQjd5S0MxQXoraTFFdWRNSVJJand3SWp3WjdSdnUy?=
 =?utf-8?B?cXJ5U0lKYmlmdk1aWUhLNmtJZTgwVjZkdmVGYzMydWs0ZGk5R2lyMXhSRy9Y?=
 =?utf-8?B?Y25FVkVDZUxraHUrZnQwckx6UzhKa05Kc0RWUDdTZ2RGWGUybmFJckIxMUVG?=
 =?utf-8?B?UTBXVnlPTVR1TTZZUWh1MmEwRGtVanY2YlgyMFM3TFpPM09TVWdLT29iRnNM?=
 =?utf-8?B?cmlJVnZPdEFOdmthaTB2V095UnZmczBCMDVEYlA2U0hlQVhOcmhBL3RhYjZL?=
 =?utf-8?B?bXQ2WWx3S1ptbWZNdkZSbUJ3ZWlMYlcxVXpKVnFGRlhoS1kwTlQ5RW42OVBh?=
 =?utf-8?B?MDNjb2RLWGRqbnBUWnZBYUZaMzBwY0xlTDd4cG9rMXFPOGg2ZUlxT3ZuelBL?=
 =?utf-8?B?Yzh1RTI3T3RwUC94ZjRQSElNTVNSaWMvejVJQTRBZk5Dd2FXUUdFSWNMczJn?=
 =?utf-8?B?Nk9jTDlOK0hFazhUSEF5N0Y0YStqZTZ6eFVsUFBUaWdQNi9JK09qUmpnU2RY?=
 =?utf-8?B?eXhjaVpnc01OU1Y4QWZBd0JPejdtYk9VNFZ1dUdCRHVFTTdjamVHakFSSVND?=
 =?utf-8?B?bmNRSVZEOFA5WFprbkdscXIwUDFHYVZaK0VnQ0lLVUZkRGRsU2xkS0JvVE5E?=
 =?utf-8?B?eitVTzYwMzRZUDZRZjVCalJUenRBdFlSeEpxQkVvcE9SWFJ1QTYvMlJvcThX?=
 =?utf-8?B?ZXhDVldGZlZyYXM4YzFwMEhicXlBdVZHcTNZVkNFR2lCODRpeTREeXNLeFMw?=
 =?utf-8?B?VlY1VDhNc2Q5OUFLeVAwVmE0dWI1TEd4eEk4Z3RqYWcxc2JSTkxJbWJuTGpj?=
 =?utf-8?B?Y2JUOWhZbjk3Q211RzZtRDhhRU5JRUxzRjhoeTZiSjc3cW84U0YrVTJ5dEJP?=
 =?utf-8?B?NHZIVjJ0NVVvdDlOVmRPU0IyVnFmZ09ObGFuRzBmdDBneUxXbzZ3a1hvT0pD?=
 =?utf-8?B?VFRNcVFLVURCSEpVK0I2bXU1V2NhMGExYTdRc3paekpzTlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0Nyd0I0VGpuU0ZRUTB1WWFtSThFaU5IUEdYMmZjcEI2N0xNSlFFTnJGWE1N?=
 =?utf-8?B?akx5SG5jT0ZrUnlvbnZWWHhTb2x1WjU5OE5Qa3M3UndmUzREMnBnUHJrZk40?=
 =?utf-8?B?dWhtVWhJdE9sRlV6V1pyM1FCMWUrcXZYQ3o4MTdsOUZpcTRYVWp3b01YSDIv?=
 =?utf-8?B?aGhiaGw5M0hTVmlRWkVKNThUZmZjb3I3b3JPZlczd0NRNGJ6WnFXdzUwbkVm?=
 =?utf-8?B?N3NPeUFPK2JnbkdyMzJETmVUb1BoUFp1MlVDclhENTd4d3dmZms4b1pFamdR?=
 =?utf-8?B?TGZBMjFhMmJUSXBHaTdtSkV3a3Y0cFUvZlBtMmlacEpSN04vL3BSNTA4ZGV2?=
 =?utf-8?B?OTB0cjhEVDRtWlJHT3FzMzFnUXRnN2hucFZwYzB2ay8zTVl2QklyVVliOWhB?=
 =?utf-8?B?a2M3SmtsYkVlNTk1R2h4ODVJdVRPNENuZjlrb1BTWmlsTElkRFFEeTRDRmdT?=
 =?utf-8?B?Yktzb1lmU05iN1E4NmxueHZ5ajlOaG9RT2prcDV3VXJ0UWhBc1ZJOTRib2Q3?=
 =?utf-8?B?UERBcC9NdVRzWHpFU1djVTh5UmVBWEhJNXJKa29iMy9lRkxyM2JXZUY4WG81?=
 =?utf-8?B?Ykw1Q2F3anc5V3h1U0JTclM4dW9UeEQ1V0hoMWJwa1RaNHNlemZEUnIvNXQ5?=
 =?utf-8?B?ZGV0U21BZE9VWHUwbkxwVmM0TWRYV0xtZmlwMnozZTdXNkM1d1ZmSGFSS2t3?=
 =?utf-8?B?L1c1QnAvZVdFTUo2V3J6VVFKYVNZdHZKK0hlZGlhbng2b1o5SnZPdXhSbk5O?=
 =?utf-8?B?YTVOWGJNQm4wNTk2OWFpRGwrcWhOM3cxUVpiUUJBSHhoUU04ZHF0Umc2L2sx?=
 =?utf-8?B?WWFwSlRPbVRSMzdqOE9ySVhWb0xVdUZBZmVZb3lrc3dNYnRqTlIzNmpBYjJM?=
 =?utf-8?B?UnFITnNtS29ka1I5T2xYZzFsano2SFRYYzZUcHRNektvR3NTQ2RoYnpMYnB2?=
 =?utf-8?B?S1Jqd3NtMktvV3VQdHhXM3o4U0RZS2hjZ0cvR2d0aUp2YW1RMVZOdUxPOTE2?=
 =?utf-8?B?alMrWW1kOUhJYThwaDN2akJleWVlQXgxSldZM1l1Z3lmUjc3R0JiY1YxSHpw?=
 =?utf-8?B?NEhodVBzN3VzZDhnMjBTaGtEb0dTSkc4VFQ1YXlPanRTS1NPMFpzR0dWRkM5?=
 =?utf-8?B?b1JhVHp0U3FuTm00UWhFaURqT0RMSUFqS2NNcUJ3aE4vUHlKYXFRSDFuMTdS?=
 =?utf-8?B?QlZnUzluQStKOWs1ZlM3NXVSeEFDMUVlMDZaQ0JXRlhVQjFlb21PTXU4RThp?=
 =?utf-8?B?S3VrU0RmWEIzdkpVVUVuQ0lPSUFDa0NoRXZ6SUZLbk9haVhXVFJjUXhTdm0r?=
 =?utf-8?B?eWtMRldTd1BMRmlpQzJOaEcxaExlRDJOeG5PUi9kVldFWk5jUStOejk2R0ln?=
 =?utf-8?B?L0RFcDFneUV5cE5RMlA1V3pTL1NpZSsyT3prZllFbDdESEVYbmEvY3UxRjBj?=
 =?utf-8?B?UVovbStZRm1xaXpJc2lQSkE5d0tkVkYzUU1aZVlRWE5OZ0daUE5hMDh4SzVp?=
 =?utf-8?B?c0hNeGNtOEtybk4yeUhnMDlodUgzY2Fjd0h1R0xoRnVJbWJiZ2NYZVV2eVB5?=
 =?utf-8?B?VWNzSUpFMzNSRUtKWGk5WHpxUGROQmwxclI5U1BNY1pMOXZrWlVDckovbzlP?=
 =?utf-8?B?cTFZa1pYOG9HdTIrSjBoTmNlOXpXM0xVRzAwekx2WXNXNFZINGQ2UkNqVjRy?=
 =?utf-8?B?YThUZDBVMEE5Vm9vczNSYXo3WDhIeFdITUVhQkZBMk95aHBwR1RyNUR3LzUy?=
 =?utf-8?B?QzBqVEo5dnNWVjRMaGtRTEtMTEhxbmRpeXIvQTlmcUdXdGh0YS9ac3FUMzJG?=
 =?utf-8?B?TEZ6bXowMDdobEt3dGREcHY4TVR1WmFhM2dJYStuTEVvazdTZFBFbXJaUGZt?=
 =?utf-8?B?aDVKRFNiMFJKbzRTSU9nb29MV3dUMXZlSTF0SEJUbXdYZjRqZ0Vhbnp3RDVW?=
 =?utf-8?B?UmJRV2tuN0lXcHNPVWlORlhyalYzNmwrb1ZDaHFiUE5rc1VCQ1FlclIxM3gy?=
 =?utf-8?B?MjhVblI4bFhqL1JXbDJsODNBZTNHQmdQdEZyWldONHM2YUltZ2NLSzRrWG5M?=
 =?utf-8?B?ejVXaUtkeXljUnlTVVB6NkU2UHcvTS9RbUFJNm5CS2NNcGF4VkVVazF3QmxL?=
 =?utf-8?B?V3FpeFpEZHNyS3g1QytFK0Y0NkZ0UmVtMWxHQWwwKzYvb2N3SW4zcVNNSWNr?=
 =?utf-8?Q?ZJUQ0mHFYQ9c8z27AwZzoHM=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02acb652-e0aa-4284-98a9-08de0cb06c20
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 12:35:00.3549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8z5TvLR3chqPMNA78AP0kii5rO4oP6pLn9uFWcMtaBnewx+lDJiDOntkAbgFekZLJhX5mANB3WV9DmzPFqheRezg4sR5ff98haZk8X1cZlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9230

On 2025-10-16 08:18, Greg KH wrote:
[...]
> Be it a link: or a message-id, or something else that I
> can "set and forget" in my git hooks and so can all other maintainers.

I can't help but keep thinking that we are trying to solve a problem
that is fundamentally just about namespacing with needlessly complex
technical solutions that will degrade the workflow of many maintainers
across the span of the entire Linux software development process.

The "Link:" tag is unfortunately a bag of holding for all sorts of
links. So if Linus interprets the "Link:" tag as a link to relevant
URLs with an implied meaning "see also" or "more relevant info
here", then whatever else gets added under "Link:" with a different
purpose is seen as noise.

One possible solution would be to introduce a new tag such as
"Link-Origin: https://..." or just "Origin: https://..." or
whatever better name we can collectively come up with.

That way the semantic should be obvious to everyone.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

