Return-Path: <ksummit+bounces-1040-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 053BC783716
	for <lists@lfdr.de>; Tue, 22 Aug 2023 02:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7CD4280F9F
	for <lists@lfdr.de>; Tue, 22 Aug 2023 00:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1DF10EB;
	Tue, 22 Aug 2023 00:43:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEDCEA5
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 00:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692665017; x=1724201017;
  h=date:from:to:subject:message-id:mime-version;
  bh=4z9p7YIXz7iDvZUUPd7L7+mkAYkxHN/WZQJvrKuBERk=;
  b=gbMq+cbuD6H2RkMFHDuIgDkF/DfaZAAEXeod3Soz/vuQsmZw3EzrQyyg
   YYeU3gBC23wuwZNfmyMovvGymTM/ghdRQVH0gLYIvDBuiERjRy8JP8O34
   p74lJvecY440JLMqw25PVKO7+Vm3DKv2DsHOABP8uX1JVeT96HzZkgDAZ
   fcASl9fCcoahA5dzDkvOAmgtZwYxgMDgedtw1hiince76DjnYQuR4UplN
   +uRFoc61G6+7Gt90AvUmp4pEYTd/P9B1FChKSYmok4/GqkYn7/9vDMCGi
   aB775vY8QNjkjKbwNmrBznzGjPJL0zDncKmLhOFMo79QoSRlymx4Lm8bz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377494710"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="377494710"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 17:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982674927"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="982674927"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2023 17:43:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 17:43:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 17:43:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 17:43:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dINrZJG/4bfaVG2efVJ6q6n9RdXd9qJ/q7Z3tvvTsJow0CGCuC+jeWAMaDflB0NdIoDbL3XdlkPX6pz6RQF+3/2eI3TFCh2e4cUfkuZ4OMLeCydXqW4AKj33o5a4zVl9/6YNYKO3qHJ9ySD2BqLX1qJiC/qtI1Knil6JzvgIcLSYFc5uIoRPJ0GTDlNer484UApyPf52PoFGazJkOB1e2tFsfAfcf6F9889xQZGZbRhZSJgpjnku+pGOArZDq58mHQ40gk6J37HpigxmaAkdKGXU5JbSuG8NchEQlE9Xs32sSeF/h0ampsksywRYBF2i5DJkTUwAB8Pnp2OLcjWFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60/yT0IIyfTkRcRRfsySKoaOrHHOV5rgFJuK54/G3IM=;
 b=TmLPK12Y2/Q2sCNEt/Ri40uRcAI2BCDp6O7OwB6wEVNLMN90ZvV0woSlupp4Aa2OI3qwGZXJbmYYUol1IRpZ1sFO5gf9swvO7QwWMbK2/gZWhfZrLEjuD/y1oeeWRFCWVq2rJknPaX/xfg6Pr0ZI/YUr/fhE1l6bu2driGeDfKjjq/uvhKV7V948I2ssegonXIbjzTKhvsZMEnwI7YeC+kKIwitgy4qmXtDVfFbfI1NG+jjrVT8uy7fZxsPPltdt2ancXnbdCcwzW2gWJvAVN3HbH3GECS9B8QOK/iM1XZ8wmroGv38GVRpbTU1CyAtKK6C7X/pnYTEd0joQMnsizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 00:43:33 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992%5]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 00:43:32 +0000
Date: Mon, 21 Aug 2023 17:43:21 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: <ksummit@lists.linux.dev>
Subject: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Message-ID: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: 5652402f-4fd5-4fac-3b0b-08dba2a8cf3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MnPTIrpyE0t84XgPH+vIJbvN0LqB39FvAL+7MSHYtWUrQEkyFyIZg0WVMq1H0l3VRxCYsql35RnXJBpSt4psbglql0UdsuBoFTui9glJI35FVUC7IBnI6RE/gu2yk3ufLBE2zHNZFm12XN0RSL3y/Q9y3+AJ929msDdo+9bhN5BjS4DSFihsAEpH933VYenf1kFV7AyVwwMYWb5C3gl8vtaET5afgt2Fw/z7gfpS7T1ucucta1Ys+LU33QmhXO9qQxLClEjbKBmRFs3kzNZrta5o3qtOmRyE0iRAL2ZGGJUomRrPZZhBKl1HsVfDOe7k1+N6bXMJUUvKGrypHbRx86KYxQZkTZFyxsI/vX9A/WxqC2pVUjAzhNALQE1rpP5CJxisMYOhZXp1Sj7w8NrxkO6wo4zNN2AUWRS6cCjmTd0ifZ8wEb1cDWWiVMkxK1DIWUEz4zObvRbg7SB6tFzoanMnVdPt9QAsctiM1WWziGzyuOfgqBm5EaOmCCp52Q7jbaTc69lJy/4ZlhqKoaXfktQl5f4cz6ZEokJAm9XYpG1LduhDt6VzprkO2zLY5YL/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(6916009)(66476007)(66556008)(9686003)(316002)(6512007)(66946007)(82960400001)(8676002)(8936002)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(83380400001)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EkWazfb3ce/AO7A+VHsnMsmdRyFovY2qJ5EdA27p3EJhZwVt2h/2QyP+EEyh?=
 =?us-ascii?Q?LUHBeVakUCdiMbP/bGs6dpFbKJVKcUPTyHOP1Rtx61fxY//+bpTtgUuUnkPV?=
 =?us-ascii?Q?vEyOJnnvYDmagK05YMy+bXJAqr60PhUbuJ50+AFtL8yFjuvzUbkl/OHIez/C?=
 =?us-ascii?Q?n87pTofPENjvmftcL/6tkFBSEufuvv4buCW+14xCbMNEcbaDWrJH+jpEAsYI?=
 =?us-ascii?Q?f+oZea0dyTyEDVOJGTPXgQ7t8lbzNDgnz2PWVK6/t/0j2QYmnGXmu9cHLlaC?=
 =?us-ascii?Q?yhLos1TocxWwSWqcwIovqLGZvcYdUSLwxhYXXwIY7yxGNB/DDzEMnp5/IcLu?=
 =?us-ascii?Q?0gtNWcqJKrV1Ltjmtwn1uCUwIYCG6IRWKbcM30dWsocyT8L6XJHeJgR/sgAH?=
 =?us-ascii?Q?wE0jxGEupCOcTmDF9dtwULdB94DmLppFPJJ7vBTe1rKtVAqwH1YrPhNSxxrj?=
 =?us-ascii?Q?Uo3xJCXQQtOsKVEeIs+CcOJ+6bFrK6bDlnQkr4oun1yd6aRq1oJzDfTeEEdq?=
 =?us-ascii?Q?OikRD4syO3p+l4Zt6n+1f+zA9UCPVAiI37y9fjtDBfh+HKlgukg4H3f6iEnO?=
 =?us-ascii?Q?fCKO/N+QNvFAbR2kFFuCSm0NAKI5def+qwu8XmnmQycZ+IUosV/sy+QniDud?=
 =?us-ascii?Q?cs5qKQRMa7MJwNCuLcNiKiMZUSWZ/KyhyoemjQBlH1JqnTOsDtbYAkeNXUI/?=
 =?us-ascii?Q?siB54n++zTg6+6U9bDnHjnFyEnIQiNVHdM13q3WQH/JdQ8lbbgyzxubRdfrl?=
 =?us-ascii?Q?DwBNa5sagYrQZbpyjSk9Hj3u3PPsXNudONh7notcVV9ixvVoj+u22JdUZgRp?=
 =?us-ascii?Q?fWNJc597E+5XK+3qw8T63rufupzwlqXwO6mfYLbjeZOXQ4hoFH/xzRRhK3o/?=
 =?us-ascii?Q?b8B07egeEMqmkBnaQxILIxwAD5uYSnYIKlp1BznddC9uaH6ocw5RWZ7XC6/D?=
 =?us-ascii?Q?BDJBWe1VzfolPFBzUvDsObxky+cjl6Ge9aiibW6sQW7hycmSJuQokyMHK40I?=
 =?us-ascii?Q?fhuGcstImEZmgViU46xbVa4mhjfTxrhfy/oUee9tSkFpaq4FS1/aIMhdBMvD?=
 =?us-ascii?Q?6SCB82UsDjJsE6BKzLADsumehY3YWgxxbwnfVPK5ksyqfNptOntmrvM/4DTb?=
 =?us-ascii?Q?oivoc4VfSNSWdFBubvit1AAO29lmV7PFMmI4lgTxgscz1ujfb3d0aeCTZjqi?=
 =?us-ascii?Q?0f+Z7asbqZekekZJ7HXHf3AJMmQg2jRGssGLx6q070ZnoDeJiLBV8aYRLweI?=
 =?us-ascii?Q?4J8eme0kJMY6rruaCSSi91PIjNuNlEtZJKmNT8bVGpPP2dP3/ADK0OtD1+yo?=
 =?us-ascii?Q?lc9IXb/yv8dscDkOI4Pwl5jvRyqNKNPvdvqThsVPpDvmsxlhegO1VU2QcKPy?=
 =?us-ascii?Q?oiRgROWNNBJosOYakIajTCYoi7op0gtMezziXZ9ukgJtQhDJZqhDbMyKl61L?=
 =?us-ascii?Q?OwmFdgZavKqu8orfX43luEvYHaHaLW+LeHzPWoNuu5X/a5b+Ap/bHKDUG64l?=
 =?us-ascii?Q?MTO4gkfylFP1/Uu1hiUDGpr6t1SxHeF5wnMO09Y+z30/gepnKTTL3rXNBlIT?=
 =?us-ascii?Q?yJ7ZgOKQZQ7EK2m1iRowgfgSzAb5jyuPR0ki94bJNvcOY9d0Xb4tKzC71df5?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5652402f-4fd5-4fac-3b0b-08dba2a8cf3e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 00:43:32.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhHVeV5/pHR1oXCBuE6S87FIr/aDwi8jUE6Z+CbBx+grrr3Q/8xki8JkZnJTuX4hOHHFTh/giql0vGPtj6AA6vi6EhSSzuKEqkVYNbizCJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
X-OriginatorOrg: intel.com

This topic shares some aspects with other proposals around maintainer /
contributor stress management, but with a particular focus on current
hardware enabling dynamics.

The observation is that silicon complexity continues an inexorable climb
as functional and performance enhancements literally push the boundaries
our current kernel-user API contracts. Proposals like "offload this to
hardware...", "route that security concern through this mechanism...",
"migrate that application to this resource..." are increasingly less
isolated to self-contained drivers and more likely to have
cross-subsystem implications.

Standardization helps, but there is often a "system-software
implementation-specific" gap that a standard leaves for an operating
system to resolve. Linux is nowadays a first mover, and a primary
deployment target. In that role it is unable to benefit from other
operating system vendors to close that implementation-specific gap and
put a bounding box around hardware vendor differentiation. As always the
only tool Linux has at its disposal to manage those concerns is upstream
code acceptance.

When expectations are mishandled a contributor can find themselves
squeezed between program management and upstream maintainer skepticism.
That friction burns community resources in multiple directions. It is
also a false choice. A contributor's role is to partner with the
maintainer and other hardware vendors of similar functionality to arrive
at a solution that maximizes maintainability. Schedule is important, but
second to maintainability / cross-vendor-scalability.

I perceive a trap where upstream design decisions start to bias towards
expediency rather than maintainability. The theme of the discussion for
maintainer summit is questions like, but not limited to:

- When do vendors need to share a common ABI?
- How well is our "community consensus" protocol working to give
  contributors actionable feedback?
- Is there more we can do to enable contributors to steer the right path
  out of the expediency vs maintainability trap?

"Confidential Computing" is an example of an area with several
cross-silicon-vendor implementations that continue to add features with
a steady stream of upstream design decisions that cross multiple
subsystems.

