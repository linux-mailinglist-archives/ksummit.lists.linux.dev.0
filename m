Return-Path: <ksummit+bounces-2524-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2908BDADDE
	for <lists@lfdr.de>; Tue, 14 Oct 2025 19:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AAEB24F0846
	for <lists@lfdr.de>; Tue, 14 Oct 2025 17:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723813016F5;
	Tue, 14 Oct 2025 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOQGPs4m"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523B296BA7
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760464639; cv=fail; b=B8fG3X3w3T03Kj2iSO8INaxX3PeJ9wYiC4vJ19ciVTXnan5JIdRuFgdp59vqzY0dAYGjsl43OKpUup/5j8hDGz8B2GKmlEn8p3nT0fc4mFy5DS12gMVuR0jr11FC5cSEAJ/TNw5sJD3ct0YFSH18EoLcTcSwJEzQN4xPdimLjVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760464639; c=relaxed/simple;
	bh=W9MlUdFSG6F9b1SEYJC602IuMKAObZEevqqfldFxPuE=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=I0+cJbhKytzJkN5lY7ZT42XgTIJP32rYw9+vnkb28vRd/xAy3FBax3tewFE9OOYTXu9ED0Rg1H6eD/O7XH1q1Sdnk/MXgbvCrsihRTcJzGxq+EvFBurNMAyXdOfs3UESjARFYxLK1PaP0GGYiflYLz5OBjJHtMpWBr9TUq9RaiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOQGPs4m; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760464638; x=1792000638;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=W9MlUdFSG6F9b1SEYJC602IuMKAObZEevqqfldFxPuE=;
  b=eOQGPs4mbFnbjTIdHoXObD3qYBA9uTjIbCPqSXc3w0VEFEjjFMKIk2R/
   IqNEV3jpNluEDhg6tH2x5ciL7kkVftiFqVlGST+bdcO9sHcF0uawIztKX
   eR+Ff3ptPX5es/T0k5Olyepgl9GFJQvgB2OoxDVhqmVpizsp10VgKsWGc
   5MS+LL/3ZlZP9wj3+EvowbLZXZEDlWB9wEzX94Hnx01kRSEVkgxX8hYe/
   mDgv6FdgOc88Zs+5i+QJqmmH1hMh40j7FisbVrJEPeFE+GyARjawLWJs6
   a6NeWZzaTXe4oOdaZi0ReU/O0jQMAEghd1s22458ebJA8v7EhZJvIcAwE
   w==;
X-CSE-ConnectionGUID: veOrNXPLQE6PVUoy0SV7+w==
X-CSE-MsgGUID: uLN+Q0a9TTydghIfGqS3+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62665361"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="62665361"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 10:57:16 -0700
X-CSE-ConnectionGUID: C4v66mSyTe21HLNVG54cag==
X-CSE-MsgGUID: K1bmunb7Q+CiaJLE509C1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="181756600"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 10:57:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:57:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:57:15 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuH2IOIefU5/saLlbE5f8oMyM51A21Ca7Wpi6Gy5ghBFnC0eRL/BjNbwfv8MFteKv4mZBxeQUd6eXqXSj695zL+lSuVavnvUVhp1D4oyqKKAmOkIVYOcrosJEuG+scrrC1GRS4r8tFUSbH45JPnTKb1VTJuauxzgGPockURli4qgTZw2ygxMjIOfXuPdCq+rsfOfZgDecn4IkkRjYO3H7P7WFPUxyFL/0GfoU9bJdwBw3VGwjqG39wppDojafxWJhlBqcsJxYOTBIW+a/pSUMZdNO1RzlTRiEqpirYQ/zoGQYUQTkTBkYM1eJzMxRMIlMHYG4Bo3TY0uySgpglcrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p3DMc8d8Ktk0J9ArSAtSVE3ydjYkGfrzH7yeoaXAVg=;
 b=wSNqd3MzYLT+kIyV22e792rYUA8Hdh/1rxeafy2SYN6pVJNNL5FjlRbR8YopHVmiE4qKNMyDR+6e9o7jhLYHdeb897cRIe0b1pHhfNcIY+4o3q6J6/Wl+kVoc+AKIVmxg8MxPIZ9syT0Jlgc23rN7GItkUndHE9BtGCN/CDI1ZGLofX8SPo288lxa08R+3gRXhU/EySYV1ySEh/P3SsKwf/mEja41om31OhNiA7QXTurqZZjLrmAi7uxM0I7Ng3A4RocbWpnJHhadgDYIbdYHIygRvuL4RQRAYLvQZOQ4pZdDOycWwYyN5tZQZYVdO2kRtGpaBeWuuGFpk8LH/1mvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 17:57:12 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:57:12 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 14 Oct 2025 10:57:11 -0700
To: Greg KH <gregkh@linuxfoundation.org>, <dan.j.williams@intel.com>
CC: Doug Anderson <dianders@chromium.org>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>
Message-ID: <68ee8ef7728ec_2f89910027@dwillia2-mobl4.notmuch>
In-Reply-To: <2025101448-overtake-mortality-99c8@gregkh>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
Subject: Re: Replacing Link trailers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: b688a343-1b00-4e6c-6cbd-08de0b4b1a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDYxZTJsR1pNRWd4WXFscUVrNzAwQnU5NVoyWFhHaXZiaHdTWmlOUkxrL21N?=
 =?utf-8?B?UG5QeGJNTDFCaGxoaTdtKzRjZnFFNHpEMkkwZUtQZE80b0tWYXdSMU5aT3VG?=
 =?utf-8?B?SmVCSHM3WG5BMktGMUFES0NBLytnY05xQnV6QWJUeHR1Z1hsV1lGeHRTTXk4?=
 =?utf-8?B?UUs0RW1jWXFndnBudTROWTBHaGRuQzRRQlAyMjZRS3k1dVVRaXFDY1VkZUhm?=
 =?utf-8?B?ZTNmSk9oT1l6V1hLQUdFb0ZKT2RFUG5vcU9VRWhRVHkzMU8xZEozMzUrSVhz?=
 =?utf-8?B?QjlkNmJEVmlxdzgvY2Q2aGtBeHRROUhhbjBSK2s0VFQwSVNlUmU1UkpGc2hh?=
 =?utf-8?B?QmljTXN0a3pHREdMVFhiQ0lDSll1ZUxKU3NHbGhZT2FDWU41R1NDV3psU0dm?=
 =?utf-8?B?UnZGOGJPb1FmQUtlMmxTNU1HbWNab0VicVpWTDY1YTFOU3o5ZFV2MUNKa2Qw?=
 =?utf-8?B?aStGNTlVOFlsQUdZa2JWKzVwVEFRV2ZJRW4wQTl4Z2kwb01wMVpWdmRhTGNF?=
 =?utf-8?B?YVFMdkZBa2xVZzdyWmhEeTZCaXUxQmp0RFRweDNnMWdrWHpWZUVyVzB3NTRG?=
 =?utf-8?B?bTFYSHJJWVJmUHBnTW51UUFINit5S2tBdVU3MVFkV2hoK2Z6WEpuYjZaTFQ2?=
 =?utf-8?B?VHlnMDNEVy9PK3NZeEUrU1Q1NUJhTHAwY015V21pcTBrSmhPWVNKUW8zdC9K?=
 =?utf-8?B?Vk53Qjlic2x2Q2pVM00xT0EvWlBJUkZocUIxZXNHYTNta3Byb3UySWZEZjBF?=
 =?utf-8?B?MS84UnhUNm8rNjZoTk51YnpaMjAwaXM2UFF3YjVBcU51MHlnMVIvbkI5TklZ?=
 =?utf-8?B?cjBuWVBrZGlPWDV4cXByL09jWEoxcytuQzM1SnQxTHo4MmFLcWpBVWxsR0RQ?=
 =?utf-8?B?R3o2MDlWbEdRMDQzQXRrbWFwOEo4bFc1MjlpSWFtaU1FQ0hFVzIzeXorMEVU?=
 =?utf-8?B?MVBsNWRYaHZ6NlFrL0FSSXF6ZmY3Z1h6MUJsYWJQNlBqUHhtaWJhZWtnanNB?=
 =?utf-8?B?UHlWVGRxeC9IM05raHR5VVZnT0NlQlE0Tml3TGoycjcwektibmR2MjJodHVx?=
 =?utf-8?B?QjJ4Rnd6VVdrRzlMb1hKOTIxV0RXZjhSNUlhZGlHNUpHVzF0M0tFamNnMmZL?=
 =?utf-8?B?NzZUY28yM09MVlRnRGF3Ti8vNS82Umk4ZCtCcmJHNCt4eUZEbUdCY2NHN0pu?=
 =?utf-8?B?Rkl6WHVlS0pJeWQvMVphN0FPdVpMZDJnU2pZZkUxakl1TUFhV2VNMkgyVHVX?=
 =?utf-8?B?Ni9OZDlnM21sd3hGaTBJVzZTcDN2Q0NrbWJJT0NOS3pONjZGUWErUlUyVmcw?=
 =?utf-8?B?Wm9IY05LOUFYY0dsNk5wNDJYUXVrTithcmJZTFpyQUs5R29kalNyczI5Y3dr?=
 =?utf-8?B?eFpKN1pCVmMyUTlBZUlzaVZRVldNem9JbFcwNWdHZEVXbnFoN0xPbmdRZ3g0?=
 =?utf-8?B?UUlieXEwdDlIMmRRZ0YrZXZFclRwRHMyUXJtTnkvbXRwdDY1NFFHdHB5aDlI?=
 =?utf-8?B?V3NkdGtQMldJOW5iSDZnVEtZY0ZRWTNDVzMzQmtzWmtlQ2FhS2VheW8xVFB1?=
 =?utf-8?B?QjZuYVBEK1pmZ3psdm81T3BMdXBxeGltdGtrR3RKMGNKbk82QnUzZS9FZFRw?=
 =?utf-8?B?dWloZFB3bzlSdC9yVzkyTC80QjVKRlNpbWpOUDFBMytycEp2WkhZekl4L0N0?=
 =?utf-8?B?bE1vcnFKNGxUcU5TSzVFMGp3aUQ2NGZsNXY4UFV3MmVoblppWklDdnJkTXhR?=
 =?utf-8?B?K1ZFYTVmS3o0dEdzTTJNa3hsRWI2UjUvdHpLRmQ1TkdIZmlIVEZHRW5YYkF5?=
 =?utf-8?B?cmtGbUpzSjZ2a2xGY0FYeUJDYUVNN21pNzBORFlGS1hERWs4cEZFbUY2dVA1?=
 =?utf-8?B?YThMM0h0ZytQVy9zcXdpeDFnUDNiNFo1SHM5UkpjOUJTYXEvckhoQkd0cHlU?=
 =?utf-8?Q?NQZrf8v1e+D3L+++35k+aiUNKYwjGapw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRINEk1bnNaU2w1YTlFT2g5L2JrWEJSeFBpdXdoK0tUcDdjMXBaZTZrZjJ5?=
 =?utf-8?B?eTdCZmdjRW5LbDB3MkY0RXJIWWp2YXQwb2tGbWNhZzl5L1l4SldUYW9kSzd2?=
 =?utf-8?B?N1QwdU5WdktvakVlVlBrcTJsN2w3eEd2R01nWHM1bElvTHl1WW1qWlpiUFhw?=
 =?utf-8?B?NHZleXBOMmJ1S29leFZyNWlESWFySDNlamRjVk51MmdEd1V1bE51bXVaTHhE?=
 =?utf-8?B?S1RxckQrTmgrMER5WHgyaEEwcnRDUmEwYi93c3c3T2J2SmcvQUdzQzU3d1o1?=
 =?utf-8?B?QkNqRWlIQ1Rtc1ErRUswdjBPY2xxSEZpc3VlRG5qYVJXbjRyeGU4cjBjRlhU?=
 =?utf-8?B?SlB5QW4wUkc5TUtJYnZQYTZZUE4rUlVMWnBVazVrRjJkYVlKK1owL29yR0d3?=
 =?utf-8?B?U2ZHR0w2blVYUGlDWDhybTZidjg5aUtDOHZEekExV1gzVTcvNmRsVEVwOUtF?=
 =?utf-8?B?L0twQ1QxaDErSzhkUEJkcTZ2THNLYTllSks3Z1dIZDVMQmgxeElYK3hPN2pz?=
 =?utf-8?B?R2Fla3pUL2NhUVdTSlpMQXJDQ1FmWXk2eEhOeWVXTXc2OWNRLzBUWTRZSG5L?=
 =?utf-8?B?elBRVzNPVTM0M3dlRXFPcHJaV05MSnE5QmgrUE53UDY1UXB2YWJIVU52a3Nw?=
 =?utf-8?B?aUVyRXhQem01MG04VW54OHhheDNFZVlIeUpuYVhlRTNvTnZvMXhRODlyZEJ0?=
 =?utf-8?B?cERRcXIyd0xNSGlKM2lDNW02TnNrK0hrU3lzdzdMY2lWWkVwcTRUY052bnVw?=
 =?utf-8?B?YWFtdW9IS2xDQzJKdTdVRXBUNW12aWEydmU3V2pqRnM1V2w2UkRMblE0elpB?=
 =?utf-8?B?TVl0b1J4dzY1bkhYUjR4N0w5RzFjbmdPTkRzR1R6bE9SV0hnUTJpVlFUdWlr?=
 =?utf-8?B?Q1ZZTS9GeEtDSjVsVm5wK3NDWm5HcUNHTDlJYnlXZlU1NEdKUDdLSkNUQTFw?=
 =?utf-8?B?MFF0L2dtYzdUZGVqbnIzY2U2U29TOU96cDd6V3ZXR3N5UkUxcDg0aHlLM1J3?=
 =?utf-8?B?U2pXcFRIRjJ4V3lHUlVWVDU0ODgzaDEzSm5nNFdOSmdQQ1NiMGN6Q3U0bkx1?=
 =?utf-8?B?MVlxNWNRMUhqVXhEa2hSWnM5czVvc2JqM1J5ajRsSkRNdzZLeTBuVmkyQmlC?=
 =?utf-8?B?NVR4OXROVVdvNG1VZ3lDc25HQ3dET0tjYVRiSVZPYkYrRkovWW1ocUtVRGl2?=
 =?utf-8?B?blNYRkRIVFN3T01hamcwWWo2bTFjeFhPNXMycEJhcElETHFXWVoxeXJSczVs?=
 =?utf-8?B?Tkk5NEVmczYvU1UvemxUQUg4aFRhNmZkMEI5NjJPK1MwcFVUTEdhK0FUYjA5?=
 =?utf-8?B?REcySEJFRXp0YUZnM0ZSSXc4RjliTnlsUTNLWnVVaUN6NlUrVDE0MWZMdW96?=
 =?utf-8?B?VHhIcVJqQWhubEtYQlVOaG9CRGUxckVmV2FMQ21nSnI4M2xRVkxmdU4wRGI1?=
 =?utf-8?B?RUV1YnR6NkVkRlFuc2FXcTBoOWd1SXlrNUZ3end5MUFaNm9KZVhMZElLeTBS?=
 =?utf-8?B?ZlZ1L1JxWVNCRkk5N05HM09BUTcwU25zODdKMDI2Qk1oaVJXZU03K1pkT2hj?=
 =?utf-8?B?dHA1bjU5ak9GS0NJcm5hc3B1cWlTZ0dvNFR2WmhTdktRVkMvR0hjdVN6U2xJ?=
 =?utf-8?B?c1Qxc0Q2NnJoL2xWM2wwZnkvdFFQcEtNajlyUnFPZ2E3R0FIWEM2UnFITVR5?=
 =?utf-8?B?NmpJZVlJdmZhZDdKbEJtQXZReThNaHhsa3Z0YXFBVmZYUy9xM1FKbGdKZm5T?=
 =?utf-8?B?QkYvczhZWjcwY20ya2pXdTlYUTZQMkJGRzJUenRPOTBrWnZTY2VJaUJINXVL?=
 =?utf-8?B?dkJHWGEwUlJqZmxBM1JzQ3FaQ3FhS3Fjam5JcDFnMkhCVThIbUJqTkU3akl2?=
 =?utf-8?B?UlpHM3p0SXFZVVdRS09ZamhaVlBlcGRWNG82NEZEM2EyU3V0ZldhLzg0WGlT?=
 =?utf-8?B?UVhndjB4ZlNVT3RmcVVtSzdBN0NEQWZsVTNUbTRkQ1YwRG1TY1lMU0FmQU50?=
 =?utf-8?B?VHc2ZFQ1bVRLNFlLcWViTEZIcTFlQThuYlBFZkE4cFBDQkQ0VFUxOThxUFdx?=
 =?utf-8?B?QllWallkVUUzMEQrcWsxNkJlcG9rYTJaVFkvVkRKNjZ4VlRTRHdWblgxZmVQ?=
 =?utf-8?B?R0hZeGJSSitjM0lwSTBWS3FIMTNPM2wrS0x5TXhjMlFlaUxjT0dxNVlNUTEw?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b688a343-1b00-4e6c-6cbd-08de0b4b1a18
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:57:12.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXflMnsrPxEBBYw6d45tAvHQD0FGrJwTZisMfP8r3df+nvgKB1t10JTQI9cCuxF5eynmKkBRxA8JCq9kpyWeiy2zT1mv9GUKbmkAdmHYX3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
X-OriginatorOrg: intel.com

Greg KH wrote:
> On Tue, Oct 14, 2025 at 09:01:32AM -0700, dan.j.williams@intel.com wrote:
> > Doug Anderson wrote:
> > > Hi,
> > >=20
> > > On Mon, Oct 13, 2025 at 4:53=E2=80=AFAM James Bottomley
> > > <James.Bottomley@hansenpartnership.com> wrote:
> > > >
> > > > There has been a lot of discussion on the tooling list about how th=
e
> > > > loss of link trailers has updated both tooling and triaging issues.
> > > > Konstantin has proposed a tool to get around this, but while that's=
 in
> > > > development, I propose a discussion about making Link (or some
> > > > alternative tag) into the pointer that would work for everyone.
> > >=20
> > > A few random ideas to throw out there:
> > >=20
> > > 1. Could we submit a change to the "git" tool to allow something like
> > > the "Link" tag but hide it from the default settings? I'm thinking
> > > something like how "git" only shows the Author/AuthorDate by default
> > > until you say "--format=3Dfuller" and then it also shows you the
> > > Commit/CommitDate. Then we just tell Linus to keep the setting off an=
d
> > > everyone is happy.
> >=20
> > A place to stash metadata that: stays out of mainline, is readily
> > available to the subsystem maintainer and anyone interacting with the
> > submaintainer's tree, git notes.
>=20
> The "problem" with git notes is that for those of us working with the
> "whole tree" at times, we would then have to go and dig across all
> subsystems to try to find where the notes are.  So unless we have one
> big "all the notes merged into one" tree somewhere, it's going to be
> very unwieldy for many of us (i.e. all the distros/stable/release
> people doing triage and bug reports.)

Agree. I still expect 'b4 dig' is needed for that case, and I think
per-subsystem notes can help it along. I.e. part of what it can do is
walk a Link: in a pull / merge request to find the source git tree and
then see if that tree has notes. Otherwise, it can fallback to
attempting patch-id matching, or vice-versa, attempt patch-id first and
fallback to trying to find notes.=

