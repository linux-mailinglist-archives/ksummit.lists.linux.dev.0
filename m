Return-Path: <ksummit+bounces-2545-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E39ABE2B6A
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A96E1406953
	for <lists@lfdr.de>; Thu, 16 Oct 2025 10:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F03932D431;
	Thu, 16 Oct 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6wSXPXD"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C707632C305
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609097; cv=none; b=t9uLQPc279u5vB+30ieTcEVdjweF0h51yNamXH4AU/YgR6KFcvABfmgGy+hgQEtAIlE5WgiNyvjuf3Uwa6rM60dT+S6Fm7RbNHY6XWQKAIkHoYSrkx+Djnmu+fgP6aK2EKsjV7RwYUDFlnpQjPX2l7GXpBxn5cz953YxyDiJewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609097; c=relaxed/simple;
	bh=zROI3Grx2F7X2wSPssnN/SqoaKbvSBwqIUkbukTpnKM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oUEoT3uuKK52WWUYPkATvUP70AH35QYLywtKDlTJMmv+gjM/bQwVJDsCtYCGTZFxc0C74b+u4cA0djOwqdUJJluH3iBG4M+DR0iU48XLYhfuPiEa+73Tiz6Hjw7YQ1TT3VzcYyZlAXfKfoqb6OllswJxxw2pPSZQHwPFZW+4cuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6wSXPXD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760609096; x=1792145096;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=zROI3Grx2F7X2wSPssnN/SqoaKbvSBwqIUkbukTpnKM=;
  b=W6wSXPXDVw7UUs7hnhdmWXqb5Zb+zpSXj7OzR7oFG8gwbiYq3RTK8kL6
   70VdbzbHSKjlxYAzz74XuK6+CjLEFIIrzPXQV021C9a0TzUj88gTJ325S
   ot81WRkXDNHH18eGhA0fq+wVwGeO9Kwid1UzudBCcapmO+oZwvertvKib
   q0HCsrmKlCjcQKinXaGn0x7Ym3wn+HjCDpPxt3ppwWnzZXpYv21GClBHm
   LFqDPT6E+5N1lyDERWRp5yDzwH3GuPvb5KwnfDtJObr0+nizldnSC4T/R
   A7tJgWnkqpFFlfMPd+/P/VSMZecWDSi12IGRHYGwueE3YMKDQgLSz3/hr
   A==;
X-CSE-ConnectionGUID: Bxl6nY8HSjeE/5aGjgLzig==
X-CSE-MsgGUID: vLfH+jhuSkKFkBS9rr0SWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73082192"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="73082192"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:04:55 -0700
X-CSE-ConnectionGUID: tt0e09X1Qi+FUE03ZGkB0g==
X-CSE-MsgGUID: xCfDg4O8Tw2cJkdEUdg0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182889368"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.155])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:04:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>, James
 Bottomley <James.Bottomley@hansenpartnership.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Dave Airlie
 <airlied@redhat.com>, Sima Vetter <sima@ffwll.ch>
Subject: Re: Replacing Link trailers
In-Reply-To: <2025101631-foyer-wages-8458@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh>
Date: Thu, 16 Oct 2025 13:04:48 +0300
Message-ID: <8561b0e8964f6b91ea2513fa70c280c302f37c17@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 16 Oct 2025, Greg KH <gregkh@linuxfoundation.org> wrote:
> While I appreciate the goal of keeping our changelogs "crap free", I
> still think that the "mindless Link: line" benefits far outweigh the
> lack of it being there, and forcing us to use additional tools and
> server resources, when doing our debugging and patch history tracing
> work, which almost all users of the kernel source tree end up doing.
>
> That single line is there for when we don't realize we are going to need
> it in the future, think of it as an insurance tax.  It's saved me tons
> of hours of time already in doing stable kernel work over the years, and
> I'm sure it has helped others out as well, as I'm not alone in doing
> backporting work to old codebases.

For the parts of the drm subsystem that follow the maintainer/committer
model, the Link: trailer is also part of an audit trail, if you will,
that only patches actually posted on the list get committed and pushed.

"Something like this was once posted somewhere" is nowhere near the same
as "this is the exact patch, as part of this series".

For i915 and xe, you'll additionally find the CI results for the exact
patch/series, and passing result is part of the merge criteria.

BR,
Jani.

-- 
Jani Nikula, Intel

