Return-Path: <ksummit+bounces-2686-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B58CEBEDD
	for <lists@lfdr.de>; Wed, 31 Dec 2025 13:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44ED4300B287
	for <lists@lfdr.de>; Wed, 31 Dec 2025 12:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4AE2DF12F;
	Wed, 31 Dec 2025 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blsyIm0f"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35CC72634
	for <ksummit@lists.linux.dev>; Wed, 31 Dec 2025 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183458; cv=none; b=E3GBfecmpLNvCmtD7Tej23PY4qqwCqE4Kp0HlwCo87NVVJIgCZE7xNEePDFOtXFiDWHfef1KkjHLgxX1TMVo4DbvMwVI/f2TtjxGz/sQR5bC5eYXnKnAVqhElCKkpDUNIGhgddiLIF9GRROF4B+D1kulRYZnI0v0L6XFYTss9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183458; c=relaxed/simple;
	bh=WFlhCs+zTmmMkG2xAhSNuK/ayTWD/rejobA6sC9FPMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTkZ/zS4nthHSMTL5Q20DhHHumWB9UwLbfp3eL9j5tMlYHd9SyRcnkLM85RyW7RlL58v+DXeQekrtlGImCCNY2wfb73/pSpjsJylF2ZuE92Nqkxlqr4gvWwNf7R04y2MrEmaafNUDzGXphWzIakbBb//CumHpRwTJDcw1cLFzGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blsyIm0f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767183456; x=1798719456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WFlhCs+zTmmMkG2xAhSNuK/ayTWD/rejobA6sC9FPMo=;
  b=blsyIm0fqVZ3kP2SCinkaUDIO38SoXBzexmep4n7eF5BQpasQo0uiQlk
   Kzs4OZNAFRjS48QEEWFFYaSt8fUIXDzMzuNWtiSFVRKk9K3eXPJDPY40D
   htdurxbCNr5msrJqZ1xUTuKJlCrE+1LmUl48Vdw1o9lVPO/mCCqu8Q1Xp
   3xQb1wubu2Y7uNAFO88BeKx4A3ZnIAwSyt1wD2vhRoi9Jt07JwMK5PjBZ
   sJ12bozhuQJlTF0irN1ErN0G7Ed5Modtgh+NtF8CQmP0VTsQgbAerJd31
   7DDAvecw4Y2QI+s1c5CDUOQ8APxVV4aOdzsuwTvLFAgjP9qDqlUd2DsZR
   Q==;
X-CSE-ConnectionGUID: FpZx4gNjS7OWohRd4mps+A==
X-CSE-MsgGUID: TDKH/J1xT429PkM7W0Q0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="67949521"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="67949521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 04:17:36 -0800
X-CSE-ConnectionGUID: WkzN/0q+TSSgbT7kbKQ8+A==
X-CSE-MsgGUID: cS9hLEasSxidgahFQUh9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="205942885"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 31 Dec 2025 04:17:33 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 122D38E; Wed, 31 Dec 2025 13:17:32 +0100 (CET)
Date: Wed, 31 Dec 2025 13:17:32 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <aVUUXAKjiNroU5tR@black.igk.intel.com>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 25, 2025 at 05:25:19PM +0300, Alexey Dobriyan wrote:
> On Tue, Nov 18, 2025 at 11:39:26AM -0500, James Bottomley wrote:
> 
> > So which should we do?
> 
> The best way to understand that C89 style of declaring in the beginning
> of the function is pointless rule is to write some code in a language
> which doesn't enforce it. You should see that nothing bad happens.
> 
> It increases bug rate due to increased variable scope allowing typos.
> 
> It bloats LOC -- in many cases declaration and initializer can fit
> into a single line.

It's a weak argument, see below.

> It prevents adding "const" qualifier if necessary.
> 
> Pressing PageUp and PageDown when adding new variable is pointless
> busywork and distracts, breaks the tempo(flow?) so to speak.

I think with something like VSCode, it's much easier to handle, but it's just a
side note.

> C89 style provokes substyles(!) which makes adding new variables even
> more obnoxious: some subsystems have(had?) a rule saying that declarations
> (with initializers) must be sorted by length, so not only programmer has
> to PageUp to the beginning of the block, but then aim carefully and
> insert new declaration.
> 
> None of this is necessary (or possible) if the rule says "declare as low
> as possible".

This is a bad rule, if hard defined, as it provokes to have a code like

	int ret = foo(...);

	if (ret)
		do_smth(...);

The evolution of such code is prone to subtle mistakes, as more code will be
added during the development of the mentioned function. I saw the real error
case when somebody does something wrong in between the lines. That's why I
prefer the assignment to be split from the definition.

	int ret;

	ret = foo(...);
	if (ret)
		do_smth(...);

is more maintainable and robust.

However, if we talk about RAII variables, the assignment and definition makes
a lot of sense to go together.

> There was variation of this type of nonsense with headers (not only it has
> to be sorted alphabetically but by length too!)

By length it indeed sounds weird, but alphabetical is the natural language
order everybody learnt from the daycare / school years, so it's properly
programmed in our deep brain. Having that allows to find easily if anything one
is interested in is already being included. Also it allows to avoid dup inclusions
(was there, fixed that for real). So, it's not bad.

> There is no practical difference between code and declarations:
> declarations can have initializers which can be arbitrary complex,
> just like "real" code. So the only difference is superficial.
> 
> C89 declaration style is pointless and dumb, no wonder other programming
> languages dumped it (or never had), it should be simply discarded.
> 
> It will also make Linux slightly less white crow to newcomers
> (C++ doesn't have this rule after all).

-- 
With Best Regards,
Andy Shevchenko



