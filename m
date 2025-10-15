Return-Path: <ksummit+bounces-2533-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1AFBE0541
	for <lists@lfdr.de>; Wed, 15 Oct 2025 21:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DCCB4EA3FC
	for <lists@lfdr.de>; Wed, 15 Oct 2025 19:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8130D3019B2;
	Wed, 15 Oct 2025 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nt6+mMpf"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD1325480
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555608; cv=fail; b=SmypuqKs33EfDZIc5iWX1hyfNxFAvUbFp1HAfZ/XP/w2BRuP08PtoZwZVs5Sgck1xU63RBNgp+DLFqZJ+F1fRZ/Q1/KGH8BScOS4u4QNQw14jSrTpwJs9F8CraGjwSMY2rf7rtbBS3MRMS/HacMS6McZxTbmNI/zYIWecqCfXFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555608; c=relaxed/simple;
	bh=Irz0aAqB6KQWLAixXedy7e/ZU85LC2XnejKHcwnUEaw=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=P+3wzSyfU1bsHWe4SqDZ2wbaL1Z5sOAiX2hPky93XwsYo9/s0vjlOro5R+//J93U+yVdROJa6tafLR8QKDu0yJtNmnOH+XfZkVwND7xPI0Hy5iIyBxy65pTRkynGaxmAw1FdLGZbJp6Ds3lx/PJSIJAL4YTJQO5nSaU4FRYY/1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nt6+mMpf; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760555607; x=1792091607;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=Irz0aAqB6KQWLAixXedy7e/ZU85LC2XnejKHcwnUEaw=;
  b=nt6+mMpfzp3VEUTLAoQ4FfNAif3is3Ckkxg+cjK3cTn3T9aJQX4QeNsd
   ivDGU5vPbfkws/SZTW+ZWNZFZvwmMSkOL/KeFdXXHLmh2V9LvYkCA5bQX
   d6P5s89wjvZkiKPTW/lLy8j8nXNRVdEbZIqFH1TqTHvZZ4O6MJnY3QZAS
   oACnppkGIhHQMQQLCoMswydMxKGs16p6EC+yy+nzzNmdX/vjZPWhtHHnQ
   DCQhBN8ERSka6LfFv0QpJZqBoR/2zShuwPApNLH7gT3ScY1IodztKFUpq
   taWtSDe67LF7FAMgWLrRNqT9iz2hBUupjpE/b8stkcckmNVkwca78RNk1
   g==;
X-CSE-ConnectionGUID: 9MEvsibtStuOkGJOy0VCFw==
X-CSE-MsgGUID: e2VsnNrbQPqirvJMEenkTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62650967"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62650967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 12:13:27 -0700
X-CSE-ConnectionGUID: FBvdTUZwTNmoTIAG5jEiUQ==
X-CSE-MsgGUID: B32mbCmrTIGh/kp5jqUbfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="181806108"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 12:13:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 12:13:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 12:13:25 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 12:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQCujBjgwELS0/Guk1KtVc1AN+AQfV30pU2CEb+8DtaWR83DyGHxEk41LrpzumS3yalZf71MQUzhH0I86KDARNz98ZffeWNy11PD17QgmqkDrDzhVpwpn/s9dEYAzgSZ7zdzrqe3C8Nx9t9E6EbTJHCiZhpynHFg9vf9vY8oWNM9wLZug2q1yJoWlPC3duHgz/fof5TozgTIfPCXMXD1T1Mpc7e6dxeOFjfppJupSjwOBB7/MTrNLCGuQ7k6Fo9sSVlXs0AQ85Nmunpj0NS6Z9XKoKNfqjjYt0wpcqo7azFj2JnnlZsrrlDKNv1pqM/bZ3p98g8gm1r9Gim+fFCi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3BRDWpJ+fjbTMshFJ0JDt46oBK8BA5gz266gTKM0f0=;
 b=H2S1+lP3QTZSV2eOSXkhy7x81JdY+JO8NpTcLH+Yw6hXpfz6u4hPr4CGa/1WUatSp426sMyhrE9oK31iG5/H5VeV4M2ETxwrNEXndqnLmdtij3Q+x4J6+vu5OIel27I83n52uik4sToDtxdcyoVtr83N4yQnM/lqMpqo4z8NfhyZSqgjQg5gJCwbIbJzzGoesI77IpLh260qN9KkWLsBdzLQAoXh4zonmyiPQJmSzx1DqR2AFWn8oh3aPLm8AGEnqmVRgLqNvxgFfrEbyYaV2F/Q6ns9u5J/rssbcW2zNYOO2wNR40iGzJCUonWQRvMr5A4nbt+UNXVXO/nPuJo7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB7765.namprd11.prod.outlook.com (2603:10b6:8:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 19:13:23 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 19:13:22 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 15 Oct 2025 12:13:19 -0700
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	<dan.j.williams@intel.com>
CC: Greg KH <gregkh@linuxfoundation.org>, Doug Anderson
	<dianders@chromium.org>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>
Message-ID: <68eff24fd7d55_2f89910028@dwillia2-mobl4.notmuch>
In-Reply-To: <20251015-versed-active-silkworm-bb87bd@lemur>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
Subject: Re: Replacing Link trailers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 53118eb9-1cac-4e9f-0d3b-08de0c1ee883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXpHdlBrdHV4YXRod3NZeGVscFdYVjQwK1drTnpXNGdjWFNPNEhONlNHWUd3?=
 =?utf-8?B?VzNaUHJIMi9rcDdGY0t3MzkxRzBzaSs4NUNZVDRYV3F2STcwLzlmMkxsSlJ6?=
 =?utf-8?B?TkthR05rdWJBcnpJV25PN0FSTUV6UzI4eW9BdjJQQzdMaU5LdU9qM04ycDFR?=
 =?utf-8?B?aWZYdlF1eVVadmtWNHh0cW1HekNuWHI4eDVqSzk5TklMdjBybGl2dXdMNzBz?=
 =?utf-8?B?Mmt6YmIyeE9lRTF5R0RqOHM3NGVnSERPVU1LQU16eE5TeHFIY3FiSFBiYnh0?=
 =?utf-8?B?ekJPMitPa3lFSVRFcFlwalpjU1F0L09tZ2N1aWljSDJZVWd2RU8ycXViN3VB?=
 =?utf-8?B?a1hJbjFHMjZHTHk4Zit2d216NXZWcFpnM1RwT2hZOExpUis1OVRmV2xWdWp6?=
 =?utf-8?B?Qm9TZktXV2lrVUlKVUtRSDYyY3hUaGtoL3NBcFlUN0xRd0grajRwa3RweUdW?=
 =?utf-8?B?cmN3dFdEamdLSDNxYkx4dHp4S1dXNS9WUmg4ZjA3ZEx4dm1pNzVQOGxqQXNk?=
 =?utf-8?B?L29EK2M4dWYvRW1oTU9sT0lSeG1QNE55RHpqbHhKajA4ZGNjSG9PVW1vdEFM?=
 =?utf-8?B?ejVWckx1Y0RZemZOR2NETmVwd05uRkJEOFhpVGRScGhnK2xMZzc0b0RiRTY3?=
 =?utf-8?B?L3JEb2Y3M3FiRCtHRWFqMGRFV3JlWGluQWFUdEg1dmhOZWh5WGEzYkRsNDRH?=
 =?utf-8?B?YXdJb2VhaTVmdVRoTkdoYzdHa2NKb3ZMdytJUzVXWnEyVjlNelNVUlMySHVJ?=
 =?utf-8?B?ZEJzQUUxY3dJZDR4WHZ1L1dZZFNqYVYrcFNnVTBTSGdyeVBxbi9NNFhyRnpj?=
 =?utf-8?B?OGhyeUs2bWRyeis4c0tBREt6UlE2bjdVOXVRaldrSk8wU2JXUHZmUXZhM216?=
 =?utf-8?B?WTRmd09DcXFJL3FKVmpwWVZQMTBIeWhSblRxZnllR05vMGY3UlZGTEFjU0I4?=
 =?utf-8?B?MU9yT1NKZ2M3Vm5jZ2tHd21xNVpFMWUzb0NpVVJxcmdrWHBSTUtOSjB6MW5S?=
 =?utf-8?B?QkRjcHl0WGh1Y1ZRSDN1YWdKRHYzR0UvNURlalUrcEtTVnVBaFc1Ynl0QjUr?=
 =?utf-8?B?YXpPZEZNNWg0a0pLSkZUTEc1aGJtVFhTQWxOTEhuOWtZaUI4WmxwdFhsZW9l?=
 =?utf-8?B?V1p5Ym56Szl4RmRrbjIrV3hoeEt2eXBqc2xvOE9oSDE4aHFkTldrVEs5V204?=
 =?utf-8?B?dFRuMkozSGh4SVk2RTNwRzFvLzZzZ3luMVJHVVhvbzg3Vkc5dzJCcC82QTRF?=
 =?utf-8?B?alJJMzFIUmxtdjgzZ29rWkI3aWhxaTVwL0gyOFBKcU9mUjhRanZUWVowMWx1?=
 =?utf-8?B?SWkvS3NtWEhlcFlGaVUrWFR5T0lCNXVxTVBvUlRpU2N2REpRTXRsR2NDOU4x?=
 =?utf-8?B?NDhwc2NqdXN5eWRjeVc4WmM4UHN4VXU0MkxoeWgyeTRVeWd1ME92S3hjQitK?=
 =?utf-8?B?WS9Id2d4WGZPdnh1M2hXaUt5R1JGdjkxbGVSa1NMQm5oRmxrSm1IcGxHZzNZ?=
 =?utf-8?B?S1VjNjJNR24vS0JrZENWNzN6T3pzQ3VKUWVVcEkvY251Tit5Sms3UWRBQ3hN?=
 =?utf-8?B?aDI1aWhGUmtPVXJmN2hyc1JVaFFtSmFjYnhJbnhhaGdHdEhhc1JnK1J5Mkpy?=
 =?utf-8?B?MEJOMHV2QlJyZkMxdlpRQUtRenNvdzJ6cDJZdDZYZ0VFR1JBYjhJSG9JREJJ?=
 =?utf-8?B?TjJDUDNybExoU3MwN1dPMXJtb1VMYXlGNkp4VVpUK2lUZVJoVHJKZ0JVeVNY?=
 =?utf-8?B?R2taWDc2M2s2c0JRS0FUQi91aVF2WG9keFZ0UURpSUhRM3ZZZzMxbm5Iajk1?=
 =?utf-8?B?WDFxWitlRXFaY0VHMGZDczg0N012L1BSN1VGUUx4TDRSNjVvM1NqWUxaK1Q3?=
 =?utf-8?B?bDZ2c0MvYklRZjRONXcyWmN0Z2xpMEVNcGdGbmNEWlRRS2ZnT0xvdHZlYjJM?=
 =?utf-8?B?Wm5XWWdMUlhvTCt3MVRiMjZrWjdQOEs5RGgyTHg4emR4OEtsZjVocEc4OU5l?=
 =?utf-8?B?OVFSbEprZW5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWxjcFV3L3p6YzEvcnBPZTJ6S2VJVG5ESC8zUmx1Q3VEVit5OFNSVXA0ZE8v?=
 =?utf-8?B?bldBNmp1b2tNdXM2bmVTUkZJaUxLeFJnb2dtY2JtZEVxL2taQ3poQmJubFc0?=
 =?utf-8?B?NlJMN3JUZHpVUGljd2h2QkEzNFdFZXZFM1JEYmEwbHhlV3hQR3RSMmE5VWMy?=
 =?utf-8?B?dEE2TmM3U3Z6YVZac2tiVFB4SHNKODBFVGVOSU5pUndrQW96aGZkblRrZWJ5?=
 =?utf-8?B?eDlRT25RS1BTTzI3WXNlbE1CL1Z4QlNQMzVnbDlwcTJJVDlTSFMxdHBvbmdM?=
 =?utf-8?B?RjZHQTBZSkJrT2dLUUNSRzZySXF4SkR4d3lqdzR3UGJFYXUzeEhKTG8wU2RL?=
 =?utf-8?B?RGVaUmpPUUFwRTRpejM0MCsxUklmR1VSRlNlSGp1VWI4bVkxODl6RnJOelZm?=
 =?utf-8?B?c0gxZzVjUGZWMUV1TzI2alpPZ2dreVJlZGNoQVZ0bTR5YUx5NDQ1VnpHOHR1?=
 =?utf-8?B?U2Y0VGxSTnQzbHpKVy9iOFJiTm9sWmlqT2liY252VEl2cjZkSlNPVmptZ3lp?=
 =?utf-8?B?enMxbC90amNBMUNtTVpoNjEvMkExSm9tK2hUMHhSSnl0amtjUDk3Q3dXWVNH?=
 =?utf-8?B?Y0tLRXNpZTdWamhmaTEzdWtQYUgyanJmWGZzMnpuelRWU1F1V0dHWjk5SFpU?=
 =?utf-8?B?NmFQai8zaXVVUmZ2MHNJMStvZmJKOTlxOWhBU1VrOUdTNlJaTklTZkY3LzhO?=
 =?utf-8?B?dmFIdzF3NEVaQUV3YW56dVpsTEp1N2Flai9MR25qNXNlYmx4NlJ0U2lPNHRo?=
 =?utf-8?B?QlIwVFBST3FzZXlQM2xHc3YycVVXdUZXck43QlQ0TkE0aENzYVprMWR1S1RV?=
 =?utf-8?B?RkJvaWZHd1FjT2owelJKWFFobFdmeUgwUXFHU3JLMzQ1bTRxY0hXQ0xiUlhH?=
 =?utf-8?B?SS9YY3FCZHUwQzVSS3FnYWsxREUrVFBpM2MvTFduUFl0dEt6ODBXcEF1RzIz?=
 =?utf-8?B?OS9VVDVWUGxaekxFRkpreVJ6bmc5QjZnOGpZMHNXajdqb2t4UzByeEJvRy9r?=
 =?utf-8?B?N2pjSm8rUHY3b2pydy80anBIQkFVWDd1eXFvWkloQUExeDFWZHp5Mk1QcXR0?=
 =?utf-8?B?YzgwaXlQQ1VzeGNjckFyd0E0R1VLd2VPbXlTYUUzN0xtY2xEcUJweWI5c1pU?=
 =?utf-8?B?QUlETlBvMDhZdWhzZG9mbUpjbWprakV1d3d4bkZPaTNLRmR0WG5BeE1NT0VD?=
 =?utf-8?B?R2dYZjlaQkZjVHl2S29OQ2xsQTVBZDFTOE1NV2g1anc2RFdlby9lOExBbjZP?=
 =?utf-8?B?OFRYR3Z1aWR2RHFFN1lrRDlhdlRvS252RmY4SHZ3am9vbXhuY0pPb0k0TmVJ?=
 =?utf-8?B?SVd5THJRMGtQZVpJTE1Od0t1VVN5UWQ0KzZXY3RSaWN6YW9zbjlhL0xCSUNl?=
 =?utf-8?B?UEtYakFWZGQxS1ZLMTUyRnlONFpWWXdValNHUnhkMitEcUwyZzduNEpzRHZD?=
 =?utf-8?B?NDI5dnQ2UlNuZVMvOEExRjgrM0UrSUhiVFdLaWZyckJnN0MrdUVhK1F0T1dE?=
 =?utf-8?B?Zmd4STM2bWhtaWVhaWFTVXRYVHArVDk2YldrYjFBemtYTUlEbzN5TUc4SGZl?=
 =?utf-8?B?VFExQXU4YVlobStSMEh1Y3BGWkhJK2I3UGpmcnMrVHYyWTdRWmdXZVVtSFcy?=
 =?utf-8?B?R2NoREtBOU9uTEIwQzBCeHB6Q1BtMHNPQWFBeFhwYXhJRWprMUthNVpKaW5R?=
 =?utf-8?B?ekh0UGg2aWk0RTRJdkZNUzRuOS9ZUndOMWhieFJ0MVBhMU5QOWdoZmtiNVJ6?=
 =?utf-8?B?R1pKa3Zxam5sVUVoZEE1RzVMY3FTNHRjaE1ZRG5RYmxzUk90eno4dEdPSUQr?=
 =?utf-8?B?TWdrbVB2WWMyNDRzWDMxN2xjaW9ZclBLSnhDUW5oODFaRzdGdGhsL3RZeEhh?=
 =?utf-8?B?c0R5ajBobW9sbDFhaUUzbjBGV2ZXSWlpY21xZUNHRnNjTVpjaSszbitCY2Qr?=
 =?utf-8?B?TTdyblArS3NQMnMwUm5yc0ZUeFhDSWZ4TG5iR0JQNU40RWdVR3pQLzk0ZStJ?=
 =?utf-8?B?TEVVSFJLSTNodVJSUzJ4UmhvY1FpNTFxM1YzTUI3WGJDQmJsT1EvZGtoR2FY?=
 =?utf-8?B?RmtkK0tWMGllaWVpNDJjOWlXQk93RFMzaURqNmNoOGljOHVVK2Z3SGM0VFAz?=
 =?utf-8?B?YlIzeDkwbEUzUGdzR1RzemdvblZuMExpd0UxbUw4c0NYNEJMWkVhQk1INXd1?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53118eb9-1cac-4e9f-0d3b-08de0c1ee883
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 19:13:22.4382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pbd088n3TKYP3zp4afeHc05tSztUW1Zz2MR3DDz2+on5m3Yxy+g58wFo9a8IqmqopFjYkx4y9BQBlEtMGzjW2PJTucqnrq5HzkWP+RUpvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7765
X-OriginatorOrg: intel.com

Konstantin Ryabitsev wrote:
> On Wed, Oct 15, 2025 at 10:09:33AM -0700, dan.j.williams@intel.com wrote:
> > > So unless we have one big "all the notes merged into one" tree
> > > somewhere
> > 
> > ...circling back to say. Why *not* do this?
> 
> Git notes are fragile, they have important scalability problems (they are all
> just files in a single ref, so if you have a million annotated commits, you
> have a million files split across a bunch of two-letter prefixed dirs), and
> when multiple writers are editing notes, you will have conflicts and merges.
> 
> It's not a great medium for a system that's supposed to be continuously added
> to.

Ack.

> I have pondered this multiple times and my preferred approach would be to have
> a machine-readable feed that can be indexed and searched. To me, it makes
> sense to make it a public-inbox feed that is just RFC-2822 messages, but
> that's obviously because I have a large public-inbox hammer. Our transparency
> feed operates this way:
> 
> https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git/plain/m
> 
> We could have the same approach with commit annotations.

I like it.

[..]
> This is trivial to search for if we're indexing X-For-Commit-ID headers and
> then trivial to parse to get a full "medical history" of a commit. Anyone can
> clone this and run their own analysis on it using heuristic or AI tools.
> 
> This generally goes into my vision of lore as a "message bus" of sorts for
> everything to do with Linux development. It's unwieldy for a human, but we're
> gradually entering into an era where automated agents are able to efficiently
> analyze the firehose and tame it for maintainers. Maybe.

Yeah, and this addresses the other problem with git notes is that they
do not follow commits as they get backported. I.e. I think folks were
using the submission Link: trailer as a persistent cookie.

The main motivations for git notes for me were to restore the ergonomic
experience of reading a commit in gitweb/cgit in the browser and just
clicking over to lore to read the thread, and to help track commit state
relative to mailing list postings over revisions. That can stay local to
a subsystem repo and like you suggest, let a feed handle all the other
forensics folks need.

