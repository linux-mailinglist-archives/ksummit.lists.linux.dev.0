Return-Path: <ksummit+bounces-2381-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CFDB55484
	for <lists@lfdr.de>; Fri, 12 Sep 2025 18:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A321F1D67F5E
	for <lists@lfdr.de>; Fri, 12 Sep 2025 16:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0FA314A95;
	Fri, 12 Sep 2025 16:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV0Tlqkk"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E4E30EF64
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 16:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693613; cv=fail; b=nJ8xYWA9MeBXuRT33jbfpBfkbTWoChNDxFmohkzY+a41VABW2OVSHcwX9N49m8KOSu9XeFcXEU3eEyjFnUjJ15y/Ho5Qpa/QnEWZoH/83pweMcyx3WvQMpAjoRAKRk3UApV46HHlVAIGL1wRk4P5p68p0FQjw30WrGs+cbqNYEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693613; c=relaxed/simple;
	bh=P5KNJsbDCF7BMdnhCh1py+EHkH4sL+4EwR1u5wzMhDY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gRyFBaK9MtSr2dGO7K017fq8gx/H0rzdlScw9k1+hXS8DMAvnm1riJQdv2zKeRIhBuhL8x4cPibTjuo/Zac/4eWbX62qu6uRUoFU4BnQq8QJdzwUXVPb7fffZAteKCtrp6xrOKBGIi2JMtuJ5Vsx095SdIbz4GeVlPc+pa/UmP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LV0Tlqkk; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757693612; x=1789229612;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=P5KNJsbDCF7BMdnhCh1py+EHkH4sL+4EwR1u5wzMhDY=;
  b=LV0TlqkkWsUGkSLPFjaPG+34DQSFgBRvN69KS2z7CEi5aGJDKhjip7JU
   yvosLl68dd5Pgh2wlNkhx4yN1pEL6ItyiSWyZ5CpqaH+7hiARdAvjcQgF
   vw8FvakBbqnb7eIEpBaOhpWJkkPHteQwVONfgHWdva0pZcUJWM8D/f2gt
   Dr8wNljHs/OAs1obWpE8xehDAkoTk19/wVNUsOEs73rGp6YLh3BhwFar4
   YICgMXcu/B15yA+FzxNszHc1TUNoShGitNykUP61v/ca7dtskkMTMI/Zu
   mZzs2HLHly0qGqM1KDpY9f2lvp/bexU9HsIR+DjDEScCmlbGTLvFGy/l+
   A==;
X-CSE-ConnectionGUID: cvGTlQINRfSXOGXKGoT4iQ==
X-CSE-MsgGUID: NfdQ+q4nRD6UDyObHYuIgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77652910"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="77652910"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:13:31 -0700
X-CSE-ConnectionGUID: VtDlHiCgR3GAH7F7v8TLuQ==
X-CSE-MsgGUID: J+mQoLeaR9WTkjfy/Mz2Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="204993278"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:13:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 09:13:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 09:13:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 09:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7pOtHG4/zqDJpSKaFNzv1r3uV8mkhzGZqgElSVOwPC+W0UNTtEAbxrZTwARsueQucdF+HD9ctg4gS+rU/EDB5qS5B8mnNCIE3kA2q9MGKckhgJA4VP2J2x1Y+xEc6uDMsXY9S5NDV7oNzQj1Y+7y/gcgDbaig+Ty3S++7HNqmSZvc+m7hqKzlKkLyHqArFgTyB+/EGNZdBo8WQvRzgZieyjoUQA/zo+4QQ+MCZeYV8Oj+tHoBaDNwzAekreAFzFGZsuvlrtVHx0KkYkdu9LfJnzRq4+rgU4Ii2Eu0NeT+wywV7VYJm1jbin51RBLJHiEdsm0kWo4/rxXKFUN9Z1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNAAWiy4aUczxIOTDmETHvcU9GiSUcMv0XkWvrXxFgM=;
 b=w1yJjgMegIxT668MJW/DIAw1PtGVd31vnkCeANZbJro86ZK+mTTdMIzKbjubNMHPyYf+HEFRek3gOfRdqosmFYRXA/nyG6Cc9EsG+21OAqBlIsIUeXLovf2MmwJZYGWSGE1mQepe6uadex+LxrCZeQj0xR2YvwjUAWr+yLo5y4M2B2gOAzgf16+kdo86KnRTCfeD9pTCPcIR2vegUeBKOqtKfEJ0X6XRx6Z4xqjbau0LDhOO0J21mZaLz/UkGyateprb+xDDPsrPHMyLurNv5dfC8wxT+fuUTfPiSaboroBVjcEhmgO6qQ3dAg8m3ZOKoJa/ICWBYyune7GoR9MYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 16:13:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 16:13:26 +0000
Date: Fri, 12 Sep 2025 09:13:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, Konstantin Sinyuk <sinyuk@gmail.com>,
	<gregkh@linuxfoundation.org>, <ksummit@lists.linux.dev>, Konstantin Sinyuk
	<konstantin.sinyuk@intel.com>, Leon Romanovsky <leon@kernel.org>,
	<ogabbay@kernel.org>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
Message-ID: <aMRGo+JctQbEo80I@lstrano-desk.jf.intel.com>
References: <2025091207-blouse-scratch-dde3@gregkh>
 <0f876c7c-566b-476a-b590-d490d41d605c@intel.com>
 <CAPpb9ymTGwMnJaALJOHx4TcMLxA22w_KcY8=Zxzy_Qy7Uk==9g@mail.gmail.com>
 <CACRpkdZZdj1o++Z2tYVuHBkY_Tjypo=gu9srw=f9iL4rDJ4Jbw@mail.gmail.com>
 <aMQlBBu-ieIk1T38@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMQlBBu-ieIk1T38@intel.com>
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 4caf1b31-d834-419b-9239-08ddf2174e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmZZVTJEWXpnOFREUUZyS0lWN3ZGRHYyK3poV2VGeXIycHVLRW83NFpWd1Vn?=
 =?utf-8?B?N3ZOVmtFOWV0QU5sMmwrbmVlaVNuQTJKTitsL1pGUkpCaE5FNnQyRnVYeDJy?=
 =?utf-8?B?dWdydG9hakYrczNhbGlMaEM5WEZtM2UxSW9lOGVCRWlHZkwrS3Z1YmpWSUtm?=
 =?utf-8?B?cHVSbU9PMmROL1pod2JhSnpDbTltOFJxbjdORXBPeVpSSlNWWjhMQ1Q4Y3U5?=
 =?utf-8?B?MGV5S2hPdmxQOWVnMWpLSlh2U2tld0dhREJOYVVoajR0aEtWZFg3ckNqZndT?=
 =?utf-8?B?TG4rQ2ZFdWl2RnQ0cEtFRmhVT3JGMC9YZlRjQ2tibVAvN0VPbVVONG9YQW5S?=
 =?utf-8?B?cFZxUEZBU2tNUncyNEVtR1k1MEp3OVFRVkVIY2ZwWldZTytOeVJsOFByVXRY?=
 =?utf-8?B?cmZoV1pQQVZ2b0Vwdlc1c0hNYnBPNXZ5c0FDdGQ1OStCUC9vdVdkamNmZFBm?=
 =?utf-8?B?YmhLUXFrUnppWVZKTUtHZy9KTHBXamM5L1BiK2pHTE1aV2hXM1E0a0k1OHZy?=
 =?utf-8?B?QWhpWGRhRGRSVXZGdUhrL2J6VUUrYzd2V2FpRUVXdmVPYmdGS2U0NlNaMjRE?=
 =?utf-8?B?TllKQ043Q0NUcHFZeVdjRXpKM29lL3hid1prQUFUYXpPN2Yvd1lhejVpWWVH?=
 =?utf-8?B?VWl2MGRqVkUrR2JaQWZmSnZEOTROTmRhVDgyWTg4ZUlObmhQdlJiaGlEdTFy?=
 =?utf-8?B?ME5wMHpNT1IxN3pJTGJNTjI0VjdMVGNuaFNiT21mZG1nbXViQ094VE9Kb2dj?=
 =?utf-8?B?RXNaZTJIUWQ5WHg1aGswTzJaZ2lnOTJQb0doVDJwWTJ6RVg5VHBWOXQyQytm?=
 =?utf-8?B?bnBTZGRTb0RNeWpIUngydm91YUZ3bisyZTB3cnV4QThCYXJ6ZmtnaGpBZ1BW?=
 =?utf-8?B?aC9jZ3AvcW56Q2t5Y0tKaDBhVGJ3WElOc1FyOTgxNVhaUFpVOWZpNE9nbEdS?=
 =?utf-8?B?S05YTkxsdmxZVXFCTjNGbzJwc1gyOVVRTEpycFBNa1YxWGVtUHVwQXcvS3gx?=
 =?utf-8?B?eDI4S1hwNU9ySzF6amt1STlwRzFZdWo5d2NVZVV6cUppYTUrenI5dGZDREU1?=
 =?utf-8?B?QkVMZHY3Q0RvVWJCNm5OTzMvdGNNQ3MxQStVNU5RTkEwQ2ZrNW4zbUFHbWlG?=
 =?utf-8?B?anh1cVdmMHM1aWZianBkWGwvbHBtOW42TnJpd0hSVEVuUkJpeFVtc2FUSTJY?=
 =?utf-8?B?dlJxVUduTHkxYnVSVC90eU9vTUg3OWFKbzUxQ0g1T09FUTNDYURTMHpxWEdQ?=
 =?utf-8?B?bEg4endBbCtIdTR0ajhxUGdUWXFHdEo0STZUaC9pQnIwTVl0ZGh4SXNUanBj?=
 =?utf-8?B?VHhWMTMxRVJ4NUxJaE1mbnBRTm54aGlGY2dlbHJVTVhPYzZRbEFmOGZCa0U2?=
 =?utf-8?B?ekRFY0Qwd3NRdnF0aXBBS2t3SWZyb0hoV05wMnc1SlBaZVRPVGpOOERjQ2pJ?=
 =?utf-8?B?eThsbm53emhLWUdibEc1c0NZYnZvRmJrZEludHVPSjVuY3RvVENqaUR4WkZt?=
 =?utf-8?B?eE96UytnSVNCbHJBMGdjeDZvczh1SnRoalJJVTBIcUQ5NkN2Z0hJK3hjWE9l?=
 =?utf-8?B?NERMbTdFTyszeVZRSEhlMHArK0R4YkRnU3I5REt1QWdPOHl1Y0VSOHM0ZTgy?=
 =?utf-8?B?OHVPZ0hObWt5UTM2enFVcXV2cWplbWQrcDNYWUpyOWp6TFFmOE1uTjNrdGpU?=
 =?utf-8?B?MTdFc2NsTEpjcDd3MDg2VVBMRnF4bkcwTEF2bnJqamxyY2JpL1BoaDUwdXRz?=
 =?utf-8?B?NlBQMXNMcUxpKzFFbFVMV014UjNOT2thNW9kY2plNVBaRVFieXlZOVdyY3JR?=
 =?utf-8?B?OUQ3ckxaRzUyNE1tdUtERDlXZ0lOR0c3RVpvdS9YUzROeTVicGxGVDdhWnN5?=
 =?utf-8?B?bjQrZWs4T2tGNVp4bFQxNTNmbEpZcDlpQ0F5bzgwVHNBaVJYa2w2a1BCZWcz?=
 =?utf-8?Q?jeKqtQGYlmY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHlhdnhDM3VZZi9ZOUdJam9XWXFWcHpBaHVRdVNzcmdvVlI4QWhLdWZVanF2?=
 =?utf-8?B?cGhxWmJTSzNDZUU5MUVZWS9TaVVvMEtJMlc0K2w0dndjRHV4cWZUUHpxZEhh?=
 =?utf-8?B?RlJFRElQc3pnZ2NqS2xrNmhxYjE3eTQwaTl4MnFERkFMVHdzMkdaWHNLalVn?=
 =?utf-8?B?YVZUeFJ0cXJ4U1RnVWMyOE41aE5rc3E1NUlqZjdlUG5TQWNtcTA5a09vREhz?=
 =?utf-8?B?ZHhHVW1rTldFdzIwRGpCSUkrQ1IrMURrQXgyb1BrZkY2Y3ZYZTU2RFZWdDdt?=
 =?utf-8?B?S0JuQUxLT05YQUwzZmJkd2VRMEVvc2paRFBIU0VpMWlTWTloRVJFSSt6bWpL?=
 =?utf-8?B?UGdmcWJOQ1gydVFUZmI2WENOTndZaFBsaGg4b2lBblpJVERFRDlxeDBBZmJx?=
 =?utf-8?B?Vjg5cHgrMFNUREFFV1JaVmRHOFJGNFZ1OThHaTFZSS9ZYUdTYnJPbEM4bzQ3?=
 =?utf-8?B?a25ibE4zYnV3MmlzSTVwZTREMENJdTlPclVwWk16UEowaFdERVhWTm1sRVJu?=
 =?utf-8?B?YTRyck04WkNoVGxSdGtybFQzNTdna0pkbzNuek9mTDBVbkZqd0RVOTBhRzhT?=
 =?utf-8?B?WW8wditqaHp3S05jWWtGeERobEszT3RWNktOZ2FVQmhqTGx6ZlhEZHJFQ1Vv?=
 =?utf-8?B?ME9oMFh0YXAxSEl2MEZ1Vm91MDR6UXJ3SEpqZ1VUZzBCbGFHaGZwOVFQVlBj?=
 =?utf-8?B?S1RnUW95dFZ3cEViTThlQjdLVUk0OERJeld6dDZ3Sk54NUprVXEzWWtraTF1?=
 =?utf-8?B?QWlNem83K2lLWXdNQlVCY0paUVh5Y0JYWUo2aU1aU2NyNW5IVEFoajBQMEZw?=
 =?utf-8?B?eUM1THZ0NWxad2QwbFVnNHp4YXVBbWxEQ3haVWNGRmU4NTVuSi9Ub3ZJNnh3?=
 =?utf-8?B?TkN0eFJMN0lKNlVNNklIdUFwYUtoUWtzNVYzK1orcTk3UnpkdzN5anNYTExS?=
 =?utf-8?B?MmRNZ1ZJM0ZlQ0RodXM3M0Zaa3RNMkdab2Z0NTZmMzB5ZFJWeGdlMVhyS1Qx?=
 =?utf-8?B?VzVUaHFmMEFWMW9HTkN6SlhNTXZ2NnJkbGhCb0IwempYK1BibjlpNUxxL1lv?=
 =?utf-8?B?SUo3cVRQMEhzSHdQZkVRUGVUZFhOY0dpcit0WEVjNjkzMkxKYWhSN0pQZnBa?=
 =?utf-8?B?OGR2Q0MrdlVEaS9MQ2hHTzFYeUt6VDEyeGxwdDJ5ZjVOZzJ5dk0vVUxXTCtm?=
 =?utf-8?B?N2VLRjFpK3pyWTlwdEIwM1ZGelRtcDdOOXRzM0pXWlRqRzRzRUNRcmIzVUJL?=
 =?utf-8?B?Z2l1bUdyU3MycVlNRVdnQ04vV2EveFFkQksvdGxrOVlQYzQwVFFPMGdUb0kz?=
 =?utf-8?B?M1d3bktkdXVVNmlaOFdNTXpvWjNzMkNoNjIwSmw4dzJUYW1WWS93UjQ1ZnB4?=
 =?utf-8?B?clM5Q3NiVHdrQkwvbmFzL0xuTTNQd2xxQlljc3J1aVIvMjI4YjhKc0dPTDAz?=
 =?utf-8?B?MUc2VVlkMkI1M0dpOW5hcUFLbndMMDRQMXorWENNa2l2ZndlYytFTWVhMHVt?=
 =?utf-8?B?R1lITWw0N2R2enlSdUxZcktaZSthWXhGS2U4MXZRaTZTR0NUQzRocEJwMVZB?=
 =?utf-8?B?Y3ZvOHBiclpQazVjWGdhY0R0RHJ0MG40ZVFJWGxFbVdCbklSTXFqT3JTSjMy?=
 =?utf-8?B?MmhVaEdHMFFLNmx6eFgydFNvSWVpRWVVNHpGVmlndEY2UnRQQWpyS1VheVN2?=
 =?utf-8?B?ZURTM3NzM2NxU2JWN0JVR3drVlUrMWxKK0w0aiszKzQxMWJNTTlxb0VWSHZY?=
 =?utf-8?B?TTg1WnhWU3czYitpclI4eFhmdisxU21TZHAyL1orQW5xeXYrSnFsTzIxQW9Z?=
 =?utf-8?B?UjZNSU95R0hvY2c0UmsxOUtCK2w2MjdXemdRYmkxZ3p6VStmV0x5cUU0NVY2?=
 =?utf-8?B?dWN2R1VtRG1OOFlWb21ENVVXeE84d05ZMnJLSERYRDBQUkY3NkNuRW02UU5F?=
 =?utf-8?B?UERwYy9wbnZTUm5pN0RJUTRUb1dPZU1wY3U1RllNcmNINXdvM0Vyak0zb2lo?=
 =?utf-8?B?RnJQWU5GZmJkTUVGZjU3TFI0dGV4Z3RsU0Z0dDZ3Y3JjMFJFaEhWK3phQ2Z5?=
 =?utf-8?B?SmZFMkNtNFdFNXdMcHZwTVJOeEN4VW1HQnh1YmdUUDBiNDBxejFWdlRySVlC?=
 =?utf-8?B?cmt4SFVENi9mTmxSWkEyZ25UaE9NMG0vcHluZVovN2VzNXpFM0Z3OEYvSDNC?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caf1b31-d834-419b-9239-08ddf2174e1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 16:13:26.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dw3IPiHfPKN5B0gEZIW3xIb8/mjvO4nSChGi+SEXzldf5IHvnLAf+6DVELer7RO4hOcyiuzSnXrmMe8/0Fngyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
X-OriginatorOrg: intel.com

On Fri, Sep 12, 2025 at 09:49:56AM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 12, 2025 at 02:18:40PM +0200, Linus Walleij wrote:
> > On Fri, Sep 12, 2025 at 2:07 PM Konstantin Sinyuk <sinyuk@gmail.com> wrote:
> > 
> > > Longer term, as UAL adoption grows and multiple vendors hook into the
> > > framework, the natural home would be a dedicated drivers/ual/, just as
> > > CXL evolved into its own subsystem.
> > 
> > If you already know there will be other things than accelerators there,
> > so it's more like, i don't know, PCI or greybus, then put it into its own
> > subsystem in drivers/ualink from day one, I think drivers/ual is a bit
> > terse, the world is full och TLA:s already, also that is its actual name
> > isn't it? Hard to miss if someone is looking for it.
> > 
> > Your merges can still go through some submaintainer like Greg, or
> > DRM, if they need some shepherding to start out. After all that's how
> > drivers/accel is managed, through DRM.
> 
> I agree it should be drivers/ualink from day 1.
> 
> I like the idea of the flow through drm.
> 

+1 to both. I like the idea of creating a mini subsystem for ualink,
going through DRM. With that, let's include dri-devel on all future
ualink discussions.

Matt

> > 
> > Just my €0.01.
> > 
> > Yours,
> > Linus Walleij
> > 

