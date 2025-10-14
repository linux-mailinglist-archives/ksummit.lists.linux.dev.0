Return-Path: <ksummit+bounces-2522-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBBABDA8D6
	for <lists@lfdr.de>; Tue, 14 Oct 2025 18:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60833500EEE
	for <lists@lfdr.de>; Tue, 14 Oct 2025 16:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6432FF646;
	Tue, 14 Oct 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLY/p3M0"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34839221F03
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457703; cv=fail; b=K/5oRdE2KY23c79/BB1AInL/pPm3E4fXoC/Zr+LqdnbWBWYdbqdiH4LR/1Ka/g1qbBWNchD/sp9xKSwzepOvMTdRzZuYxHqmT6tWQ8/vxJIDj/ORehc7TuQnRaCXqGNPSDQDqq/JCyMhEYD2PppGAbEYoqed3BHMkX3jZsW2+jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457703; c=relaxed/simple;
	bh=2kScofGTDz2kh46vtVGujeUdPyGeBLtfwGfwEq3DLkE=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=GgAGpBkZ+lGN1wbTPcMdYF1w8dImpr+4IWddVUE75TvO/VS7cim356sOriVDNIFDMltj0P+XlhrQP+oXmgmdr1tChEUqqKb8Ra9uCyxLL39H9ziWL2Zc4kfVmzQDKomMNBig45D017cbKcY6pbSD+9ZWlvmIDmstIirEdWWDzmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLY/p3M0; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760457702; x=1791993702;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=2kScofGTDz2kh46vtVGujeUdPyGeBLtfwGfwEq3DLkE=;
  b=CLY/p3M0olIkk9qjFKbGYgFjZ04pdNkyUiI9wsqZyJxR+ba4Um2vIqZ1
   Vm74emasoAMgnrbByc3AD8o5mEZTBTem+QcrxIBTyOu67223ohMSYxUcy
   dtkNQP4KPJmb6oOmeyEUnimWov378rk4b/b2q8sGDtSkZgJz5bDv8IE+B
   SY7hTNI6JQ/GgwZqpDjTkVkrqOLzQx68/WArXJlXoOOTT0L+LN5i+Akra
   4qalcPDj6mbkaYqT7To+ROOrlCQ0tL+R6rozJNc7z5dXAEZt8IUZRTPcW
   zYe8HjRfM8wbM6rlA2frTpn9usbP5AkJ4H3YttUg4duhZKhkpZuKPe6ZB
   A==;
X-CSE-ConnectionGUID: P+wYgZ70THG3NiQxbS7a4w==
X-CSE-MsgGUID: 0DyNEGh6Q5mv0rbF4W+Ebg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="88083984"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="88083984"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 09:01:41 -0700
X-CSE-ConnectionGUID: eBjnbGf6RjyoHtP6zE033w==
X-CSE-MsgGUID: q6CyCSVBSdqwQRg61JcXaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="187230795"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 09:01:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:01:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 09:01:40 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:01:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoWk5D1KzN2uYn+XaIp3au0ieouF3ZZMGvCoFIQq4rE/1qq+81fDhYnQH6m77xe+mSrq4bGC81CEkz5ybMOE++/NIFMsfZx+WJJi8dtOmGc4GPryvNRY0xSJZEhLePsnN0PqQRMLhtGxB/IfrhchDk3vRNZMR6tRUUM5Fcu4y3nJTgeFwtB16S8fTJ9VllphMdM3rDfo51UTbmCPIAl8VAN5WPyJD7MH4AL82kev92b2OaGngD8qF/7RJynAzJsDIpUww0PlblxWW2Qgh0+7R4Fh3nG14+qJYwvHQQGVku/qtJDZ+TECS8jJIB98WtbKh9Bn4wcQ4dbWPq3SEv23HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kScofGTDz2kh46vtVGujeUdPyGeBLtfwGfwEq3DLkE=;
 b=f3sqIf2meV1rW+u43W8AqWDXkAcYhEz5+HyzfGsEiU3VLX/ploxII1EZ9JXC6qiy0iMk2ymX4OFssmfYPLl2Z8eCF2Alc+qAxaHpEX2nXZ6u5TffAH0kvJa+nAY0OppYBd45cX1N51nlf7S10dVTTilIrkwNDxvPe/la/7FZLCtXop7qkWoa/LG/2pKyiJ8QX1+gNhCDap4pO5zQh4v7m4ciHQlyfEg/6AJZyF+iFhYA8Zaqik5zoiH6/Dy98zi6qC3s5lXFywiBCJvftv5a7vNf90AuiQpUQNVlHSQGfeWScs0qGO57riKOntb1tUYvA88CzwTGwXnW/Nht+jR6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 16:01:34 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:01:34 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 14 Oct 2025 09:01:32 -0700
To: Doug Anderson <dianders@chromium.org>, James Bottomley
	<James.Bottomley@hansenpartnership.com>
CC: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Message-ID: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
In-Reply-To: <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
Subject: Re: Replacing Link trailers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 65849d2e-7eec-4639-e149-08de0b3af2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3pBYk5RZ2k3RndOVS9WNUJsYnFhMHYyWUxUd0dBT0REa2lHeEVkWWZKbDhW?=
 =?utf-8?B?MHFpb3JPejd2SXdZcHFPZVhFMHJXOFZlVkh3bk41Ym1rK0F3clJTM1VUMEJC?=
 =?utf-8?B?UmdnM3o0UmNyY0tPN3BJSWdUbTE2TGdKaE1LdFVIM2RFbUo4VWs1bENxdWly?=
 =?utf-8?B?SXBGR3hXd0diL0xNWVRLUlViMk94ZHhiNnVYeHdNLzV2WXpXT3VrT0lTSUlW?=
 =?utf-8?B?YVltaXBVSnU1M2V2VzlvZmhtUlRZWkwxQSs2MnJCUXNacHduNlJyVmF4cHBp?=
 =?utf-8?B?bFM4NUhUb3pOMDBLdFVoeG5aLzlmNmR0RjlXc3FyanZGWG51aFVDbEowQURW?=
 =?utf-8?B?WTJFZm5BVnFJN05kZHhPZDRzeGg1a0Zuc3ljZlhMV3NZaG9kWjNYYmlXQXVt?=
 =?utf-8?B?dmVpMDIyK3pVWlhTK1pNN1QrWVFDNlVMNnV4ZWpBeDltT1VaMXo2eFFxNk0v?=
 =?utf-8?B?cDdEcEtYUURZZVlzcEpaNU5yOXhKdnJxRThBNXQ4ZnhuMEg4TDZwNWk5c1ZM?=
 =?utf-8?B?TFQ0VDhGYUdNZU9iOFhTWU1yN1o4UjM0MEFWM21hMGJObjhQWHhpVzRSSUdP?=
 =?utf-8?B?Nk1KWEE1MGZDMFZEaWVTOHRxOFdqT3VzZjQ5cVFVcnZHZ2ZYdVJsSXVBRS9x?=
 =?utf-8?B?cVM3ZWpXRmV1a0puUW5UVVhZZ3RDN1ZtK2VubG15VzRwcjlsSzBzYmlVS3ZU?=
 =?utf-8?B?SlZHSWNNOVVyUk11YXNmOXVzNmYzQzJacllxNjFXNzhHS0pubHI0dXRPeFl0?=
 =?utf-8?B?d2wra05VcEtGWHhpY3FQUEVUeXFlV2VCa2t4WFRkVWV2cWV6YnZaU1BYZEhp?=
 =?utf-8?B?YmxlK3ZQU0k5MTZ6UVNmY2FMOFNiUVJ4dFlqS0M4N0s3YWV1UEgrYVUyOUth?=
 =?utf-8?B?UjVuSUlhUDgyd3F2SU51d01lc2JwYWEvMFBSZHBtZHFSZngwMXY4K2VqcVpW?=
 =?utf-8?B?elFVMUplZjNvRElZMG4zdE1MUVI0VXRPenNtbHlOejJhbnQwaHpwZU45S0FH?=
 =?utf-8?B?cEZYMnJWRHZJMm5zTHVWK1VENmU1Tmx3dDFHTEpIQnZPNVpPeTFHYlhucnNN?=
 =?utf-8?B?RmJvNDhXNnNBWTRoOXcyY0VJeHZjRFppS2kxWDlGeUJmRmJnTndNTFk4bUVp?=
 =?utf-8?B?ekxUcDJFWi9YUEJkWVNyRVB3RDMwZGQvS1lrY0MwK1l3c0FCMzduSVJSYytl?=
 =?utf-8?B?UmlKWVpLNFNNNWRNbVpBa1l1dXY3NDlsVXVLZGdQTkVkczRlRTMxcW9nSFcx?=
 =?utf-8?B?ekswdGZTWjN3ZXlIdERrSW8rSk5QeSt2WElSR1did2VDQkV3YUR1U25tMjEr?=
 =?utf-8?B?dXdQU3pSYnZvZ2RueGdyS1ZqdEZyakNNZnh0eS90UVFEM2NXeFZvSFozWXZh?=
 =?utf-8?B?SnVxZlZ4aytCbWV4eFB4ejh6WFBpaDF6eHhLSnpOVm9GTTI3NFBlVDdFQmE4?=
 =?utf-8?B?aVRQQU5xWjUwWnNBOVpaczJ6a3hyVzgycUNkeDhPQkxKb1RERyt1SXlvWjdR?=
 =?utf-8?B?akxGb2VKUSsvMXJpeCs4TnhhTWl0THMxUjc0WW96U1BGUUJWaWpxcG1JU0J6?=
 =?utf-8?B?Uk5hU1FSZUl4eTZqa0F5OGNVbi8vN1dqeUJxMDJwTGtSRE93TVNXTTlIa1Vs?=
 =?utf-8?B?MkRvNXhFeDFXOTdPUHFnYjBmVGJoVk1mVVYxSWFmWkhGSXFScWpLaWFjZzhv?=
 =?utf-8?B?dCtVcVhpTUF3Sm5yUnZpTHZGS2VBd1FYekZrYUN1NHZWYXB2NWJkNGNYRGt6?=
 =?utf-8?B?MitQWklXUDZzZGh2Y0hkNlUyTjAwQlFuSzI0SnNZY2ZrVnorVHhnWXowdGxC?=
 =?utf-8?B?ejNGSGx5ZmQzejhaVENHSjdYYllkejV0MjVoNXZFcEdtSEpIM2FmSW9jTHNl?=
 =?utf-8?B?Z2V1S1ZyUW0wZ2RDUWNsSDU5TFBlbGxQNldabFZtUlpwSWVDczJnOFNQcVRs?=
 =?utf-8?B?SFR5SEtZL1pzTW02WVZsMnJjQ1d4SVFMSzdEeUhNU21KZkJqMUFFMS9QTU81?=
 =?utf-8?B?UW9xcTY0T0hBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STdHY0FTTGtPMWxUNWlSdlZKOFNUb2l5TFNaYnJlM1Z1V241Ti9yTEluUXFl?=
 =?utf-8?B?WHUrU2QrSEw5S2NwcGdxVUM1L2hRRlRIUUM0dG4vcEdBYlVqY2U0OHNkdHd2?=
 =?utf-8?B?U2NZSUdKcUlqT0VBNXl6MlBtRFBLcG1PaUkwZVdpV1FBQk5mVVFPSldsVGlE?=
 =?utf-8?B?cWFnUkZaM0pDdDhHYzBVbUptbDkrQ1FSV0QvbU16NFR6V2puSDdPWFFNVkh1?=
 =?utf-8?B?VTFvdjFXTzE1d2Z2MXFoQU1xTE1OV0EwOEJHUE91Mk9nc2V6Nk5YMFIrZjR5?=
 =?utf-8?B?QTY0RGZwTFNlQnV2UUJOQjA4K0ZPQTd6eU1NMUNhUkM3R1BwL01aZnV6WGNW?=
 =?utf-8?B?VHVYcmZxUUxoNHY1WFJOQXlqODVXRlByRUdjeHZlbi9keVBIbTVIbFFmQlhS?=
 =?utf-8?B?NjZ6YkV5WE9LYTlzQzhMdnNFMVFyTGlJY1UvNXRUOVVFajhpSS9td1VoZXZK?=
 =?utf-8?B?SkNzejF6MjNYWCtqK1FYUURFRk1xM3hncXBmSGZGcE02d1dsNGgwL0lLdjJQ?=
 =?utf-8?B?U0czbkFjVzJLR1lOenpEc3hBdm1ySkNCa1A5blhzS0FiZUMzV0RRT3R4alFr?=
 =?utf-8?B?NVg0QTNCVmZRTTgvQ0M4T3pxblZoaFVOSjN0ZEVnYy9NdlpYQnVhcUlubDMy?=
 =?utf-8?B?VXZ5WGRFUFBGaFo0dlpMVGFnNjJBNENNY3M4aGk3TC9EU1FHMnBjOHdSOGlu?=
 =?utf-8?B?Z3VsdGZvWjRkbUY4VGZVc2YvWGpOM05MaExiM3luK2RERStxa2JscDEwNzYy?=
 =?utf-8?B?SkpuMW1YOEpQOFFWcU0zRUlmOWdad1JpK3dRcTRRM3ZxWTZTNW1MVTJzVFpG?=
 =?utf-8?B?c1U5L2JFRG5kRU5SUnpxSmgrNFNYeFRSYXdCdnN5RDV2cmgvZWVMd2xscDNi?=
 =?utf-8?B?OTVoT1FWT01lQlNDT2xpeTR6ek5MZ3ZTcW9WWEd6WElsem1yUUxXRnZLNnhW?=
 =?utf-8?B?anBRaEZrQmV3ZzRvR1FtNmdtY2I4K0ZOYmZuNmxwUUhsaVVGT3RvSEZqK1ZF?=
 =?utf-8?B?aVNwTVk0VTVKZUFXTzlaYmlYbFJxMHNSVzN0elo5amZxdEFTRXVSVnJxejBh?=
 =?utf-8?B?SlpFbFloR0ZJSkl3Z3RuUUtYTkZ6VWdjNXB1SkRzdE4ydWh4U3JSWU45bzJ0?=
 =?utf-8?B?UnVtbXhENkdydDBLbHNQVnU3V0d5TDE3dGpVUlNsazdjZndtSDBTZkdpZlJ2?=
 =?utf-8?B?MW81MGNSTFl3TTgxV1dzM2FKWlJwcWNaT2o1NFZjTlFMYWVFMEdkbzVrNzl6?=
 =?utf-8?B?WmY5bUVkM1VIaWZybFM3clhVc3pVRG1VNmhEQWZQc3gzMDhFNk9iZ3R6U0Ro?=
 =?utf-8?B?cFg0bnh2d2VCaHlaV2pDenRsYjhZVXN5dU1BeWxFRW13dEYxTHg3R05ic216?=
 =?utf-8?B?MW8rV0VobGdrV3VDeFFUT0h3cm5sVUVXNGFlMGd2VzVjWnE4ay90RDU5U0t0?=
 =?utf-8?B?MGRMVDRJNDlpZlpEcmpQd0VOVnpYQ2FwWlpGa2QxdEh6c3dwUG1NbnBnTU9J?=
 =?utf-8?B?SXhubklka1A1Q2NDWHM1ZHkrQVplelJnVWg2VUlMclBXbXRjKytEMU93NGt0?=
 =?utf-8?B?SFdZRUZCMWFrbzdXTXRJM3dENHVRQmVEM1FRUkRpOUh5NkJLaFJYQ1ZIWXRj?=
 =?utf-8?B?eXN2YXhUcHIyZVEybC9DNUw0ZHpGR1lUbDVwMHhCQkhsYWpWT1pGV0pEcytZ?=
 =?utf-8?B?cmFvc0s5eXZ1czk0VWxQS3FUMnJyeGtseWd4UEVmdDlVbUZ3N3R3V2tqOTM3?=
 =?utf-8?B?Rkx0MzE2OEtTczdEcGpEcHBuTWZhdXVobHQ0OFRockxxRW5UdEs3SXJtdHlY?=
 =?utf-8?B?bWtYZGVlL0ZIVDhSNHBDaStBd0lJOEFVS2FxT1N2d1hHU1dUY3RSYlA4SVRk?=
 =?utf-8?B?QXlNQm5DWkR4a25XZ3RBOStrWC9LdU9XZ3dJTzVKRnh0b0h2UXJWSDM2VWhw?=
 =?utf-8?B?TzVET1FIdFh6QXI1bG9Oa0l2VlhOaW5qRUl5dGhyVVFLdUV4M3ozdW44SUpa?=
 =?utf-8?B?QXduUjlwMndMWHlOVExrVnZTbkVDT2pnMUdBaXdPUCtyMjRlS0tzV1Y4cVRC?=
 =?utf-8?B?RE1kV3JBakU5WmxERDRSK0dtbzlkblJXOVI3U1dQWWRWWWxGUGJOb1g3bngr?=
 =?utf-8?B?SzljT2x3UklQTlV0SlIrL2NoMlRIMytNNWFYNDJyTGdGeHd4WUpiUVMvajZT?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65849d2e-7eec-4639-e149-08de0b3af2ea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:01:34.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7lvw8qRgnIDfmciIHIQDtCTCvr3BYVzygjkY8PfT7Q+f14rBKtCOxWoQVfSQqsh/ZM55ZTtubPxs54HjGGKgWf8hB/lB44z8jwl5ELCX9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
X-OriginatorOrg: intel.com

Doug Anderson wrote:
> Hi,
>=20
> On Mon, Oct 13, 2025 at 4:53=E2=80=AFAM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> >
> > There has been a lot of discussion on the tooling list about how the
> > loss of link trailers has updated both tooling and triaging issues.
> > Konstantin has proposed a tool to get around this, but while that's in
> > development, I propose a discussion about making Link (or some
> > alternative tag) into the pointer that would work for everyone.
>=20
> A few random ideas to throw out there:
>=20
> 1. Could we submit a change to the "git" tool to allow something like
> the "Link" tag but hide it from the default settings? I'm thinking
> something like how "git" only shows the Author/AuthorDate by default
> until you say "--format=3Dfuller" and then it also shows you the
> Commit/CommitDate. Then we just tell Linus to keep the setting off and
> everyone is happy.

A place to stash metadata that: stays out of mainline, is readily
available to the subsystem maintainer and anyone interacting with the
submaintainer's tree, git notes.

Towards this end I drafted a b4 feature:

http://lore.kernel.org/20251014071530.3665691-1-dan.j.williams@intel.com

Note I still think 'b4 dig; is needed for other use cases, but a git
note in my local tree restores my workflow.=

