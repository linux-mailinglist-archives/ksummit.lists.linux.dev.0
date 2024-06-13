Return-Path: <ksummit+bounces-1251-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF59074A4
	for <lists@lfdr.de>; Thu, 13 Jun 2024 16:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC77D1F216F2
	for <lists@lfdr.de>; Thu, 13 Jun 2024 14:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75F0144D0B;
	Thu, 13 Jun 2024 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wmEaAVWn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F04A10F9
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287723; cv=none; b=qPpZoZgi4+gcqhR67ooWEB+sAV0035XAYcGCjO/8jzpG5rQHvlLwcaxtPULf0D+kaxp9MevHKPGicD6EIOrmgApNOyU1ZbzixsWkzR5zlFw08CII2aJ3TpjbQa3SmqwazU4FD5JckzDcIjgSQTBfBAEAQMccB9FwBVutcoTehas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287723; c=relaxed/simple;
	bh=28i6V+s4MCgwTeNvNaal6x4gww8/yKCxtEikY7quDM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kt/DuW5nY5hRsyuLQHlWVYtgynXGirqx36gmvEvAhyuyoQrTtSzjkqIJBWtGrPrMlxlZ485eU6t+5olFMWCD1yONXLwKhgts/8lbxU1DxZXrbAv+4PAxf+RyU0V+kQYLU0HYEmhgridGcZP0yGS6YBdYBnhs8rjlD/Ta6n+C4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wmEaAVWn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CBCC2BBFC;
	Thu, 13 Jun 2024 14:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718287723;
	bh=28i6V+s4MCgwTeNvNaal6x4gww8/yKCxtEikY7quDM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmEaAVWnmvEnMaJROtKtsNFFXIZRJaPlm28GnptYJ9uBy2xNmw3VHCkQ4/J3c2J64
	 lmwOKnmwNsTtxW0x6LbXZRVEc0ESpuD53VCD8iAYaqwX5Sm2FH92s5ryH8a+TH4eO8
	 JK/iIScAXookT06qJy/Y2q90wCA2hxNNb84mYVTY=
Date: Thu, 13 Jun 2024 10:08:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jan Kara <jack@suse.cz>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240613095917.eeplayyfvl6un56y@quack3>

On Thu, Jun 13, 2024 at 11:59:17AM GMT, Jan Kara wrote:
> > * One cause of regressions that happen in stable trees (and not in
> > mainline) I've seen quite a few times are backports of commits with
> > Fixes: tags that were part of a patch-series and depend on earlier
> > patches from the series. The stable-team afaics has no easy way to spot
> > this, as there is no way to check "was this change part of a series".
> > Sometimes I wonder if a dedicated tag linking to the submission of a
> > patch could help -- and is something quite a few maintainers already
> > really want and add using a "Link" tag despite Linus dislike for that
> > (IIRC).
> 
> FWIW I (and a few other maintainers) use 'Message-Id' tag to link to
> submission. This is still easily convertible to lore link and unlike 'Link'
> tag it is clear what this tag is about and that it is not just a link to
> related discussion or something like that. AFAIK this also addresses Linus'
> dislike because what he was complaining about is that 'Link' should be
> linking to some useful context for the changelog, not just patch
> submission.

I am strongly in favour of that from the tooling perspective. Linus suggested
that we can always trace the original patch submission from the commit by
using the patch-id, but that doesn't work reliably. I mused on that here:

https://lore.kernel.org/git/20240605-hilarious-dramatic-mushroom-7fd941@lemur/

The gist is that we cannot reliably match the patch-id of the original
submission from the git commit, because there are multiple ways to generate
the same patch, such as changing the diff algorithm (myers vs. minimal vs.
histogram), or changing the number of context lines. If the original author
generated their patch with --histogram, but we try to find it by generating
the same patch using the default myers algorithm, we may not find it.

The "Message-Id" trailer is already documented in git:
https://www.git-scm.com/docs/git-am#Documentation/git-am.txt---message-id

I suggest we move away from the practice of using Link: trailers to indicate
the patch provenance to using Message-Id: trailers for the same purpose. This
solves multiple problems:

1. disambiguates Link: trailers so they point to relevant online discussions
2. allows tooling like b4, patchwork, etc, to reliably match commits to
   submissions for the purposes of better code review automation
3. allows stable and similar projects to better track series grouping for
   commits

-K

