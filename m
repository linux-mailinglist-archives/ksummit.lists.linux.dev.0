Return-Path: <ksummit+bounces-2112-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B820CB217CC
	for <lists@lfdr.de>; Mon, 11 Aug 2025 23:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A8A81A21078
	for <lists@lfdr.de>; Mon, 11 Aug 2025 21:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1688A2E4249;
	Mon, 11 Aug 2025 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWLGoNkK"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF072E3B17
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754949457; cv=fail; b=pxTR/ykqrZDMpB3eO/aLcXzToZG+c6mDkJGqR1lollxCuZbsHRrBsPZxB8xELs+eoppHpXgI961xvIAr0svX3vqHTtijOCGpBqTpB4ZPQinVwFtpGTL1c/h8iOBPJlbvoBsfA+Bq0lgszhDbJg1JzYE06VAFQmZteajBP2uKfbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754949457; c=relaxed/simple;
	bh=jmufZyPvUpyNomGj7KAqF2tXgfR2Dd2DwCeBRNQr2GA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y+QZ7iGM+CHqGYBKp7C3M8ZkVyoYYu2p6imbdKRjvj87WG+2QW9vFWC2bJnD8D8DXV8D5S/X7RofCV4X7cfiztlrSAtWdm9uMgdMHShIeIw7DiVCsxu5YjU7VFlEZHtyVpL8De6K7450DQLKfMxrQaFX1hPRQdQJ5EstPR7Dm4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWLGoNkK; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754949455; x=1786485455;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jmufZyPvUpyNomGj7KAqF2tXgfR2Dd2DwCeBRNQr2GA=;
  b=lWLGoNkKtKgF43FHcANa5NIOzG5GkVkdZaKJO405cpGAZuV60eSmMd11
   K8ll8HzAH/dfhieJerJNsIoV58QF12/aBkaPxEBgWl+kkh2cHy5lJL08T
   uWiIk0b6yoqLuT9Hd/r89gVG2BKP0xlBYiFhksEViBViXdP9Xq+zKihuW
   C+xr2HC4AJ3FxCjUJ/VLgu7g47rGOYdTaAYm/FKGV5JDTlIOl0mMo+SF0
   C4jS19AWICWrjoltg8rX183z7bvCXaGFLEdSKPqXqiTqFxuwrwj0v5HAN
   YvrsFmPRE5r7CQpvh7NxtzlgiFPDFlJ3HqSSjK/1EH+nUW2Ki3UM28u2R
   g==;
X-CSE-ConnectionGUID: G+LTOoqjR/O+fXPanZvnhg==
X-CSE-MsgGUID: yxzr1NPtQMKqkSDuJTEp1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57115899"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57115899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 14:57:34 -0700
X-CSE-ConnectionGUID: XepteaEjQqy/ZoFiAJIriw==
X-CSE-MsgGUID: pmNONhJ+SRS/mnShfNbwrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="171374035"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 14:57:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:57:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 14:57:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 11 Aug 2025 14:57:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTivPZuL3NfZGKcWvQpvIk7zpJ9LdADslntmJVM4FN0NwpbgvHQjAvNm9XfYwAmhlyjTJXlnKeuCxNeFzqvqs95aLj10XbmCbsLjEECCfFQ3BSSLpcdqJS3YoFTDfXxX8z/YDJNSfWe8MvPms3DzYrgDN4i0RtCRkpHRUlcJeiqxhY248eVIJwVuaY0XXERW0iRmy6vu3gLwJLp8rr++BoBNwySKCvARANwD6R4QKldwpaadx8Iy4QqOYDD1t6Z+Wwoqfy0Vs1WsNGlciJF1VdV4CdBdq8vtAU/0HdyuhPhstvaUPbGSIhPNFgcYqTey4b/xLVfhrN4kbHuYB617iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=110rS/MSWY4Lo5NiEErQ9aADc3jq0nq6uq9K6GfmZrY=;
 b=W9nCg/SIY9zVHYNhPSzOvXgtjVms1GpOQBp0J5WkEkyxALfeHkpMPZd8npCJBKHjDmHfWULCbkwDf/ChGbDzLDyXWI1HUNuTVasA/LQJtrqIKMNpUmL62nA+N0omdYGuY7uynRjkybPCnGZxU9tiTFGnQhVvAtl5y4MTuL1MVPgdqKn/Ji7GYTIofxy8gKO8NDBupOp0fNyehtL0X9jQi4g+c0M5JPzHPF3Dy5vNavIQPf5TcXH9wPM+ew8CcEZdekn3emUR2d9BsViXJRw2UOZgffRoBRmSDHEYvqQgJgAouJwdpPvzVpSeHfCvs8yKsvlc5WACMO5RpMcue7CmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Mon, 11 Aug
 2025 21:57:31 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 21:57:31 +0000
Date: Mon, 11 Aug 2025 14:57:30 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <aJpnStlxDUsGNPuA@agluck-desk3>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
X-ClientProxiedBy: BYAPR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:a03:100::41) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 977b3150-aaef-4ad4-a882-08ddd9221243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rnodTdZi+aA6pUV1+b4jLmDgPqIv7NiZM43/YFu9/sujcEguc8Lm0AUW+WCj?=
 =?us-ascii?Q?YfKYvE25KeklJs0J5K5AmJHV14hwb4rB2Aoov/xacW8gFsxfrmQVHFcoHdoQ?=
 =?us-ascii?Q?COSlw+eWdKn4naofcZM6+ZQVu/0Kxnl7kLPR4kBr3xWcYsTWS34mikMin/Qu?=
 =?us-ascii?Q?ZnR24FrGwST9eVHBsTZHBnee1Oz7EBZqMvT2S12vnrS1ta0w0Y6BOvu4FGJQ?=
 =?us-ascii?Q?sJDfO8Nb2EowwlM9Z1gR0JfcAVZJpVtoFUhWpGVNxKb8PzKcOCjJ70/pVv+F?=
 =?us-ascii?Q?sdG54qUKV7ayaMxvy+4i+lVCzjPzY6CyrDE09v7HrxXc8OXLkWNQBCVuSBt2?=
 =?us-ascii?Q?wA7j/qznHOrbxln/eE/vWdJUSuXcEyW3LarsLZsOGm2IRerte7NSXcsYhEFh?=
 =?us-ascii?Q?4ZZy3eU4MfaJpXesIZTHcQOqI1MlR0cGntYQz1DpTphjd2gSGwRvgCswkobo?=
 =?us-ascii?Q?kNDVhwR6VPH2ajwpvPxp57fJjo3BLjI5xp54ikyMPe9D9T8dkDcXxXoOjw6R?=
 =?us-ascii?Q?8uO9xGtlIaTqc/Vp7Y2ndG7k4A+x1eOS7UnXfUTkH5LJA1gV/2mVx4lz6pz4?=
 =?us-ascii?Q?F5bv46ZhSDZ2W2Gq3rkBappV8DkXvSsL3HKtBQPEUPw4FRniD50yJ6X8SqIy?=
 =?us-ascii?Q?gSxVdCS12Dv/QFPFqubDZGaEb9clLxf5YhiY/4d1AkENgX+5/0qp77dJWNhY?=
 =?us-ascii?Q?aJEqpB6ptuBfECvqizf6we7k0Dn5kQjSKc1hWDFyHab9p87VYBm6QVBs2nc+?=
 =?us-ascii?Q?6nMVER1J9NgjUi2RgnLj9bt90eVdqtqCxFwzD+pGykD7NgnRArHA8rxu0LOu?=
 =?us-ascii?Q?TA3pPZEoFfYkhAlq50FzFZcinpRs9D6hYzu4/3Ae58HEtaBwmslau5vo+dUG?=
 =?us-ascii?Q?7m9AJ/jH1NandGQ8BPBYsFN3kHAiAk4XPchAXzR64WheDHdbGhWsr41jBr2Q?=
 =?us-ascii?Q?1/d7DfAMphQkw8wHbBLKoE83jQ88GN7oNdAEYoWRwycjrvKfHRZkvlyR6M1E?=
 =?us-ascii?Q?QVKo3mloeaCtI30gBzHDdWKKphR1ocNjzY9isY8px1GRzyUABVvKNwse+Rz/?=
 =?us-ascii?Q?DsqxEZr9WUcPzAmsc9AdnbeXsJaJcHvHRvn6EH3jB93mlcytlOCwGQmVdbDx?=
 =?us-ascii?Q?NdutcRGmD4j5sU1V0zMYJlXSoFH5VNpnEmHC1eDawvrJGACWbXAkn3jaBTlo?=
 =?us-ascii?Q?+JeENr09iFmn6jeudgV/1eKYjf0RgObNSaPrewR3UKXk6FB+LQFIHiCria98?=
 =?us-ascii?Q?/IuVcEGKEpe+I+sSB6C0QtNRh1Gee5RHovgzMKqusmZ813iKI9NWk8LcF1lO?=
 =?us-ascii?Q?mPDvhBTxgBVebCPASCviE+yq/jPmH0oJADNudUjio9rKSQn+ut40cPOzb3RL?=
 =?us-ascii?Q?AkdBXxXRfR87Lc0Z5InB2tk5lwH10AjKOKtDq3rhX95R8KqNHyUTeekXJeEZ?=
 =?us-ascii?Q?pH4XLpAScCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+L+0iIk5KNQBv6BSjDVmdGgnuKzyySvyWyqzXd4u3Ps40fe1y/HYVxxdazu?=
 =?us-ascii?Q?OgDDMWnT2aAwJU2WWnfScz+xdnRqTb9A/8xfRS6esNdNStFCGNaqB41oIxDJ?=
 =?us-ascii?Q?7tnWaAsz59vtWSKo3Vu/MAmJ6x9L0bgpA64+VmlOZFd640szsL6iR96b+C0a?=
 =?us-ascii?Q?kj9YeGx+OT2Lvt5NdIquhgA/7IROoSDi3GA+b4y/wuPuWHZwwrmcRxanQtvA?=
 =?us-ascii?Q?w7nmS7VPloLyjcviCIFLMIVORCRs9NVUsmQrRiVHh4y6ToV5GASA8AxFHWWV?=
 =?us-ascii?Q?7erFc538UWnaKGHdN8tYW+1WuN1HZEnCjH/8lWRYC1qRE6+gWHnQgvYUkuTq?=
 =?us-ascii?Q?9ROBJEjpcY85+n6z7vUdN/aZIIW0QqTck/+5zJFLUtkuxB5xBFp2EPHaF2n/?=
 =?us-ascii?Q?XsT/fowMwNK8POwSs6N1Ix4nOOi5X89qYYctE+Bw84g9n49FDODjs6hvMUSr?=
 =?us-ascii?Q?++Ji6Gs+6tycs1cdDnG1yLj0Wv3ug7h3z+0b5f7+cDQ3ngCbqEJ0zJITNzb/?=
 =?us-ascii?Q?p6a33moQ+laO7x+DowydDqM5Fsi1iygP221xCtYw3KW10W1X981Lr0pYsNyi?=
 =?us-ascii?Q?iKZ6zPMJl3mq+BbJKPXIRyt3BBPH1DsA3tCnmhZaAdspC+ud528akU2cNn4A?=
 =?us-ascii?Q?sH6xBm8pLi2VKP5IbItCpFvlVybu3yzavH0pgguBVe35KghTwxU00X4/4d8g?=
 =?us-ascii?Q?2ha9qBrimjuBWQkq72dQa3Ty5T0hH6CPQ62Bvs78wMdTwRpMaESFzMSqXI1i?=
 =?us-ascii?Q?7e9TWUsgQWRSam24vtlP19BeoxURs5162tecIno3PBDD6RVYzReUE1L7pFb5?=
 =?us-ascii?Q?MFSvM17yoVPlxcO6EYb7UlNK5PbvkeQkkYZESh8NryCq0rfumLYL5BKTKc7m?=
 =?us-ascii?Q?NXiWXe2116947TbN4iVAUdTPqeDWya6movF+kT1nQSbA5R+AmIexuXFFn8HU?=
 =?us-ascii?Q?rkGnKF0e5A0/HavjS3g65j0OxyXOnG8IMwlKIw3SM7S59GXrXQ7jxu/EuEu1?=
 =?us-ascii?Q?xGsluKoejl1ocj/bH7V96EK7OJZPI3WSGqkew+ZQxv2McV/b0ERqSCtVtYlS?=
 =?us-ascii?Q?cDOayjBemttqF/bC+HLDTe6vi8OCOUdawcNyKFwXUprA+txLdDDKglygQOu5?=
 =?us-ascii?Q?mx1KGDsPqV+Kyktp/PiblSiWPAQNfMJkgQVGCcgf+7JNzcQokSuIvXFRHYXy?=
 =?us-ascii?Q?aOi01SGdkBXx3KVtEWOS627poMuGpRXK/CS248V9bAIjB2c6iZEAVaF0wYqI?=
 =?us-ascii?Q?zcqQX6KDklYvhnxdgtdXFpFrDdQ9E3ZT1GhN/hGTKdpmoBj3n14UpqIrTIMT?=
 =?us-ascii?Q?239wp3Zm7pNDvFw+DTT4fiOhexme1WgdywtwY2LEdrttZTq2blSnr9ijPyI8?=
 =?us-ascii?Q?kmZTXhTQdeR+Cqkz/lEEhVXxruK5Q8wQyreedmjaPlAiTWQULN0Peymcs6jm?=
 =?us-ascii?Q?HIBiKoW766LaImPv5W1n3DecJzzPft18ux+Hqhn9xOku34mTs8zwGQeTqgsz?=
 =?us-ascii?Q?KVyaZMUJjGhf/9pDFuqBUXojNiHPcbGYbSkr9lJql2m5cn1argaMu/+nS5ma?=
 =?us-ascii?Q?WcIhdfPWkO6hut3YI7aU1A8Ls0NF2rRB4JZfVyL7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 977b3150-aaef-4ad4-a882-08ddd9221243
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:57:31.6221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOiYguXThsEVtDIqJ3enFYZegcBx4EbdOtb+vtSGi3+14XP8miEPGxFcxKh11gVtQg5AzVcvWnu1t400653p3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
X-OriginatorOrg: intel.com

On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:
> On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
> > On 05/08/2025 19:50, Sasha Levin wrote:
> > With AI you do not have to even write it. It will hallucinate, create
> > some sort of C code and you just send it. No need to compile it even!
> 
> Completely agreed, and furthermore, depending on how that AI was
> trained, those using that AI's output might have some difficulty meeting
> the requirements of the second portion of clause (a) of Developer's
> Certificate of Origin (DCO) 1.1: "I have the right to submit it under
> the open source license indicated in the file".

Should the rules be:

1) No submissions directly from an AI agent. The From: line must
always refer to a human.

2) The human on the From: line takes full responsibilty for the
contents of the patch. If it is garbage, or broken in some way
there's no fall back on the "but AI wrote that bit".

-Tony

