Return-Path: <ksummit+bounces-2424-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBF3B93D36
	for <lists@lfdr.de>; Tue, 23 Sep 2025 03:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5C8816C8F7
	for <lists@lfdr.de>; Tue, 23 Sep 2025 01:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26A61EB9FA;
	Tue, 23 Sep 2025 01:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5DR6PrF"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ADF1E9B0B
	for <ksummit@lists.linux.dev>; Tue, 23 Sep 2025 01:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758590495; cv=fail; b=n7g4yu4OgObpUkVlML6mil4ryBMrhmSfwzs7ivdoOorO8AAvAm3gZHIDzFKTmYLEFxKLjoT4jni+a9hZhh3Pm2W3Ig6oiWZEOxCkTT0GRHpF1ccUwji24LOBcvsTqtgPzhNeP6+DfQ0PjS6StaL1g1LbHBnkogWhiE3gcknd7q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758590495; c=relaxed/simple;
	bh=YGdeEI1uTW5PFBBv2YHYvdr6rIok6hdDkt6Y1VyjnQk=;
	h=From:Date:To:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=pzvBtVBgikBRt3OoK7jzPXC1b2fXhQFmMHXZcmOVBKfQHfg4ixk/K9G9LNMU7U83XF/ZagtA7+kR6sXFCb74n4REB/JGtgM637JTQVDmtMh3uPjxTu493Ertijs/3yPYSWoQAsXSH75KFSf5y2LgKinUIZvZzZgfwzzQwns7PHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5DR6PrF; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758590493; x=1790126493;
  h=from:date:to:message-id:in-reply-to:references:subject:
   content-transfer-encoding:mime-version;
  bh=YGdeEI1uTW5PFBBv2YHYvdr6rIok6hdDkt6Y1VyjnQk=;
  b=F5DR6PrFqyqpnYY6ViaMgccspBIuCixXbTep+K2KBt+jvCi6k12ZgG2o
   skAKk5tadAUSU724QLVFNNYVP5jEhZqFn63KvU8JZAvmyhdshzmphwmtd
   eMUn+yAgssKDc1SLLp91BUP4ESssE99XTvCVIx2RqLoXF0of/oRNGYwAw
   C43VTS5x3D6Z3mA+U+vnXKIY0n7KwwKAldV3K4RJHHtgs3Mgdcg9CItK4
   WJTVpe6d/q1b2W9C0qzWPitlWLhu3HYvUCH1M4CEMPRcHxlae1QOVYEEJ
   +pomGzgsvNjJ5umXPJ05jze6oOHbJ2PuiPFA9KSFqVuvtSlvjebTKyy1M
   A==;
X-CSE-ConnectionGUID: 3QzHtr8dRmWdTFdEStT/gA==
X-CSE-MsgGUID: AquQ9L5uTUGmKJGgxLKoYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="48434643"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="48434643"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:21:32 -0700
X-CSE-ConnectionGUID: Zur1f2a5Q4+CQmNd6WPbnQ==
X-CSE-MsgGUID: w8bmeUU3TVCw+wX6PewUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176227195"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:21:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 18:21:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 18:21:31 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 18:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN3Bd15c22EADG+zoc7SghHQ7b0gJsQjV9MdkNXlb9WuZCTVFik/pMh44NkL7pRSm7dSeRHehej1TPbbSJ8Ds9JB9y8NVTar2EYBuFfR6ow86bth7zKLv+x81bZQqXbqPNsw/b+g4HDesAb0ff/dEoiXvHrTwh4JtbDIlyVMJjqWBmpMPKwmSQ5Hx7NmjFzAiS7cKabkNBhUcdk/HDvdzHAjV17+17vgJrVZW4s6oVC8gYfc9sDwK64g5wtuOVbx5haT+2KOMXz3kUM06f1hguwHr8msdxhRTTQLjN2t9NlLB3hkVl4/9UBMaSUQIzKuaENbLqM75crqfl9kqvShMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2S6qXVxptbsatlUtDAQ/O7ZbyTOuGoAEjKXbwPq9Mlw=;
 b=NJQ48R/lK5znvtVZWRAa6+SH86xAHMgYxxV/HzHLDmSwxqwwOliJYGpfOCRx4WlKd8Flv7a1RwCAQgd2ofTDr7W52Dl1MTgrHdDr9g/53kNt5GMHLPczFHpcqt0L+h48BKlA5+fGkGlWJX2h5eBIRloKi7e7ef4TddhSsrFMzYhLQc6qOPOMrEsZ0o90xe5R27mo8++Ppk7NXFUjBiQUDqLC/MJWZImZmHIIhp2BOBfsI6kT04sodEIN4JwSEjMPHa6uitqIhudOTfdDtGF8WEBweqhjsr0F3Y9y+tPa81JjIDg4xsrLH/amhCwLd/26cmOMl75jju6ey2glV+G1Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Tue, 23 Sep 2025 01:21:29 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 01:21:28 +0000
From: <dan.j.williams@intel.com>
Date: Mon, 22 Sep 2025 18:21:27 -0700
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	<ksummit@lists.linux.dev>
Message-ID: <68d1f6173b299_1c79100e6@dwillia2-mobl4.notmuch>
In-Reply-To: <572009db624de21099e08f28604f4b8e6a472cf2.camel@HansenPartnership.com>
References: <572009db624de21099e08f28604f4b8e6a472cf2.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] resources for promoting healthy communities
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7b1716-13d0-4253-1cf4-08ddfa3f857d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnBKTCtFbFkvM0UvaitTRytoL3BLbGZYOStOQ0FQVm5uSDVZT1JNSE1hZTBo?=
 =?utf-8?B?NVBsUnNXRG5zelJjZUtsT3FYd3hiRW52QWh4ZGdMR3lGZ2VnRVJJd0d4ZUhL?=
 =?utf-8?B?K0dudEMwem0vWlVHZ2hrRWNHb3lKK1ZSemZsMTlZYWx4dVZYMlplMzRMa2Ew?=
 =?utf-8?B?VGlveFJTVG42b1lOVUZrTG93MEtYbTJRenFmQWFtUms2dkM4K000bndCRS9O?=
 =?utf-8?B?aHI5a2h3cERKOEVpcFIwRXFqVS9tMmNVR0lMRW0weWVUQTRXcXloUEMyWmZJ?=
 =?utf-8?B?ZkhhYzNGb3ZXNExESjk3Qk9pamsyNi9La1REdlowK3hqZ3RMZXVZdHFNb1Jz?=
 =?utf-8?B?dTN2TFJZbXdRdmova0VmYitRa3RYYVBGb0hoZlNRTDA3YlRWY0hJQ3hmTzJD?=
 =?utf-8?B?WWIxc2l6RW4rZEIrdi9ubnMvMll3aXVscnkyZ3EvZktlVE1iK2Rad1NSY0pC?=
 =?utf-8?B?Qjc2VWpPV0E4YUNJb0ZMVkJmRFlGa3NYOVpCc0RZTEhjOUVoZ0ZRQ2hyR2ho?=
 =?utf-8?B?VlpjRU8vSGJZbGxVQjFyT0o1L3hGbmYwdFVjcm1rMjJJM0lYRFdWZGlqUHlk?=
 =?utf-8?B?d05BUUNLSVVwOXV2LzVNN1hNLytMVmxBdkpsUmpRZVJRKzlFOUVJdHlpbE1t?=
 =?utf-8?B?QzYrSTViNGFDazVrL2Y4UlcvSjRhcjdjRXRtNG1Jb1FsRnR6QnB4ZFZUQjNT?=
 =?utf-8?B?bG5sRldvRmdadTZ2K1p2cnFIdkE1WVBsNGRCQVNsV0Q1T3BKSlhIMDNKTWN5?=
 =?utf-8?B?c0dReEh1TWNKNnNkTVdaV01LNzBNM01WTUcwcjYzdFRRbEhwZTJPckN0SlV0?=
 =?utf-8?B?RFEvdk1ZeFo4aG5yTDhuSkljaG5nOFZVQmtOZVNuQU1OUHg2cGhSaHRHSDds?=
 =?utf-8?B?aGtyNzIyZjhFeGVmNnpPckFCaUpLTExyUEFpNDlsNkk3NG5vYzYvdmZJNmdi?=
 =?utf-8?B?bmk3bEFzUWNDbVNOVXEzaENBdC9kWUUxcmVWZk9GdWFENGQ0dFlrKzRqakZG?=
 =?utf-8?B?WXBHUlMxOFdpWlFxWHVycFlnRTZweHZPbFVMM3o2YmRuQWYxLzV0bkl2Vksx?=
 =?utf-8?B?b1JLaFVNUmE3bUNFVWdCc3p0c0RaTFVwTTZJY0ZnWVQxSm5jeDdKTElrVXlC?=
 =?utf-8?B?ejA0MER4QUZhWlJiTmVLaDljdU5BZCtXRENQR2FTaGZ4TkdOWXVNSjhYV3RN?=
 =?utf-8?B?Vm0xajRrcWlqZUJJT2puRzVJNVMwQVcvMDJ6VkR5NVAvOWdLcHlKYzc1UjY5?=
 =?utf-8?B?dzRoUG9ab0dNK20ya040RXFnbEkzTmw1UXM5cUlsY1Fic2YvT09ubVhiVW5j?=
 =?utf-8?B?c3doMm5FZEV5bFB4WUozZHNZZC9YZWM2NWlUU3FxNmhlZm9rZW5YUVliYU01?=
 =?utf-8?B?NEtJSmpPTEhzR1ZBYmxqbk1vZ3RucWZEd09zamdjWnNLRWxxRFZZRi9LVTNi?=
 =?utf-8?B?SFFPMjcvMklRczViVlJraXp0U1JjV3ZJQkdRWkMyQXNLeXlXcU03ZW4vcnR0?=
 =?utf-8?B?WTNBWTR4YXlFNTNuNWpBcVJmT1RKMmdQeUJNbHA4M1FZc1F3Wnkva245STdn?=
 =?utf-8?B?eG5ZSlNqU1VGNVBVR21qUFgrV2lDSEE5NElSSWgwczR4MzlLdk5ualhlSS9r?=
 =?utf-8?B?VWJ2UVJtU0NWUE92eGl2aHd0TktJQXZFWGhQV0tDczZWTU9GNS96TWxtT1Mr?=
 =?utf-8?B?UVp6RExKeTUweEtJUHY4MmZvODlDcjR5bzhxanBTRElsYWtWTHRya0lab1VK?=
 =?utf-8?B?VERoWjMydkRXUFBpZXlpRzZRbVF1WjU1K3FNNWxpeXZKeWswTWFmZTFNT3Az?=
 =?utf-8?B?Y094TnQrRERmNGh6d1BMUGxPNmVWY2lJZFh4RFdYRzZlQXBMUUNEb2V2ZUJ3?=
 =?utf-8?Q?xacwUa41bdUea?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0tKWkI2UmptODJIWlIrc01vWVBZaWw2Ukp6N2NnZFpVbjBzUVNPM3UvUk4y?=
 =?utf-8?B?OHJEK0ZmSi9PL0NUeTMxbi9Uc3JxWFl5WkdVWlZTTkxtVjducDY3RGwxYWRo?=
 =?utf-8?B?RDRieUsrZ2wxb2l3ek1aSWQzc2w2S2ZwQ1RXNXVnT2xzUHZFR0xybFdhR2Fk?=
 =?utf-8?B?SzQ4YklZVS9FVEc0V2VrbXgwWnRRUFFvb1BxbW1HSWVnQU1rMS9NdXJFTGlE?=
 =?utf-8?B?dCtEcXBkd3NWR2ZDTndqS1dkVTRKTzJvRVVIQ0N1UlMyaU5EZ3FSdFdTTVdS?=
 =?utf-8?B?RU5WanB3dFBJc2d1U3ZBdGNnbThMTUZjbVBUNEVhQnpobmJuRFVCQS9OS0g2?=
 =?utf-8?B?T3UyK1RDUmIyaWk4cWUrUE4rVmFkeGx4Ylh6N25Dc2h2VjNsMWhWSGVDMERm?=
 =?utf-8?B?MEJnSnBuanp0U1czUGRORXprc24yZzg1VnFhaU1yWU9BYi8vemE0cmlRRk5V?=
 =?utf-8?B?QmxSUFpsZHI0NGovUVFkekFlUzhtYTRqTmRaRHJ3RG1DdE40eW9NRFAyWHZh?=
 =?utf-8?B?Tnl5SkNUd2xBb2c5MjJ6RzZub04wSHdaMHpDM2hrUEREZ0x1UWlpaXF5REdn?=
 =?utf-8?B?bWZERWFlWkpLWDNnNFdmYjl1cWViZzBSVXg2UWk3OGliZ0d2N2xWYTJxNXp6?=
 =?utf-8?B?VGFFN01hTDFvdDlPdmdiaks1NjNkakhoR2Y4VWV2TEQ2TlhDcDFvdE9BeXV5?=
 =?utf-8?B?bXBwcnlBRUxTZVc1WXVwRElybkJWOHJGWXNjUjh1SStOV25zWEZwSWlwOW93?=
 =?utf-8?B?UE5TbmkwRG5pYWdDUUNtVi9XK1p4Mk1nOGVqZVJiTm9iWExUcW1QeWtrYkxz?=
 =?utf-8?B?R01Fc3Btc3FGOE8zS1lJMU9WWHpEeEFtSnFPVGJkREFacmdWbzdNc2pTNW1j?=
 =?utf-8?B?WTJVbDdBMVdxdkJqaWxqNStJaDNHRVBKRlVscDREelZZNE5Db2ZoN28vZnFV?=
 =?utf-8?B?aUUwaXczM0lGTVY3L1dQdytEWlA1UlVyU1A5Y2tRQnR6ZnpIOUhGWUZUNFFs?=
 =?utf-8?B?dm43TmxZTys5aTVLMi85TmxwNmlJelNZQW1vWitzeTNNMzMrMnR0RExHY3Ro?=
 =?utf-8?B?c3dweHEvWWRha2svNStJSmtWeE9uNkw1QnBqRjFpTy9mZk1HeXFOUnJEcHhB?=
 =?utf-8?B?NHNpR213SGkrcTVqWUZXMXNYa3ZqL1RTSjJhUFZKdGRwZFc0dUM4dkc0SFRP?=
 =?utf-8?B?ZVI2K2t0THFYdjBQMnpReFZFa3c3SEJFN0FrR29FMUtFNnNJbFdqdURlUjRl?=
 =?utf-8?B?azJWOWJzRGtlVVppWGVzRW9HMGhMUStrUkxQQUpSWUkzYXZvYTkzZHpvN01U?=
 =?utf-8?B?TjFST3d5aURxaHVUa0V1cy9OWUxDeXEzUWJaV3Y5UGZ2UHFiOFc5Z0RiV1VB?=
 =?utf-8?B?U0xzcVNtSnRHV3l4dGt1M2RxR1k3UzNmbEtrNkk4WUVnUEFxNi82S1M3Ym02?=
 =?utf-8?B?L09BMGNSQVo5SXJkTG42TkxnWTNpcGNrNFI2ZXI3aE5iMFk3QjA3OTgwaVc1?=
 =?utf-8?B?RnZXSnBGK0lRZFdqRUZRV3czY2JDYnVmSzF2UnJxK2JKNHFtMHNWQ1YwZ2dp?=
 =?utf-8?B?aFRuTjVtWnNDZGY0a0ZocWVSWW00aEI4Mmt2TnEwQUxNSU5zNEluSVFVWFJx?=
 =?utf-8?B?TTg3d1FhbGVaY2RZbTVZMVpma1R3dFdHbjg5OEowM3UvQ09oNVdsNjBZV0ZP?=
 =?utf-8?B?cnQ2bzJHMjU5NnJ6UTZoWWtkWUZ0UVd4bXBHb2M5c0JFbEI0UmpOVGVWbDJi?=
 =?utf-8?B?cVMyekJzdkJ3TUs2bnZPVDhuaGU2bVR4OUc0UTdacmJZTXlFVUo5dWNwWWtn?=
 =?utf-8?B?V2RDekprR3hqdTd0d2tocER6SWh2c1AxVzI1V21pSzR3cE9Rb2tzQ0VuUEhy?=
 =?utf-8?B?OHJuQ2lCem5PTWpSTzNldVVHeEppRGJoMkJMRjNQWnBwd2FJZTNjV2FYS2Ni?=
 =?utf-8?B?R0FNMkY2QitLdlJiRVBVK1o0RmlIYU5PbjVMbnNpTmowQmZkVHdncW9ZbTBW?=
 =?utf-8?B?SW5sNG41eEc4Vi9HVFF1TVRDdWlHNlVWcDNGMmEzSmFiUm9UUnhUSzZHRHRG?=
 =?utf-8?B?RWNnTEVXMU9BYWRhcmwzcld1T2gxZkxOUk9pa1pLc3VmRHpiK1BuQTdZNm54?=
 =?utf-8?B?ZjFZcFlkR0c4cmd5RXljR1EwWlVJVVBHby9pSzZobzgvU1c0ZkJYWWZoa0l5?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7b1716-13d0-4253-1cf4-08ddfa3f857d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 01:21:28.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scVDeJOy42y2/CqbkQVgnr47AqwtuneyOI5wrdcs958wsNhFvm9XIY8rZUcFuVxqn3V9W6zCaSWGfbg2/GSgOFaPfeRhx1OlM9IYcqdhsNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
X-OriginatorOrg: intel.com

James Bottomley wrote:
> We talk a lot about community health and maintainer burn out but what
> struck me watching Hans' talk about this:
> 
> https://www.youtube.com/watch?v=O8Q8nIzEG6c
> 
> was that he relied on his employer to help him thorough his burnout
> problems.  While this reflects very creditably on Red Hat it struck me
> that quite a few of us probably have employers who would be less
> sympathetic to the idea that issues caused by being an open source
> maintainer should become their problem, especially if they were
> spilling over into internal job functions.  So I went looking for
> community resources that could be called on and found, rather
> distressingly given the amount that people talk about this, that there
> are none.  The best I can find was the session that happened in the
> Kernel Summit track:
> 
> https://lpc.events/event/17/contributions/1574/
> 
> But that was a one-off rather than a resource that anyone can call on
> at any time.

That was indeed a useful session, thanks to Shuah for organizing. I took
advantage of the offer for a follow-up session with Dr. Chance.

> So the topic I'd like to raise is what should we as a
> community actually be providing to help people through burn out and
> other community health issues?  We could just continue on as we are now
> which is pretty much nothing official but various community members
> will be happy to help (although good luck finding them listed
> anywhere).

Speaking for myself, it is not clear that a list makes the problem
better. If the number of community members willing to help is larger
than the number of folks willing to be explicitly listed, does that
injure scaling?

That said, if you are having a hard time, do reach out to peers, do not
wait for a list.

> We could make the self help support more official by providing a
> mailing list and possibly a wiki of volunteers specifically for the
> purpose.

Steven has talked about this, and I am supportive.

Additionally, one of the developments since that Plumbers session that I
believe helps with burnout and conflict is more offlist collaboration.
For example, subsystem specific conference calls, subsystem chat
channels, and if you are lucky enough to live near a critical mass of
developers, occasional gatherings for drinks and catching up, helps
relieve pressure and build community.

> Or, we could even decide that this is a serious enough problem to ask
> the LF if it would be amenable to providing us with some resources to
> help, thinks like organizing regular sessions like the plumbers one
> above and perhaps offering 1:1 video counseling and other resources.

I do think aspects of this topic are in scope for Shuah's Mentorship
Series, for more opportunities to share what works and what does not
work in navigating a Linux career.

https://events.linuxfoundation.org/lf-live-mentorship-series/

There are also training and development resources that many folks have
access to through $employer.

I do wonder what the uptake was on the sponsored sessions with Dr.
Chance to inform if this is a resource Linux community needs access to
on a regular basis. Is this problem is getting worse, better, or staying
the same over time?

