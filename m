Return-Path: <ksummit+bounces-2271-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352AB3FFE8
	for <lists@lfdr.de>; Tue,  2 Sep 2025 14:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44C1454459D
	for <lists@lfdr.de>; Tue,  2 Sep 2025 12:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B01C303C97;
	Tue,  2 Sep 2025 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYvGBAw+"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF752FB96F
	for <ksummit@lists.linux.dev>; Tue,  2 Sep 2025 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814882; cv=none; b=sdhjGe8zGYgZkni4ORspRXjKinHNXJB9JpGCFd84sucQPJFfrLZofhFy30yf9eg27dkJMCt43qMRhF04GLAsEZEctjNvconwCMBrYvuVhLyUbv944NWYKECDmMrrm1n0cqWiVOYJtNWYQtG6rV+rRKptqM6r4C71IKuqCXQCpVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814882; c=relaxed/simple;
	bh=4FgFqfVYgIlwJZcydoRWP4GAfQKLVmysTzp0TIuTSqw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ScIIZtMDF9u7xdF38V5WuHfq1BdeZjFKDxoMINRPPs4bWn6zWJ/RUEdwziq8VfmIgG7ZuT9S3ZZ/prukYr4q0kIxHDlMIRbHtjd8BA0r0PQ13Y+Gbl4oElzb7XKZR17Geb9F6bnwlTtACJnqB9Ijmqia8zkHzP1Z14o9olObEsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYvGBAw+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756814881; x=1788350881;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=4FgFqfVYgIlwJZcydoRWP4GAfQKLVmysTzp0TIuTSqw=;
  b=CYvGBAw+xa6bXiYhqXaEtphC8aNXzd0nZo6DpKQMMnI2XUnsUHyYT7Nc
   hnRbZ3ivVomaFP8cDX7NkksGY9+x/Lby/49ijeLfE6pasilMiDzk4nx8D
   4P+Wy8fgkaYGO1t5KYIUWdlqiJw3Ed1zAJDjkKELnbgRDUGSNEyGNdKP4
   LJycdNesNVGETaoDKVhnzEfQQrgPtMRl7R56hY3Zw87fFa/GV93rTOMtO
   gTDGQQWD7HlEZi62NBw8SedaJv6Dv4n7p2ZihQb47sAccvz2GD0F2HJDf
   LH9PEjcBf3pp7hzh8H1sXuMxcKSzpjwE6cwNc3kdoFLH85r9nu4qDOPvc
   A==;
X-CSE-ConnectionGUID: oAm0dtA6RdW6NqV8DeziDA==
X-CSE-MsgGUID: PhTPwt2WTpS6eB96GpctwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59223717"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59223717"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:08:00 -0700
X-CSE-ConnectionGUID: Sb9r9EStTw6iLGxLjk5SnA==
X-CSE-MsgGUID: ESCFPc88Rrmuscv706dCCg==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.193])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:07:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250902135521.51482530@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
 <bff2c47623a632609d07f8f2d237d0b40722c2c1@intel.com>
 <20250902135521.51482530@foz.lan>
Date: Tue, 02 Sep 2025 15:07:53 +0300
Message-ID: <d9e917d57be113a3de06dfb099c55bf428be6e33@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 02 Sep 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Em Tue, 02 Sep 2025 13:42:45 +0300
> Jani Nikula <jani.nikula@intel.com> escreveu:
>
>> On Mon, 01 Sep 2025, Randy Dunlap <rdunlap@infradead.org> wrote:
>> > ISTM that there are lots of non-docs developers who either just don't care
>> > about that or never run 'make W=1 htmldocs' to see the problems in their
>> > drivers or subsystems. OK, maybe it's just a very low priority for them.
>> >
>> > Willy had a suggestion that we just make checking kernel-doc during
>> > all .c builds a permanent feature instead of a W=1 option.
>> > This helps, but still doesn't force 'make htmldocs' to be run.
>> >
>> > And it causes around 450 build warnings in my testing of an x86_64 allmodconfig
>> > build.  
>> 
>> I think in general the build system lacks proper support for subsystems
>> or drivers being ahead of the curve in keeping them W=1 or kernel-doc
>> -Wall clean.
>
> It is trivial to add a spinx/kerneldoc parameter to allow setting
> -Wall per each .. kernel-doc markup. Yet, one would need to add it
> for every markup within the subsystem.

I'm not sure how that is relevant to what I'm saying.

>
> It is probably easier to do something similar to that via a CI.
>
>> 
>> We hack around this in parts of drm Makefiles, and it really has helped
>> to keep the kernel-doc and W=1 breakage/fix churn down. But it's not
>> pretty.
>> 
>> 
>> BR,
>> Jani.
>> 
>
>
>
> Thanks,
> Mauro

-- 
Jani Nikula, Intel

