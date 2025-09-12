Return-Path: <ksummit+bounces-2380-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB11B55003
	for <lists@lfdr.de>; Fri, 12 Sep 2025 15:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0C71C86ED0
	for <lists@lfdr.de>; Fri, 12 Sep 2025 13:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444192FD1C3;
	Fri, 12 Sep 2025 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbuiBXsq"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3D13BC0C
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685015; cv=fail; b=BOYG96k2pjmFAv3mFraGUJPVWbJ7MOm3r8ULsjSO9Io2xE2R8hjNAKRhktQ3HfuPJH46QSDofQY+yexf66lAoAPsY/TmoPQRfQyB2LaYk5Tl2Yo5iN74H1s/PpFcYDhileZ8WqEFSqFV5gWGu1C/Q1U4ziJi2Yj7rt/sjten2Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685015; c=relaxed/simple;
	bh=cI9fg8SRjt1hLcJNtKb2sCmzlevIb+/15Re47JPZxNc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lHReJoGwBYfwzc75qUaKEDJYDAAJH7IKUajz5l0aS6DP8iCSYLUt9v+KibegCGjZl3cIcdEFyUFn05YA/h3ffGUNDehxTIBTJ3Rm9EnR3vm+AFTqaK9rX2+VinBgwE+P/c2bDXT6yp3f0eOJxnV1YGV2FYfm3gb2qrcMmF3taNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbuiBXsq; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757685014; x=1789221014;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cI9fg8SRjt1hLcJNtKb2sCmzlevIb+/15Re47JPZxNc=;
  b=QbuiBXsqMaInKvGrlNHXeOsEDhDK1ECav3idwDnecgpJ8qyBaQRGf1b7
   TK4ZQ2ZRbr8BpX415Ydf6xbOKLLVKFDn9J78ynXtvoefANlEL8C7GAHQV
   PNm7MOzSKQh/7HHkPKTnNp1a7ir79Ybm9y8q6592e76blRjfYonvWQDgH
   f7bRKEZdK9VBxHNSX35xc+aN0CK4KZqeu6DhnMuEUmJcbSYpyIZAhpDg1
   NIQkgCV5OnzL/RAv/oOhHa2Al4m0hZQ45Wfc75dLAkguCnflKCnS1ojku
   KRnNohKrY2Eexdt95IVp7vQ4ugSP7O+tK58dcxgbDZOwUx6untK2vqycP
   Q==;
X-CSE-ConnectionGUID: khfHJ+iuSTm3b1Pn7gjTgQ==
X-CSE-MsgGUID: gzGGCJrbRFmEWEqIwdKXYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="63854073"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="63854073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 06:50:13 -0700
X-CSE-ConnectionGUID: uSJ+fDTxRJC3ZxHVMKJzJg==
X-CSE-MsgGUID: f46DFR6IQ5iNZB98NHbBHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="174359734"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 06:50:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:50:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 06:50:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.42)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2vTQGu7d9KsZ4Wr40GlaZ6YyjcVLut632ajQCZO6vc+HVq91p7Zu6sh251GyaUoGQNYqzFVZ5RiBioFj8Qd0R9nwrqtKTNfHY0QgY8i4/Vm8e3D7lAyljvQ0ZvxlSQY3Zr+LzA/zzXWbtCOGUU4QIdI6+AILhxXhTmd0+51XtDaONaL7t4FxsIfsQwFkyv2NRRGAJaJH7SDFU+VK6RdIAzcZeu96Xjsz8Hi6miNOhN22vqRo+X/LEqZK8YMiX0jjZW+lBC35D88bmkRbD91aLqdr9HxqIH0sdsIG6jKzxyQLyd6rDskzt+b5/130KnH9AGts0mrYA7W2Px1fWKUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbu6mEleE49XzeEEivh6VU0e4Z4X7hneknfWnUBoNJE=;
 b=BMRmHLUCj62ZFiYOOpcT0FieR1lgPVSrkBbi+XcSnxVZ8lA9JuEFeDJkrE6CinV+ITnYLR4UEau3rOERvYA7LDs/AXusJyDDkFVSftax5f02kWGKpZK0vGdjE8tjuLDOYRyYK5tyGlYymZ/Fpict9iNhwjZgztVVuLD2kg9mFsgYHL9vJFVkkJTiOdBTufqFz40quLCGXd7ln6R+0cJjapZUkKvJEbu65Hfu8nzbFNdsE+WUQckVfFO2bgMBF78GcBbN1yrHQ0Q78XznYpX2Hbhk2rRXOSSg3KhprbvX7zp5eWCXZI68zSXhHQZGY5YjPWu9cVxxnqeg5S/SPyOwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB6103.namprd11.prod.outlook.com (2603:10b6:8:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 13:50:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.018; Fri, 12 Sep 2025
 13:50:01 +0000
Date: Fri, 12 Sep 2025 09:49:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
CC: Konstantin Sinyuk <sinyuk@gmail.com>, <gregkh@linuxfoundation.org>,
	<ksummit@lists.linux.dev>, Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
	Leon Romanovsky <leon@kernel.org>, <ogabbay@kernel.org>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
Message-ID: <aMQlBBu-ieIk1T38@intel.com>
References: <2025091207-blouse-scratch-dde3@gregkh>
 <0f876c7c-566b-476a-b590-d490d41d605c@intel.com>
 <CAPpb9ymTGwMnJaALJOHx4TcMLxA22w_KcY8=Zxzy_Qy7Uk==9g@mail.gmail.com>
 <CACRpkdZZdj1o++Z2tYVuHBkY_Tjypo=gu9srw=f9iL4rDJ4Jbw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZZdj1o++Z2tYVuHBkY_Tjypo=gu9srw=f9iL4rDJ4Jbw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: c2df6128-6b2e-4608-e5b7-08ddf2034490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTJmSzV5Vk4yQno1T1o5V3dkUDlzRVhydnJ5UlpWdWhJWXBXaFNlYTgxamwr?=
 =?utf-8?B?M1ZPdGJlak84RGlzdTFuaThINjl4TkVoU0hCaU9NUFV0MFNkelZLRTJIeGtm?=
 =?utf-8?B?NzdZcmp3QjhMK2I5YjJ3d0tjRi9DS2J3SjB0bWZZeGZXY1FDSVpEcXh0TENK?=
 =?utf-8?B?QlZ3QldKcFhBcmxiSHNtdllaQUh6Q042QUsyeUl3am1xc1ZJZkdSc2tZVmRX?=
 =?utf-8?B?c1d3MDAxTlROQllYTjZOU1JISE1NODRMM3JRYkxMeTlRTnNuVnptRS9oaElp?=
 =?utf-8?B?TnJuWGkwRHVQamNCRW5pbmZXWlgvUU9CcUJOc1Rmb3RnZWlYMCtGdHk1UU5t?=
 =?utf-8?B?QS9VaGdFU1ByKzZLUms0TEpEaS9GandEbXNTTC9yVEdzeXFmUWUxUHlqd1Nr?=
 =?utf-8?B?MmQ3YVZXU2JCT2M5alVmTzhoOFFndHQvdHBqVkdXR1hoMnE5WHJpQzZZRVZz?=
 =?utf-8?B?ajNiS29YZFVnZEhQT014RGFoMkZiY3RQVk54YWtQNHBaS01reXlBVHFNQnZZ?=
 =?utf-8?B?L042VG5MT3A1bHdGc1lsbjh4L2V1QU5FajdocEFRL2ZrbGQwSzdSTDVoN1Jx?=
 =?utf-8?B?bTNULzUwYnVUM25xeTFESVlwMjJZWXkvTzROMXNnUnM0eEtHME9CZ2RGQS80?=
 =?utf-8?B?ZUxqd1hPSWpqZ1UyT2tKS0ZaTWZYVjVTeVVYM2xjcEJXU2xvQjNabFFvSUJt?=
 =?utf-8?B?U3oybXdSc3JFZDlCUkFCaGNXSEZzYnJFdkpGQldubm1yTC9wN0F0S2pUY2NM?=
 =?utf-8?B?YzBVODVlWXl5NUFENHN4SUxFRDBkNjc5Rm43Z1BTRVdpcE03dW5GTkU3MlR6?=
 =?utf-8?B?Y2dIR2tPWmpCV1lEdjNTYW11SmkwajVYUW5VMHZ0WnVReHA2NjNMQm1ZZUxI?=
 =?utf-8?B?aytUS2FIODVFaUZIdzdqU25hVDJ6TFJVODk3b0xrV0RDc09SeDJtN3M5aURi?=
 =?utf-8?B?WExGZjk4M0hkK2N0aGFrSWVjMWtWNk9yblZpTDZEOHQ3ekRtV1JBVmhPVnJr?=
 =?utf-8?B?cjQzSHoxTVhIcTlXamh0bzJxbTkzYkk4eVI5djNxWUdmQ0srbFJDamVSTHNh?=
 =?utf-8?B?eFJ0d0ZPMWlZdVlwWG80bUNPY0FsQmdrRmR4K0F3a3ZqRTBUVFAyNjlJTnNp?=
 =?utf-8?B?eHVWa0xkRlRKMDhnNjJBckkvaGxULzQ5NnJlbHVFSktJamZxNWZZc2RkVjYx?=
 =?utf-8?B?UG1kTThHS1FkdVJLUXRYVnlkRS9hRU42bGFldGZXVlJBSThOOVNpVm1obHkw?=
 =?utf-8?B?SkJFTGg4VGxXN1VYMkd1STBrMHh3cm9FK2Jkb2lQa0FnbW9sY1l4Q09Day9r?=
 =?utf-8?B?Z2ZMcTVzYm1td1NzSVdPYWZhSlBjY2d3STBTSVVzeTIxdi9FU0dWbFdQUlV6?=
 =?utf-8?B?M2pJWVhWQ1lselZGaDNMVHRLTElsamVtSjNWMS9IZ3BOTlJ5NlIvSEdpZWFm?=
 =?utf-8?B?RnJOZ3FIb2w3SGVhWGFRamZ3eGdnZTkvY3hYT2srZ1l2SXhkUm56M3k5bTRs?=
 =?utf-8?B?QzRNNko0c0VIL0FTMUdPVm9jbHNqa2ZvZ0UxYWdEQUVBVXVZMHdCU3B4ZjE2?=
 =?utf-8?B?U3hRL3ROWldhT3lyNlRja1ZNNlVUUWh1NDM4VW0vNGhZUnBhcFNiOU4rc2xz?=
 =?utf-8?B?WGs0bVFyVXc1VXdXNExaL1dPTmRhNXVlNDRBRFBVb3lCYW9wK2pNM1JRRnQ1?=
 =?utf-8?B?ZThhbnFWUkwvaXhUeDIzTzkzM3NXVkQ4QlJ4N09yMGRib3hxTXlhSk12RmR6?=
 =?utf-8?B?bDNTVDhsT1RXbGt5Mmd2aXBoc1VOQ3VhUGNkNUxxVGpzcGdvK0ljelZFRkVE?=
 =?utf-8?B?SjBlcGJNeGg5WEYxNzgvM3JacDlFUnNYV09BcFQxbUJGQkNKVXBpQTRXL085?=
 =?utf-8?B?Mi9ic29LTzhCRldJa1JzOEFLQVhMSUZlSDVxNEF6Y08ycklONDZmSlZhLzB2?=
 =?utf-8?Q?9pMM3UOyAiE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFCeHVIUWNnSHFqV1B6VWVjeFo1T211WENEMUdmSEVxZnQ4TkE0UDZUanRl?=
 =?utf-8?B?cHRUV2dnVkE0ZERlc3M3dmFpQ3NubFhnay96T0dScGVwd3VDSXpBNS9rUnFn?=
 =?utf-8?B?YmRWbzJIMUMzTDV0cFZNREdqMSs0Sit5NE8xMGZtUUtPQVJvT01yTzl5VndQ?=
 =?utf-8?B?WDZVM2trb3RPdm1GYWhVZEtJZ0JCaURhOVo4N1NmUnRHSmZ5bGd3VnZOelZM?=
 =?utf-8?B?NWV0bVJQQk5iVzRsVEJmS2pBTERzRXhvY0Jubk5HUmcxZlBMeTYwbWlQSm8y?=
 =?utf-8?B?RC85TWpDUFRPMnlEQy9nRFJnYVAyMHVjSTY0WW0rNW9IQjEybHUvYnR0amcx?=
 =?utf-8?B?bEtkYitNR1BUYk5GV2hIWm1qTFZJcEFmU0dMYWZZV2NLOXRIZFhwVG9KbnFC?=
 =?utf-8?B?akQvUzVoelZ0WkNma3Z5M1c1ZXdwVlFVM054R29Pand5UUltbFBxRWpLRk1K?=
 =?utf-8?B?TUNoVFdsdG93TFQrM1U0MVZpalNxNFBWNGhqWHlnVGJsMU4vS1NwQ2VpK3Vt?=
 =?utf-8?B?UFZ3Nm0rNW5hNC9XUjVOUlZMc3VqV25ZSHkwcVJWWnpJM2pOb1d5c1dQWnp2?=
 =?utf-8?B?Tk9QV3NTc3lFcXZSMDc5TERjMUx6YTYrQVZXWkdlTG4wUC8wTFFDZGt4TDlM?=
 =?utf-8?B?aVJhSXl5NFlrT1BYZEk0NHRzb2h0U0VsN0xZSDdsN25SU2NFNWo1NzNzNG9r?=
 =?utf-8?B?dmFweEl1czJnUit6ZENQMTF4SjFjUkE2a1VWVjB0Y3ZEd3FlRThIOTJUc05p?=
 =?utf-8?B?NGxjNjA5U0Vtelc1dHdHNzBFTzMrZnBGcFVGTG9mRzlrZTRybmdVWlZ0UHZq?=
 =?utf-8?B?RVB5eUJwdHg2N3VKMmV0Vlg1ZVQ2SDF5aHYwbjNZTHF5VDZRMndSKzBNWm0y?=
 =?utf-8?B?bGFQY3dsejRjdFMvMTNjUTdNZGtIcFY4b0JST3NYOHYzeng4OGxpS1crMldU?=
 =?utf-8?B?cDAzV29vWW5vR3l2UlBPVzJOTytBdm13ZWlaeTRZQUlJT2ZkdDBsaTBHZWQ5?=
 =?utf-8?B?MDRNK1UzaFRkMFFxTVFWNG9kTUx2c3lpb1hnaU5RTk43VldHZ1A0UkVoK1VN?=
 =?utf-8?B?RUt2S3d4Tlc4WXpLYmRYMFlvV2l5d1UyaU9FOVRRSzJLaXFGTG0zdCtiYjAr?=
 =?utf-8?B?N3RVMFkvTHFhdzhQdjRLRUhCd1M0ZWJVQ2tnZmF4SGhTeFZUMHd5aUQyZVE4?=
 =?utf-8?B?WkZZeVU1MmZNdlhrcFhraVorb0xNTHNFWVc1SGd4N2JhdEZqMHMzOHpJMDBp?=
 =?utf-8?B?VG5XQ1p1R1pjd1JkMlNoOEU2RW5hT2xPSjlBZzBBVWE0NVJlUzN4Ykk1c2hK?=
 =?utf-8?B?N3hvY0pIRlhiRU8wWERWZ01DS1RUVnFyVEEya282MEN0WVFDeDMrTVhQV3Ar?=
 =?utf-8?B?REZjQ2xLOGlGM2xYeWUvTDJRS3VKQWVobzErWUJ5RTF4RE5mS2NnL2w4dFdB?=
 =?utf-8?B?UjBvcGVOejcra3RCemk1UXJ6c1M3N2F4dWZsenNSdVlBNjdNcGEwQW5FTzVL?=
 =?utf-8?B?YnEwamxHZ2JFTHFOa0VmWjJzUXhpRmhYVERVb0UrTTVaOEhLQzhtQWxRL2Z3?=
 =?utf-8?B?cFBDTjBhSGMvTDJHRWVNT1laS0JOYUpUVGNKWEsrYkNSR0twU1k4RmJHWnBU?=
 =?utf-8?B?MnBDOWFjaDhTOXNHTFpKcGs0SnBZQURPdTk4QnR1alV0UFBBVVo1V3lSRE1G?=
 =?utf-8?B?OXZXL3RmYy9oRjlRc1hhZU9MQzR2NEFVUjVKVkZ3R0NUNi9Va0dWSHJRTFBK?=
 =?utf-8?B?UVFDK3JEMlBoZlhDTVM0djZ3TERkUzZZTTZrd0pYVS9FTkh6NkVnWWc3eDFx?=
 =?utf-8?B?Nm9vOXAydTlaRDM2VVhrd3JMK0szWlVKeG16UWdLSGdSMlpqZjcrMzkwSENC?=
 =?utf-8?B?NUZrdlpONktpcVUzemFlaXFhYVlzVGJUbHdlSS9vRkRsMnF1alZoak8yOXFY?=
 =?utf-8?B?eDdJWlpsVXE4ZmV5VktPakMwR0hOcDdWc1NacEtvcjdZNUZsVmtJVG1heU02?=
 =?utf-8?B?K1NBbU11Tk5BVituK0srSWtwMnZmTENxd3hWNDJiRUptQ2hsaHVHSXAzZi9R?=
 =?utf-8?B?eXlQN0pTNk16NUQvQjBYcDBjYkt2Ry9UKzZUVXVaSEZmU3daczdOS3dRMXZ5?=
 =?utf-8?B?ajZneXBOYjFhaVpVUENOdXV5eHhCeWQ1ZmpNRXJXQWo2R21VSWVhVGdLcnRB?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2df6128-6b2e-4608-e5b7-08ddf2034490
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 13:50:00.8431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJUddACfegusq3a7b2q1f9OF0s0sgCDm5CmL/jwBk9+laQUaud7elxZsR25eMoGUlX+U4v/mfpV12m6iKZ0Wtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
X-OriginatorOrg: intel.com

On Fri, Sep 12, 2025 at 02:18:40PM +0200, Linus Walleij wrote:
> On Fri, Sep 12, 2025 at 2:07 PM Konstantin Sinyuk <sinyuk@gmail.com> wrote:
> 
> > Longer term, as UAL adoption grows and multiple vendors hook into the
> > framework, the natural home would be a dedicated drivers/ual/, just as
> > CXL evolved into its own subsystem.
> 
> If you already know there will be other things than accelerators there,
> so it's more like, i don't know, PCI or greybus, then put it into its own
> subsystem in drivers/ualink from day one, I think drivers/ual is a bit
> terse, the world is full och TLA:s already, also that is its actual name
> isn't it? Hard to miss if someone is looking for it.
> 
> Your merges can still go through some submaintainer like Greg, or
> DRM, if they need some shepherding to start out. After all that's how
> drivers/accel is managed, through DRM.

I agree it should be drivers/ualink from day 1.

I like the idea of the flow through drm.

> 
> Just my €0.01.
> 
> Yours,
> Linus Walleij
> 

