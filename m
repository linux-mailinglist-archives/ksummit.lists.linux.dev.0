Return-Path: <ksummit+bounces-2390-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B583BB58495
	for <lists@lfdr.de>; Mon, 15 Sep 2025 20:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2E31AA5ED3
	for <lists@lfdr.de>; Mon, 15 Sep 2025 18:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B608E2E9739;
	Mon, 15 Sep 2025 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERgXarpU"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5702EAD14
	for <ksummit@lists.linux.dev>; Mon, 15 Sep 2025 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757960952; cv=fail; b=q/7qa5l1W6oI/ptpNlGTTKfoTvmGPenGCNlVtofUISJAZAn/LyWkFZJanxZFgtAURyZoIvz5VnqNNiIbZLSeb1F6Z+rM2vIUEVZfc4sl8ja5bjiQZmuWiQF/IXScNKpi1J8Q6jqAC6Z73Ew4tve/zjmL9y+NaNglgugHYudUUkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757960952; c=relaxed/simple;
	bh=1zhLVptMYqVfArSByvWPx4BVXos816j1bJgtfTh1iao=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=BGipJlGW2KiHas7w+tnBCXsChmhvmExjcCdyXxtqfbiv1NBG30WeF8beoNs8jcGVpgrOtDQlNQALeOQUlWLKwbVCg9MBBHTKIlZTANmglomrAMEG+CcpjD+ErKD7ltZSgZMNmdPU2eT1QFy0TrT7ORCkwydcIk4bx8kCrygs/nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERgXarpU; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757960951; x=1789496951;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=1zhLVptMYqVfArSByvWPx4BVXos816j1bJgtfTh1iao=;
  b=ERgXarpUNcO4BkWQpPFfYpiCLbqg13hRDMggLQcV339dUMZ5Rplwdt8n
   Slw0LN0sa9CFAigpRm8VAe/aNyZUdBfs3Pc2BDnq+tC72es3boZ3uHu8F
   bnBBF4qblACLwE6pEzmrV1nN8MVttcAjtLSrY3fuF8u753ZBYvYwl5I66
   TdhV7b/f9yqJa+s1S6xGLRpo2ZCXGG1QvcX4obKhZkXDehck9YlJmR5nZ
   wzM5twNNzIACfPPHkU1pf05PoF+WZhZcYQTQPawBbOaNEEDcK1IEzqQ5Q
   HGn6ky6iFADwRG2vFbt+YD61ZVnrh8wntEUR3g3CdGBbxDqhy9q4WRUjR
   g==;
X-CSE-ConnectionGUID: wpPKYXeOTDCSd28qln66iA==
X-CSE-MsgGUID: kfiDxJtZQPiQ90C3YRVsSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60281805"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60281805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 11:29:09 -0700
X-CSE-ConnectionGUID: 6H/8KpMfQvebPiZNWDB4Gg==
X-CSE-MsgGUID: h70KTrQ4SlaahkMU56W8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="179080175"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 11:29:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 11:29:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 11:29:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 11:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOR+yKbS7qqR90PnNXT2s2Sgis9DLxBLQxSM5B2/hPX+v6rwptjRMfrSsHtaOFBAyaW7ARQob/7wTs+1KunjWmhP5i+j0O5y/G0fAjzsEaL7338yQGBBuSTce9HpV6ES4nPKjF9yv1yB8uzwUmyOTYMvrYAGxWL/fc1/Hf+rWQ+NLM/92is5gQ1eVAWYBnXJgq5R52B15EGbUYvdV94AVQvhbh4uTP9urlUpeFacM6f/EzLHowW1E5jmmYxezngq83/a15QShLDt4EoRtyy5cx35c/eqAR5IWeHZWjgG7uyCDcQVpEE3imNldQQPqBFnDAzp5mIn3aiAACfmK6Ascw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zhLVptMYqVfArSByvWPx4BVXos816j1bJgtfTh1iao=;
 b=hNCuewUeYJjEuS4xIZ+fK0WJN/SD2GwbLw3iRdsUKuwgqLQb+6//Rr679Mahg91hol+0xP3GsHoJEAF1uD2URCA3upzcJD9Qn6kAb2thQNFYSKEAISBJ1pN9dNw6fM4L2C7/EyWVeBzPpWfdp5UW2ZC2Qzoi2wK9XFzStHbUr2SqQFpO6dwIoIrfPx+ql5T1NgtYem5xKjHmaBy7c8M69IZhjgXGqCdJ/pGb/5v8z7a1zQ1QfkphTzaDyuupwNxb6jCdcJ/eV7T44Tm0kUCdAZX8Kkx55wnlcKtrj/FpJvdFbjZGVc0uaEkAklRuVp33DFxgpZx75IOIpVkZwDfxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 18:29:02 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%2]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 18:29:02 +0000
From: <dan.j.williams@intel.com>
Date: Mon, 15 Sep 2025 11:29:00 -0700
To: Kees Cook <kees@kernel.org>, Jiri Kosina <jkosina@suse.com>
CC: <ksummit@lists.linux.dev>
Message-ID: <68c85aec6deb3_2dc0100d0@dwillia2-mobl4.notmuch>
In-Reply-To: <202509151019.CD7AA0C0BE@keescook>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <202509151019.CD7AA0C0BE@keescook>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e14d656-3b64-49c8-eb04-08ddf485be8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWhKaVZjRzdQem9Cb0gvMi9NQ0p3bFArM3NPeTB0R0JFcWhpbTNkLzVVZW9B?=
 =?utf-8?B?R25KRmhlZWc0MitoRnFUVDZ3bVdSWDZGUmI5a1J4NC9hUFlCNW5BVmxKMDhp?=
 =?utf-8?B?QUk2QnVnbTd2OGduTUpCbThhTGJhRi9tNFZJZFA5WmJzcHM4T0VsWEV6MFBz?=
 =?utf-8?B?SnlEejg4WVhaczdEbS8zUmZ2VmY1TVJpZlhMaXRXYU53SW5UMUQ3WWRnODFw?=
 =?utf-8?B?M3h6M01JQ2tlRDl3ajBmMU1jM1ZCUEVDSC8wM1kxdUN5RGhDYXM3MXo3d3I3?=
 =?utf-8?B?cDdNYlhUNm1XUk5mSUNVT0lOcmFkZUpIc1Z5Z21ibUxmYjQ2cVNrVUJSTVZo?=
 =?utf-8?B?SmlZS04yYkdSbThYd3BEOGxUSjJUanJkYnhESnQ3aUJtQlJ6TjR2KzZoZEFS?=
 =?utf-8?B?NXo1ejhYYllQcWdHc0luL2UyWWJVK2EwTkV3aGE0VVQxTXJmZTlwVDNHVFRa?=
 =?utf-8?B?ZlpjUlhZbVRHUGhiYU53SGFGUXlXZWxBZ1ZnTW1RazUwU2JOWExHRGdSc25v?=
 =?utf-8?B?T0ZaNGZ1T1psdlZEWHFraVpxTDQ5dFJzNnhXWWpJbVU0YitSZHp3TGI1L1BZ?=
 =?utf-8?B?UE5ueWQrQ2ZKQ2QvQXg4UkdFaCs1VjU1OWc0a0tsR3AwYnd4Z1pDVElhWC9X?=
 =?utf-8?B?MG03a200bzdXSjlGWS94eUNmam84Q25BK280ZElRTTR6bkl2UEg0d0FPa24y?=
 =?utf-8?B?b0kxMWVrTVRXaXpEWXhmdHBkR2xRTlB2bWtBMnVXWmc2akg1dmJ4VjNneCtR?=
 =?utf-8?B?dVNLbXRLdE1GWEJsdXU2QzNjckE2LzU0WTJieTZ3TnlQTmVpUHRwTitHUHdt?=
 =?utf-8?B?VW56c3JraVRNdmpVZ1NjckN4YnU3dDdDbWo5TkVKSVhhK0lwRXhVTUdSK0d4?=
 =?utf-8?B?R0dWcE90dWI2aU03UkQzT1dUTmc4cjdFN1YxWUpEWThKeHZxNWZRbUM5SEdm?=
 =?utf-8?B?cmYzR1lIOHZzVkU1RkFkaitBTVhxYzc1bXZlQWFDcUlPK25BOTV6YW9LVGdU?=
 =?utf-8?B?Z2x0bkpIeW50T2JZVVoycmdIeCtjV3F3YjRXTTMwMGZoczUyYTNEMSt3VDZj?=
 =?utf-8?B?TzlDOGhrak9POHFNT29WeG0yWHB3M25FS1h5ejRJeWV3a0ptMzltcEt1TDhx?=
 =?utf-8?B?bGpqYS9IVlFZbW41MjJxeHRkZWRxclJRV0Z4REIzWUw0eFlubGxnUERxZ2FZ?=
 =?utf-8?B?MUp3dnhGZG5qYWIyeVdpYnl2S0hDRW93VlhiUmluL2pJOG9zZjVLVkN4VUNw?=
 =?utf-8?B?TVc0ZzdnYTlUYis4UzRTN2ZGRU5vQVF2RzVtcVBldkNjZzFRVjNZeXp4dmNC?=
 =?utf-8?B?Zzc2dDFTZ1YxV2JTR0Q2NnpQMnhna1JZckJHa1YxMDBVdUtLdTZLdXN2U3la?=
 =?utf-8?B?RlNOTXBsQzV1TCtCc3o1SitLK0NBVkg4MkFEUXRhM3QzUEtBUWpSZnVzMkZn?=
 =?utf-8?B?QU5KZzFIeitKMjlVWlQwTks0ODF2VjVTRlZMQS9nWU9LUFV4cEpubm1SSEt0?=
 =?utf-8?B?Vm1UVFdzSE9wWUJ6RldZbkd2MnBCSGxrZTkxWU50dDQ3dDFvcmxrR2hSckVM?=
 =?utf-8?B?TVIrbFFxeU0vUVd6YjJtUWVwbmJZbUU2NjNKYXFTTFN4L0l2TmhFdW51dEtO?=
 =?utf-8?B?TjRweGJzTUJyZDBpbC93dExETVY3TWY2anVuTkZEd0syVFcydGFJZFVqMFpn?=
 =?utf-8?B?WXp1T2xLWFpMYUt1ZDUrMnp5cGljcUJFQmZhaU9kanI4Wm9mc3ZuQTdudU90?=
 =?utf-8?B?dlZxMTRnQWJqY3JqK2YwY3VjVG5zd0Zja0E0alZRRjRDWklKT2w4RkhKK1pR?=
 =?utf-8?B?QnFxNWdZNHMrYUpvcG1VK1hER3p2eWhhck9GanhhNzFXbWU4T0swb2pUK2k4?=
 =?utf-8?B?d0MyajFVMnA3WkxqeFMxM044c3dRelEwTVFacDlkL0ZCMnNjVkNCMlFjczkr?=
 =?utf-8?Q?lYJQKPqwSCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2hITStSWVJkamZWenZnMTBuT1Q1aERsSE5SMndSSG1jTVpTQUNQYWg5V2k5?=
 =?utf-8?B?YVJTbE1WQ25zRDA3NlgvRGFEZDk4N3g5dGplZnB2d253NWJvK2M4WGJiT2M2?=
 =?utf-8?B?QXFod09HUHZReVNNVXkwV1BjRVlsRnY4SmdHUU14MkF6NCt5bUcwYzRQRDBx?=
 =?utf-8?B?RTZxaFpBTUJzMzYzRGViZ2Z1V2VsY2ZPZC80a2xoNEdGMEI0ZDZHbGpZTDhM?=
 =?utf-8?B?cHdZWUVRN2RTQ1lzTVk3R1AxZEZNSk43azYxQ2twMHcvU3ZKR1lZUXhRUVJF?=
 =?utf-8?B?YVFVZ0d5b1JhQnJGS0huSHYrLzA2bFR4bmRPRlVHOEF4TmpwYmFKUUtuMWM2?=
 =?utf-8?B?VlFjU1BrV1doYjZ3UUFOc2dHc3lQVkx5Z1E1WERocVA3ckUwcWlsa3ptTEsx?=
 =?utf-8?B?VHVmM3lyZ2grZExuRHgySXZlcUNoL29nY0svRGlsekpKZ1RjaUpVc2E1SkYw?=
 =?utf-8?B?cTdMR1dSRVE4OWNQdHdkMWFQV1hQdGoyVzZUemxlLy94SklZUUVIN2Nzd1hZ?=
 =?utf-8?B?cjFuOHJlZ2RDQnBQaTNYcUoxQ3Ntalh2TytPb09xVnBqNmJKN0dVTENuSEZm?=
 =?utf-8?B?QTdUQTV1ajFHRWppN2JCd21oYWN4TUdEOWxKWU1DL3NjL2MrUUxDN0dVR25l?=
 =?utf-8?B?VWh6OHdMblQwSDdqSlkvL2FNKyt6b0RRMjlmaVlIU3c2RThxZTdTU3R0TWs2?=
 =?utf-8?B?QlhEd3VjMVI2RGNralhJQ3VmTmdOK3lDSTA3N0dEU0c2Q05TbFBNalFBOHpL?=
 =?utf-8?B?MnJpQU9BNEVQZHBzNHNLSFdNb3pNZnVzbmlzNzdocWJYQXFiNWN2Rk5SUUFr?=
 =?utf-8?B?bkU3b2JwSnVDVXpiS0JVWTl6Sm5sQkx5cmZWOTluR1AvcktsbGlObllWdUIv?=
 =?utf-8?B?eWVwZ1BKTzdsK3FRQU5sQU1ISDV1QUZudk5YV0Noc3liZVdaT1dBVUFmbkRT?=
 =?utf-8?B?TzFJZW1ncWtGQys4bkZNQ0U0ZW5mUVN3ZnhVZHRiN1krbG1kWlJxR29TdVln?=
 =?utf-8?B?dk5QbCtwZlFzVHBPd1dzay9xSlIzTVNSRUZxRVlBMDV4VXhmVWlvSjd0RWlO?=
 =?utf-8?B?ZVFiTzJrbjZpL0lwcTdwekxpL3RDTURnMjFXRXp3MDQ2d211YWlwTjBTMENZ?=
 =?utf-8?B?alRSdUYzRzRCYldTYWJqeGkrNWI2U3h0WDNqLzhkRGhQRjdBcW0rSFBVamRY?=
 =?utf-8?B?Qk1tOW1tUE1uOUxJbmczUDBCdTZ5QUNVVTRiZ1c0MjVOVWVoUlZPeWY1Tzcr?=
 =?utf-8?B?UGFpM1Q3b0M3bjd0alJLbExON0JFYVFYTjFwOWZSVlEyWjZ2TUJiUVhEWGdC?=
 =?utf-8?B?TTA2bVE0RHlJOVdqSEV6bkFDcWNHN0QyU1JnM0xnaVFFN1hJS0pySXBOVmRE?=
 =?utf-8?B?MjZHZFdsQXBnWU5kOTZ5Y2ZVUkZvaVYzRXl6SDJSZHkwbk8rVkppUnpyU1Fq?=
 =?utf-8?B?NVNJalI1RnNFSjhrN2R1aERFVTZBc1hpeFZNNnJ5UjBYc2Nmb3F2cm1Wa01i?=
 =?utf-8?B?VTY5emxHZTBwWGRZcVdiRUczcWtMUkdkZHJRRzVocnBFUW9wbXdFKzQ1ajli?=
 =?utf-8?B?cWkyZkx3aE1zbkYzT2xYYTRKUHViTVprM2x1S3JrUmtDQXdpdmtqUlZ4ZS91?=
 =?utf-8?B?cHFOemdUcnphNUFkNGNWMEdQb21aaDNuZlllbVpSRFJTUVh1T2ppeXBlbmIy?=
 =?utf-8?B?bk04N2JXbVZKWldVY09sbFFFYWJaLzdXUDVyZVBWdTNoT1ZsWDZUb1diblpt?=
 =?utf-8?B?bkw5UEZwMkRtNXZmUmQ1MkdJTGJZbTM5aG1jQUFYVlFqdjZ6aFdOMnN4alRC?=
 =?utf-8?B?WDV5VS9XYTFTZDNycG9DNjVNODNWUFlqSzlXQ0hyY25tVlVESTFYV21PWDMz?=
 =?utf-8?B?T2RJWDA1bzkva1BCSnlpd1BNV3NiZFJiTFhDdDluYzJhY0ErSWZzSWx3aXJQ?=
 =?utf-8?B?Um1nN05EUUZDYTRSbnFXd3NsWC9UMFA0UkZYZzFESWU3SUhNNDhHd0kzQ1V1?=
 =?utf-8?B?a2tJZ0R1RmhaaXV4UEkxZW1RL00rVERTbVhSbVFWZTZadXZ4anJPNEhSbDE3?=
 =?utf-8?B?cjgzcU9sM21ZcjdkcldVZWRXMHZtS0REbDhmMnlDZng0VWJvYmF1Q0NpcDR3?=
 =?utf-8?B?bFVWb2VhdUZ5bHRoWUxqbHIwenorMEtwZ1o3cldOWFlXSzQzMkFrc291WVVZ?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e14d656-3b64-49c8-eb04-08ddf485be8e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 18:29:02.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIUm8y1O84BjhZtxALl1nrxv/0phi6V7/Nl32MDKAjRyYMw/LUo6FYkm9QRHt6wLO2mJJ4pe7sniNwlvkHtHkg6zlGIXCbPn8M2gPLxqK7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
X-OriginatorOrg: intel.com

Kees Cook wrote:
> On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
[..]
> It seems like a "show your work" approach for commit logs would be
> valuable regardless of tools involved. I've been struggling to find a
> short way to describe this, though. Initially I thought we wanted to
> ask "Why is this contribution correct?" but we actually already expect
> that to be answered in the commit log. We want something more specific,
> like "How did you construct this solution?" But that is unlikely to be
> distilled into a trailer tag.

Is this something more than "declare assumptions and tradeoffs"? One of
the trust smells of a patchset is understanding earnest alternatives,
and the author's willingness to entertain alternatives.

If a submitter is not prepared to to argue *against* the patch being
included in its current form, then that can indicate more homework is
needed.

