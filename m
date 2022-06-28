Return-Path: <ksummit+bounces-738-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0955E5E0
	for <lists@lfdr.de>; Tue, 28 Jun 2022 18:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C0A0280C87
	for <lists@lfdr.de>; Tue, 28 Jun 2022 16:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5E33C36;
	Tue, 28 Jun 2022 16:13:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184633C05
	for <ksummit@lists.linux.dev>; Tue, 28 Jun 2022 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656432816; x=1687968816;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NvBdJyzB/qcbg+0etaa87FJaYVpLtbV9M68AWFVXIG8=;
  b=XeGXdwUwS4Fw71Kcx/IXQk2NolFyC8esm0H2W/hkhrjDXvf4MNlZgGBq
   s1zZ8ScO9g8OFPoqj8Ijj1IzKggAD1l0ZGEcGR9Ez0PRy6HmNmEx2AJFv
   JlBHSNgLEZA/C1GJzLISmNII78nggnDf/iVpI/c0Ab4bRsS+j6vQeNv//
   OOGzqJgjiQqgA6y8E0vLiMJQwEB7Z8BHnndifD9A08NVhoT87OjenCE5P
   bOXMM/N/L8hITuSVMl7chKi1BR2HTQyzAk4FWxUtJu8uzf49/dvP7txh9
   DOusn4xvTkNkB8wLzMpMOIcK2jC4r0qEpg8xHiILWScI01PMdYVjeoK3B
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="368097427"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="368097427"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 09:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="594853925"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jun 2022 09:13:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 09:13:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 09:13:34 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2308.027;
 Tue, 28 Jun 2022 09:13:34 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Liam Howlett <liam.howlett@oracle.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet
	<corbet@lwn.net>, "Nikula, Jani" <jani.nikula@intel.com>, ksummit
	<ksummit-discuss@lists.linuxfoundation.org>, "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>, Markus Heiser <markus.heiser@darmarit.de>
Subject: RE: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
Thread-Topic: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Thread-Index: AQHYgozYy0u0d/noLUa4DONWFTmKG61VSfyAgAfqwgCAAArigIAAPkyAgAErnoCAAQJkAIAAqyWAgABRCgCAAEYqAIAA5iYAgAAg4wCAAfAWAIABKOsg
Date: Tue, 28 Jun 2022 16:13:34 +0000
Message-ID: <f06dfbfd5c7b4be99b5e8ede4e15307a@intel.com>
References: <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
 <87tu891xfv.fsf@meer.lwn.net> <20220625101029.67f14c4c@sal.lan>
 <87czew267z.fsf@meer.lwn.net>
 <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
 <20220626085524.42ee92c0@sal.lan> <20220626105306.122cdeda@sal.lan>
 <20220627152832.yigreu5ztnoxfp4g@revolver>
In-Reply-To: <20220627152832.yigreu5ztnoxfp4g@revolver>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

>> On my notebook (i5-10210U), the above takes ~8 seconds to run. So, it=20
>> won't make much difference at the build time, and doing that would have
>> avoided ~100 warnings during htmldocs build against current linux-next.
>>=20
>
> Couldn't we add this to the build bots and ask the authors to fix the
> commits?

I poked the zero-day bot owners. They are looking into it.

Reminder that the zero-day folks are open to suggestions on how to
improve coverage.  Just ping me or Dave Hansen and we can pass
on requests.

-Tony

