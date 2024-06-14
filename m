Return-Path: <ksummit+bounces-1262-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D499908732
	for <lists@lfdr.de>; Fri, 14 Jun 2024 11:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F0131C220B1
	for <lists@lfdr.de>; Fri, 14 Jun 2024 09:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC331922F8;
	Fri, 14 Jun 2024 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNcLqyYM"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B437E574
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356793; cv=none; b=HObM1nixuN/Hr7koUQgs418gJ6fNkCOFQG9IqApS8PmhqPwqj7t/+TNGjIxSKFoqop6I2cMYB6vbek7A9TF92lVR2DXXuJc57w9dnta98a0UXPYGvAXmXCQR/d6sUz4SAbfkbSXHZAHSJQeQp40+z5tqZ5/Oe4G6Vo58WrlpV4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356793; c=relaxed/simple;
	bh=6ZgzTZZuVJ4IujxYHoMaxdlcC8HEii6Qz3nHWCsiqJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrZfBCX7iB7rvTAPF2yIEciJ0juEuoNWJTMr8b7ScS5Na5fHH3y6vsYNVq9WA42nycG8SEpm5ttcNKPmsx0vJTKzkdbF1c+vzr+g3MZYJyA9hQ1c/bYFTgbzU/fLIoj2hxvIWkY1zdy3CoqeH4k9sf4rSzZk541YAXLvz/UR6a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNcLqyYM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B638AC2BD10;
	Fri, 14 Jun 2024 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718356792;
	bh=6ZgzTZZuVJ4IujxYHoMaxdlcC8HEii6Qz3nHWCsiqJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNcLqyYM7YvqloCygO+rVhktAKW6jXNjAB5a8jP+Eau+oAYI/Vu4Nnbs6tFhRXDbD
	 8fQooOS2TYkDhVcW19A5GBsNzDUfmgyqBCXoBnKKcAR20ObLVPjxdIuoCNPzp5ygCT
	 RrR0Zt1NSscCKO6ypw+J/qofqWEz36v/mMrJtVWJW9rNLGPDJMg0SkxKHtslPn2TM+
	 2+x5fwynlq+kdcOG8t9D7JxE3BX04Vt6UBRWE1XFqOtzCcXkSAinoPNyXGjfsZ9kY4
	 pleS0NATohgJMJHeQGz4nE4rK/TpxSdiSzFNU+S0hNrkiDObYDDkx7IgvRMcdIPi+i
	 cEI5LoUsnxORA==
Date: Fri, 14 Jun 2024 10:19:49 +0100
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614091949.GB3029315@google.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613-rustling-chirpy-skua-d7e6cb@meerkat>

On Thu, 13 Jun 2024, Konstantin Ryabitsev wrote:

> On Thu, Jun 13, 2024 at 11:59:17AM GMT, Jan Kara wrote:
> > > * One cause of regressions that happen in stable trees (and not in
> > > mainline) I've seen quite a few times are backports of commits with
> > > Fixes: tags that were part of a patch-series and depend on earlier
> > > patches from the series. The stable-team afaics has no easy way to spot
> > > this, as there is no way to check "was this change part of a series".
> > > Sometimes I wonder if a dedicated tag linking to the submission of a
> > > patch could help -- and is something quite a few maintainers already
> > > really want and add using a "Link" tag despite Linus dislike for that
> > > (IIRC).
> > 
> > FWIW I (and a few other maintainers) use 'Message-Id' tag to link to
> > submission. This is still easily convertible to lore link and unlike 'Link'
> > tag it is clear what this tag is about and that it is not just a link to
> > related discussion or something like that. AFAIK this also addresses Linus'
> > dislike because what he was complaining about is that 'Link' should be
> > linking to some useful context for the changelog, not just patch
> > submission.
> 
> I am strongly in favour of that from the tooling perspective. Linus suggested
> that we can always trace the original patch submission from the commit by
> using the patch-id, but that doesn't work reliably. I mused on that here:
> 
> https://lore.kernel.org/git/20240605-hilarious-dramatic-mushroom-7fd941@lemur/
> 
> The gist is that we cannot reliably match the patch-id of the original
> submission from the git commit, because there are multiple ways to generate
> the same patch, such as changing the diff algorithm (myers vs. minimal vs.
> histogram), or changing the number of context lines. If the original author
> generated their patch with --histogram, but we try to find it by generating
> the same patch using the default myers algorithm, we may not find it.
> 
> The "Message-Id" trailer is already documented in git:
> https://www.git-scm.com/docs/git-am#Documentation/git-am.txt---message-id
> 
> I suggest we move away from the practice of using Link: trailers to indicate
> the patch provenance to using Message-Id: trailers for the same purpose. This
> solves multiple problems:
> 
> 1. disambiguates Link: trailers so they point to relevant online discussions
> 2. allows tooling like b4, patchwork, etc, to reliably match commits to
>    submissions for the purposes of better code review automation
> 3. allows stable and similar projects to better track series grouping for
>    commits

Sounds good to me.

So `b4 am -l` should be replaced with `b4 am ?`.

-- 
Lee Jones [李琼斯]

