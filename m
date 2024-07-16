Return-Path: <ksummit+bounces-1436-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9993206E
	for <lists@lfdr.de>; Tue, 16 Jul 2024 08:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3407A1F21DAA
	for <lists@lfdr.de>; Tue, 16 Jul 2024 06:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939F71C6A0;
	Tue, 16 Jul 2024 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="baERLgcH"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0868C1799D
	for <ksummit@lists.linux.dev>; Tue, 16 Jul 2024 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721111337; cv=none; b=OY0sDTVFkAtJ7e0zJWjFKyFAF5N/wnaVY0cWhAIGeZeLAfPS2Bpg2x0TyGCDIF7craHRSnm8CELpWckzeprCey8GLWbrWIsFg/GwnWdb6fBNiWPzjYo1kHsa6X23FSZpt29raTYsMHo8VohTn6VmB+Gj6qWqp/H9TazPOUaaAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721111337; c=relaxed/simple;
	bh=dSjnbuN9+S6pvCZpBhgq82afDsZ9Tmam9ut71Se4UpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iriyLkI0DG5kOht+u6PeR9CjsTmk1RkBS/YCpUakZeCuitimVtkjF0wb692SDEAT/eEQMUN1qfXiBxOvyplBlgJVjfGdFB5fDeOITMZq+tzUMAH3I65cXJelpI5CIna5EBO4Tib9GCm8qgxU4HQIJPdy1soFdjIRYvxaNM9r3Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=baERLgcH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C47BC116B1;
	Tue, 16 Jul 2024 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721111336;
	bh=dSjnbuN9+S6pvCZpBhgq82afDsZ9Tmam9ut71Se4UpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baERLgcHF32EYgVYVwejkZFUp1n/s/sjp0VKDPp+2cMhKp9DfGzYS7PheCa3PsZVJ
	 zPfV9cWpxqnC5nzSKE6gIiil+Q8mQcGmHIf6wnqV9oUHPep4uFddBXxmaLGSjk1Fo4
	 updKF4R2vBmehA5OWLReivN5je+AxguxbY6mkPaE=
Date: Tue, 16 Jul 2024 08:28:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <2024071605-bulb-plop-9cea@gregkh>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
 <ZpWK0m7Ps6Y4vjL2@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpWK0m7Ps6Y4vjL2@google.com>

On Mon, Jul 15, 2024 at 01:47:14PM -0700, Dmitry Torokhov wrote:
> On Mon, Jul 15, 2024 at 02:06:55PM -0500, Dan Carpenter wrote:
> > On Mon, Jul 15, 2024 at 02:00:00PM -0400, Theodore Ts'o wrote:
> > > On Sun, Jul 14, 2024 at 04:18:00PM -0400, Sasha Levin wrote:
> > > > From my experience, most issues tracked by regzbot and fixed upstream
> > > > don't actually have a stable tag. Here's one I just looked at a few days
> > > > ago: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f451fd97dd2b78f286379203a47d9d295c467255
> > > > 
> > > > And I'm actually happy to point to that one as an example because the
> > > > ext4 folks are usually great about stable tags.
> > > >
> > > > Should we have not taken that commit?
> > > 
> > > Yep, that's just a mistake on our (my) part; you should have taken
> > > that commit, and my thanks for taking it without asking us.
> > > 
> > > That being said, maybe one path forward is that the stable team
> > > *should* be asking the subsystem maintainers about.  "Hey, the
> > > following commits appear to be backported, but you didn't add a cc:
> > > stable.  We plan to backport them unless you complain."  This has the
> > > benefit of giving feedback to the subsystem maintainers that they they
> > > missed tagging some number of commits, which might remind them to do
> > > better, or make them decide that they want to do something more
> > > explicit, such as have their own stable backports initiative ala XFS.
> > > 
> > > More generally, it seems to me that we are conflating multiple issues
> > > here in this discussion which may be making it harder for us make
> > > progress on the question.
> > > 
> > > 1) There are some subsystems who don't care about tagging commits,
> > >    either Fixes: or Cc: stable, or both;
> > > 
> > > 2) There are subsystems which are trying to appropriately tag commits, but:
> > >    a) Sometimes they will make a mistake, and forget to cc: stable
> > >    b) Sometimes it's too hard (tm) to figure out what is the commit which
> > >       introduces the regression, so they either make up something (e.g.,
> > >       hmm, it looks like commit XYZ changes one of the line that is touched
> > >       by the patch, so <shrug emoji>), or they will add a Cc: stable but
> > >       not supply a Fixes: tag
> > 
> > Too hard doesn't work as an excuse because someone has to figure it out,
> > and it may as well be the subsystem expert.
> > 
> > I've already added a checkpatch warning when people CC stable but don't
> > include a Fixes tag.  I also plan to start going back to maintainers
> > and manually asking them for Fixes tags.  This will be attached to the
> > patch.msgid.link URL so the stable tooling can pick up Fixes tags which
> > are added later.
> > 
> > The one question I have is for patches which pre-date git.  I was told
> > to leave the Fixes tag off in that case, but I think that's out of date.
> > It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")".
> 
> If a thing was there since before git and only now is being discovered
> it either needs to be explicitly marked for stable with cc: or we can
> just keep the fix in newer kernels. IMO this particular "Fixes" tag does
> not bring any value.

On the contrary, if I see just a "cc: stable" and no "Fixes:" tag, I do
a "best effort" to backport to all current stable/lts trees.  If it
fails on 5.15 and older, great, I don't warn anyone about that as there
was no Fixes: tag for me to know how far back it should go.

But if there is the "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")" line, I
_know_ it should also go to older kernels, and so I send the "FAILED"
email letting everyone know something went wrong and that allows those
developers who watch for them, to pick them up and potentially provide a
working fix.

So yes, it does bring a load of value to do this, please do it if you
know it.

thanks,

greg k-h

