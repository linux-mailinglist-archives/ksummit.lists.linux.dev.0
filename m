Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794BD7D71D0
	for <lists@lfdr.de>; Wed, 25 Oct 2023 18:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34099281D82
	for <lists@lfdr.de>; Wed, 25 Oct 2023 16:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0ED6241ED;
	Wed, 25 Oct 2023 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIShGM5g"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50F8832;
	Wed, 25 Oct 2023 16:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698252050; x=1729788050;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=n1EgBmf+lXleYrrXsvueB3LRxOHeYf0SL1x84vpv0LQ=;
  b=SIShGM5g2EzvBWA4rh+9ouR8K+70EgK/6IssPIszoqwiD5sqrCHWNsxi
   5BBuFS7o1/zjKACWGqlcuOULeRN23lo1GxA52ud59vgTPDaflrRUYHpaP
   xfhdotkTo2MXlmWRZhJvZYySLbrZqJvoZ8lQM5MM0SpSJrQvRvnOR1wUq
   BSd6LyJ+pYsswK0ZKe94uwiooWZxVZrxToF8NUhn/4W+fxQop/97VFvtQ
   /1RmHqrF/k+P645pe1acNJ8ZLBrsFxyGXLCEUsoXT5vHtG7KgwDKEUteh
   y6g3fPzVR07lvVCNx1c+p25HhWllGiZZ3g3+DQ2fiULfUJsAoiwbUZH8O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="130851"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="130851"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 09:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762511557"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="762511557"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.33.83])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 09:40:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, NeilBrown
 <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-Reply-To: <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
Date: Wed, 25 Oct 2023 19:40:42 +0300
Message-ID: <87fs1y8xkl.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 25 Oct 2023, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> On Wed, 2023-10-25 at 08:29 +1100, NeilBrown wrote:
>> Here we all are, brilliantly talented computer programmers who spend
>> our days making amazing fast digital devices do amazingly clever and
>> subtle things, inventing time-saving tools and processing vast
>> amounts of data without blinking, but for some reason we think the
>> task of skipping over a few thousand lines that all start with '> "
>> is too hard for us and that we should, in stead, complain to some
>> other human to convince them to make our life easier for us.
>> 
>> Does anyone else see the irony?
>
> So if I'm a brilliantly talented driver, it's OK for other people to
> drive on the wrong side of the road because I should be able to avoid
> them?

Nah, we're all brilliant car manufacturers that could have our cars deal
with the situation. ;)

The notmuch emacs interface has collapsed citations since at least
2010. I think Neil's point is, if we're all using open source MUAs, why
don't we scratch that particular itch and move on, instead of getting
frustrated by it year after year?


BR,
Jani.


-- 
Jani Nikula, Intel

