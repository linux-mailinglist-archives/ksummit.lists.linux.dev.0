Return-Path: <ksummit+bounces-2246-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D2B3DFC8
	for <lists@lfdr.de>; Mon,  1 Sep 2025 12:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 716137A7676
	for <lists@lfdr.de>; Mon,  1 Sep 2025 10:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B1E30F556;
	Mon,  1 Sep 2025 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJkmmcKC"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACDF2FB975
	for <ksummit@lists.linux.dev>; Mon,  1 Sep 2025 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756721364; cv=none; b=iA39lQNP+/m0rnhSw7QhWAZO4JZnn9oX5otVASXMLGxYS2P8BHZeRuvpSMHim4oh+uA371qD58Y0kQQXpvGr2ayDjHAsBo+/CpZJSpDpBdIF+A3QfD/QhpXoM5L3SsVyhVa1NviuFduhDt5I2tQPBJa/2q8e69LgBNDWH94uT6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756721364; c=relaxed/simple;
	bh=92zBbFhzhWUrtCVRPnoSdLs5lAKLPR0yPgSVDmeYpeU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AMsSpbOlw2637eYhUDiHt17OmmBoM30aWieReIBQ2rLHB/AZqbUIGL7cG20vARNxyKWW/g9eS06SMYCFv7UlJ3Mcjl47hiexxHwnc+MB3YK5/gDE0kBEeMOeQw6Yoyrxp78HO1+iRW59vetbfBWo9Y9OpU0R0X5QMVGhzkj0m7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJkmmcKC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756721363; x=1788257363;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=92zBbFhzhWUrtCVRPnoSdLs5lAKLPR0yPgSVDmeYpeU=;
  b=QJkmmcKCczeOaA50RIaBFkeHTVgCayaOHSydsrUHseZGZYS0xqbduHf4
   RW3TXP2SObT/7t40iXfcCFrg7u2YDFDn8Hh3qRVfHfarQxkCx+uIPwjIu
   UeP5z3hSuD6kv2Qpn3Arwtcq8qbTM4RZvXfTCSiWYjv46vfJ4VxNXjx53
   qv5wQzC8EumxoL5wPFglV8k8EIuA76GamU5yj82SfPtb9TdZl7M21aA7q
   Spzbk2WamXveSKKlxFfPoJoMHETWEzUMFasg6TdnLJWGDq60ePX5ObtWI
   2zz1fIiuAi0eYTGmRPvtO+30mGTrULqXpfxpiDmwOdf3aEYib+rFLvj01
   g==;
X-CSE-ConnectionGUID: 7uzHsRMtTimGvozAsLe83Q==
X-CSE-MsgGUID: xjR0Ta0PRSCVTfQazGqdiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62807435"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62807435"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 03:09:22 -0700
X-CSE-ConnectionGUID: OIUa9XdFTN+k4h7EWO7Pxg==
X-CSE-MsgGUID: J2MFsppwRLObgUK7cnYy5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171152748"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.148])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 03:09:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250831160339.2c45506c@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
Date: Mon, 01 Sep 2025 13:09:15 +0300
Message-ID: <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 31 Aug 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> It shouldn't be that hard to do the same for kernel-doc kAPI documentation:
> kernel-doc now can parse the entire tree with:
>
> 	$ scripts/kernel-doc .
>
> Someone can easily use it to discover the current gaps at the docs that
> have already some kernel-doc markups and identify what of them aren't
> yet placed under Documentation/ ".. kernel-doc::" markups.
>
> So, I'd say the first step here would be to ensure that 100% of the
> docs are there somewhere. Alternatively, we could place all the rest
> of functions with kernel-doc markups outside Documentation inside an
> "others/" book - or even "<subsystem>/others/", and then gradually move
> them to the right places.

I don't agree that all the kernel-docs need to be in the html build in
the first place. Some of them would be better off with a simple
non-structured comment instead. For example, most static functions. Some
of the kernel-docs are useful for the structure the format provides, but
still having them in the html build is overkill. For example, many
complex but driver specific functions.

I think the API documentation in the Sphinx build is primarily useful
for kernel generic and subsystem APIs, or overviews of
functionality. But nobody's looking at the Sphinx build for highly
specific and isolated documentation for individual structures or
functions.

I'd say emphasize quality over quantity in the Sphinx build. An
overwhelming amount of (in the big picture) insignificant API
documentation does not make for good documentation.

That said, there *are* a lot of kernel-doc comments that absolutely
should be pulled into the Sphinx build. But don't be indiscriminate
about it.

---

I think a more interesting first step would be ensuring all the
kernel-docs we do have are free of kernel-doc and rst warnings. Because
they should be, and this would make them easier to pull into the Sphinx
build as needed.

Currently we only have the kernel-doc checks in W=1 builds for .c
files.

The i915 and xe drivers have local Makefile hacks to do it for more than
just W=1 builds and also headers. The attempts to expand the header
checks to the drm subsystem, however, failed infamously.

And still none of this checks for rst. But now that kernel-doc is
python, it shouldn't be too hard. Probably needs a dependency, but it
could only depend on it when passing some --lint-rst option.

Having this in place would also reduce the churn caused by merging
broken kernel-doc. It's fast enough to be done as part of the regular
build, while most people don't run the entire Sphinx build as part of
the development flow.


BR,
Jani.


-- 
Jani Nikula, Intel

