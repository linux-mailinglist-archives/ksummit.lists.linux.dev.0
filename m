Return-Path: <ksummit+bounces-1465-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921093A25E
	for <lists@lfdr.de>; Tue, 23 Jul 2024 16:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655BF1C22BFD
	for <lists@lfdr.de>; Tue, 23 Jul 2024 14:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3549F153BF7;
	Tue, 23 Jul 2024 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2DKmH8M"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A721C153BE8
	for <ksummit@lists.linux.dev>; Tue, 23 Jul 2024 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721744062; cv=none; b=QE1wn4yp4Yax5QdZQCA0S0iLfzMxqlHS5fnP6S1c2FMqex2c7Jo3oqqk6OWS7Y+lI6uUVUnF2CanmD8PYM0IKOAJxFnWtAUjnb7HFdicXMT+kwGbYbgpUsQuBAFBMEqUsp6KVFTnWjiGO29AYNwc8K+WFG3XPw0tJdekv8TzIBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721744062; c=relaxed/simple;
	bh=yj8g2biEfukUFflcD5whiHUSVYi75JwZPuXlu96hIro=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hCaUorT9G4m/DzibvJrzcXGjG/BR7Utw9uqk3wIZKKIq8TNgs0IkL/W4mkDHenT/lfCefBbuMXr78z8gFEP8EjnX8c1wPkzvV3Ej2Px+wQSawdV/Jk1QXguk6xwPhsLh32RJbTHBPVLAGJqY+aJ3HeEpoCtuoZ6mdb5ETnKIgb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2DKmH8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3017C4AF09;
	Tue, 23 Jul 2024 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721744062;
	bh=yj8g2biEfukUFflcD5whiHUSVYi75JwZPuXlu96hIro=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i2DKmH8MIXS9EGQIB8LOlAzzPXlm2qGjVxsuT5hElKw/kQGfe6sB2ex4Vxyn9kt2v
	 uNAvG/A/LZP8cwkObg0OFL24d3O1Eyq1o0NuWG+EhXy/iFYlRPqWpGP6sz+7fg0qY2
	 +2XKImdsEpJt4tgsBZzSfD58jwVOoUp4RcuMV3c7HUS/7wFme7DtkT1atexdhwwByz
	 ofsWTe4QDrRZwGJUVO8oZbQbQnCGHz8Nit1ughLtl8Gp77lvqFO+rfoy+1K75AeHB/
	 h8jwiCh1lHULl34TP5w//PHhhfN0p6ty4L9EvwnK35n5qk3d7nM/RvH8+h5NnawNdM
	 vdCjlIgC95Z8Q==
Date: Tue, 23 Jul 2024 16:14:19 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
cc: Dan Carpenter <dan.carpenter@linaro.org>, NeilBrown <neilb@suse.de>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, Theodore Ts'o <tytso@mit.edu>, 
    Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
In-Reply-To: <676be898-56c2-4d26-a64b-5e25b7390899@oracle.com>
Message-ID: <nycvar.YFH.7.76.2407231528050.11380@cbobk.fhfr.pm>
References: <> <1a8e6672-5431-4125-8d10-b00da89f84e7@suswa.mountain> <172135015702.18529.2525570382769472437@noble.neil.brown.name> <3b661b6b-3236-45ed-8dfb-a1f1f1a38847@suswa.mountain> <676be898-56c2-4d26-a64b-5e25b7390899@oracle.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Jul 2024, Vegard Nossum wrote:

> With my distro hat on, I definitely think Fixes: should be used for
> anything that fixes a bug, regardless of whether it was a bug introduced
> with a new feature or it was a regression.
> 
> Fixes: is incredibly useful in the following way: You can check whether
> you need to apply/cherry-pick a patch simply by checking whether you
> have the commit it fixes (or a backport of it) in your branch. As a
> distro (or even as a user), if you have a buggy commit in your branch
> and there's a known fix for it, you almost always want the fix.
> 
> I don't really like the "Cc: stable # version+" tag for the exact same
> reason: Authors/maintainers may be looking at when the bug was
> introduced and decide not to put that "Cc: stable" tag since the patch
> that introduced the problem was in an earlier -rc of the same release or
> never appeared in a stable kernel _at that point in time_. But that's
> the wrong approach, as the fixed commit may be backported to stable (or
> a distro kernel) many years after it was merged into mainline (just look
> at all the commits with Stable-dep-of: in stable), and without the
> Fixes: tag we have no way to know that the fixed commit has a bug and
> needs to have subsequent patches applied.

For me, the biggest question coming out of this discussion is: what are 
the groups / types of patches that should be getting "Cc: stable" despite 
not being fixes for some older code?

As "fixing bugs" should be all what the stable tree is supposed to be 
about, shouldn't it? (*)

One of the obvious categories is "fixing HW issue", being it either 
mitigations for HW security issues, or adding new device IDs, adding 
quirks, etc.

But what next?



(*) There is this famous defition at the beginning of

	Documentation/process/stable-kernel-rules.rst

but I guess it's obvious to everybody that it doesn't apply.

-- 
Jiri Kosina
SUSE Labs


