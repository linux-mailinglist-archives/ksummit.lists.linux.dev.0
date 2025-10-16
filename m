Return-Path: <ksummit+bounces-2555-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C10DBE37CD
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7FE65843D8
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303F73314BC;
	Thu, 16 Oct 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="un+oDMj5"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE925A357
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619084; cv=none; b=awmcXwetBC2Mrb9LseZh18AjuVv9V0pHZ15zKpI8uG2chf6uS5uoNEtYC6RsGAUT+nUyLa+eMcF/cNuOMqWuwiCDeTn4S0cvMVhdTxNNgxO9imKwASKAoHmIvvMnslO2IEQ0XABrUhVOeGa7ZG1d/ZqYUwEDBYeSajq32rTsq7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619084; c=relaxed/simple;
	bh=DZgKKxYh9mFsz6juodPIrK+012FWYwBinnMuTbsewuU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VRrECepTYlmL4xySf5hpItPwssuu+RuulIvydjOsUpgTPUZVUE/xlPDRkgy9h6wHTIxvRDe3+IV5va15Ryqp6Zxq0ULKheMKd9B3v6lPfiGZbqvcodnhpE3DhbEp+tWpdCNJndQwFWsG1ijmIOz/p+LCMagBu0nGo//l0UxCulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=un+oDMj5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD94C4CEF1;
	Thu, 16 Oct 2025 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760619084;
	bh=DZgKKxYh9mFsz6juodPIrK+012FWYwBinnMuTbsewuU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=un+oDMj5F+2vM0xHvuzUBGUXfIwUL6n6vQF4sIJD7nfBE3Tox3h/eL6JUewbD60L5
	 Yv6A/a+OlKODbYbs6zo3DdFOAg/rwqkGSH2/w5vgW7VdJgYYVktxDxGGnNcnCyZ+f4
	 1ytcHXlbxyyKFofAlm1o1gXK+El9NoFeAj6Plct6/dIppcOCmWyZPzo7H0wSlR9pYv
	 fYZt3S9kdv4KcA0e0hCetv4tbiWUr68EgAzzI/pioN2KWX3RXAjQMmZ6Rh+sCzSFpc
	 nIhmqyKol9vcwTFpxM3ORlCsKKyf3ud0gS52q0ZHRPAH32MC10SamamAs/A1gzI3Fo
	 xbNSW//bhd7dw==
Date: Thu, 16 Oct 2025 14:51:21 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
cc: Greg KH <gregkh@linuxfoundation.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>, 
    "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
In-Reply-To: <1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
Message-ID: <8p635sn0-65r3-506n-3141-1316o85s539o@xreary.bet>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com> <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com> <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch> <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch> <20251015-versed-active-silkworm-bb87bd@lemur> <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com> <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com> <2025101631-foyer-wages-8458@gregkh>
 <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com> <2025101639-thwarting-press-f0f7@gregkh> <1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Oct 2025, Mathieu Desnoyers wrote:

> The "Link:" tag is unfortunately a bag of holding for all sorts of
> links.

That's indeed the case.

People are using Link: not only to refer to the actual msgid that was used 
to apply the patch , then there are links to all sorts of bugzillas, 
github pull requests, gitlab issue reports, ... and those definitely have 
completely different semantics.

Which is also why people sometimes seem to be talking past each other, 
because maintainers mostly see it as a primary tool to reference the email 
thread that was the source of the patch, while submitters often see it as 
a way to express "See also for random pile of other information 
regarding this".

But I think it's an important disctinction.

-- 
Jiri Kosina
SUSE Labs


