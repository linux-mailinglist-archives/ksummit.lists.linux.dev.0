Return-Path: <ksummit+bounces-1301-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB290AAD9
	for <lists@lfdr.de>; Mon, 17 Jun 2024 12:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD8241C213F2
	for <lists@lfdr.de>; Mon, 17 Jun 2024 10:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51680188CCE;
	Mon, 17 Jun 2024 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxaD7On5"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B31BDCD
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718619324; cv=none; b=rU2egx7RHUa7yMRrr3CZOWN6YLNAcWwB8mV7cn2QplOpELN/MyTg+ulsY01gNbDSPvOHsD4QrX9uvUqpFjrnLTFJU9sR7ufxyOTpHnM5gGjGcd4BJ2wkWVWWC7TbgRnDoj+/y8MCQj2vn63cUZbvmLMsHwVJ7bdtoWE1bA85ppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718619324; c=relaxed/simple;
	bh=7qF3alyCGgo7HxBKssY5QD3wczprwwk8LtL2VD+gMV8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rBPy8f5Z9kP1k/eulHBpqSRSfXQfDAicAbwk1i91meHwIkU8JzR7mvjtyEbnvV0VnbFMFQnsIobGdVfqZeyt1erT4LVxdrMYxCr9PdLYukAA0QRc7kPMU8TuD96Gn15ekhwid87VrSCpXk5FE7wRgdB2SOf8M799exeA2kpP9IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxaD7On5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718619324; x=1750155324;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=7qF3alyCGgo7HxBKssY5QD3wczprwwk8LtL2VD+gMV8=;
  b=KxaD7On5fQV0VHSzkhRa6IgOaD2ffpaczCnbqAgx6xSZ9ZRDuaMrjVDr
   JTmKLTRdWfwCquY7E36VhSN3T4uLPYFpAUW/fG+ULpkKy8PVJb3abmIL6
   prinUNX3ZTsRe7ze/senKgPxBF96PLj6mwsAt7cGLZrWYFRSJCY2GR4Ma
   5X2xcqZoRyLq6k4Vb5eqyLm+JJHAgjLiRwI4nq+7KeoI74ysEf+CDJIZW
   /gTEB1qElMyR57pREKlW3be4RqCTVQswFHzqUI+id1p0LhTPwQg9o6uz4
   UNf93Tr7oJWq0selPJbipjyoma0bua+XzgWbNnPX8uRIbKN1I6BP8WyOM
   Q==;
X-CSE-ConnectionGUID: P3rEWjIZRCCXN1J5J5DAIw==
X-CSE-MsgGUID: vpGOupF7RRGUAbjAEFcJdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15586103"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15586103"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 03:15:23 -0700
X-CSE-ConnectionGUID: od5pqyXwTJKgjCYCHzWh3g==
X-CSE-MsgGUID: flI2oIwOSnqKgGP/Ryggog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="45519210"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.85])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 03:15:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Jan Kara <jack@suse.cz>, Thorsten
 Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
In-Reply-To: <CAMuHMdXS4E3sfzcmBE0G8x4-G7tY==rZvMy269bSbV3LoYTQSA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <20240614-almond-lorikeet-of-reading-6d959f@lemur>
 <CAMuHMdXS4E3sfzcmBE0G8x4-G7tY==rZvMy269bSbV3LoYTQSA@mail.gmail.com>
Date: Mon, 17 Jun 2024 13:15:16 +0300
Message-ID: <87o77zho3v.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 14 Jun 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> That's also why I detest people putting patchwork URLs instead of
> lore URLs in the Link:-tag: finding the thread in lore requires one
> more click on "mailing list archive" (for patchwork.kernel.org)
> or a copy-'n-paste of the Message-Id (for oh-the-horror
> patchwork.freedesktop.org; and what if freedesktop.org goes away?)

More than 99% of the Link: tags pointing at patchwork.freedesktop.org
have Message-ID in the URL.

BR,
Jani.


-- 
Jani Nikula, Intel

