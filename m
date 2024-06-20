Return-Path: <ksummit+bounces-1333-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA024910540
	for <lists@lfdr.de>; Thu, 20 Jun 2024 15:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F831F218DD
	for <lists@lfdr.de>; Thu, 20 Jun 2024 13:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38A41AE850;
	Thu, 20 Jun 2024 12:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="nYzg6Ams";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="GvhRruTx"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFE1ACE86
	for <ksummit@lists.linux.dev>; Thu, 20 Jun 2024 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888255; cv=none; b=ZURIbTrOF3hpzpUwl5DZoxTZY8MztUFcEqaMsde/X+D4iL3ic65j/SELtMtK4BM4dTZjzemYBRSW44s0gwufw6c7R2ZZMNYNQ6PxMxeGg2B6FjhEGSQ08tj6Dg1I2zIV2LWMLEVo7jpPuqBvn+X2ysiU+lUk/9oonhp9+FiEs5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888255; c=relaxed/simple;
	bh=hJotcYV0J8SP1WVfGTIAkEiVu5lmOrO0O5rCzSca2/U=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A4KuUA1w0Za/osFy1XSMplBMNJHf776TGvCRlzz3aQ7pQ5QXEjL6DrX+whBBMJZDqnBDW1fdUCXacc6+a4km8wLjztDt4AU9rxIAQBeUEHXGNEWoRuSNYPvwRirgE7k2Xy1oXzAsk51uJQX5E6PTJs0B8xK6Zhvls0opyK2dQM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=nYzg6Ams; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=GvhRruTx; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718888252;
	bh=hJotcYV0J8SP1WVfGTIAkEiVu5lmOrO0O5rCzSca2/U=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=nYzg6Amsys6NgyOpq7MQQvpqFL1X+1W7i589utTktr7TYgsIw20OFrM4/PSVLkEnI
	 URTWHOVuXwWaqC2mFPcmOzJFAcQO++AM5SLnL5HT01t7lI0b1sDuah0ri17W89vbLd
	 fvjVKu/dHRIZp5U5MRGdE5Mi5d5vgmuAMehqDp88=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 1D50012862F7;
	Thu, 20 Jun 2024 08:57:32 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id na1OKn_oj3JE; Thu, 20 Jun 2024 08:57:32 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718888251;
	bh=hJotcYV0J8SP1WVfGTIAkEiVu5lmOrO0O5rCzSca2/U=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=GvhRruTxwv6THKVj0UjL11VOG2LIdG4ioKEPlTLefs1K+APyNeAY9a5oQbr5fFxdb
	 ZToiohilxOyryPpbmrWhm6j3bYMaVkWtC+nWvUGrax3Tn+ZcRETAPNNw8dyRTVnQki
	 q40kbNjIQoccKxRW8kGwrBqDIRRp11R1f+rgk+cg=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6EF4012862D5;
	Thu, 20 Jun 2024 08:57:31 -0400 (EDT)
Message-ID: <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Thu, 20 Jun 2024 08:57:29 -0400
In-Reply-To: <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
	 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2024-06-20 at 12:32 +0200, Thorsten Leemhuis wrote:
> On 18.06.24 16:43, James Bottomley wrote:
> > On Thu, 2024-06-13 at 10:22 +0200, Thorsten Leemhuis wrote:
> > > Lo! I prepared four proposals for the maintainers summit
> > > regarding regressions I'll send in reply to this mail. They are
> > > somewhat related and address different aspects of one scenario I
> > > see frequently in different variations; so instead of repeating
> > > that scenario in slightly modified form in each of the proposals,
> > > I'm putting it out here once:
> > 
> > I think you're missing a piece here about how we actually find
> > regressions.  A lot, it is true, come from test suites running on
> > the mainline.
> 
> Sure.
> 
> > However, for obscure drivers and even some more complex
> > dependencies, the regression sometimes isn't discovered until it
> > gets into the hands of the wider pool of testers, often via stable.
> > 
> > This is important, because it emphasizes that zero regressions in
> > stable is impossible (and thus preventing backporting patches that
> > cause regressions is also impossible) if stable is the vehicle by
> > which some regressions are discovered.
> 
> Of course "Zero regressions in stable is impossible" as we are
> dealing with software. ;) And of course even with delayed backport
> for non-urgent fixes some problems would make it through.
> 
> But right now users testing mainline sometimes hardly have a chance
> to test and report problems with mainline in time to prevent a
> backport. Take Linux 6.7.2 (released 2024-01-25 23:58 UTC) with its
> 640 changes for example, where users had only 4 days to do so, as
> almost all of its changes had been merged for 6.8-rc1 (2024-01-21
> 22:23 UTC). FWIW: 200 of those changes were committed to some
> subsystem git tree during January, 363 during December, 70 during
> November, and 7 during October.

I did make this point here:

https://lore.kernel.org/all/7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com/

That merge window fixes should be delayed.  Not because I think a
longer soak in main would allow us to find many more bugs, simply
because it was causing reports in the merge window that weren't handled
because people had other things to do.  The reply was that they're
already doing it and when I looked, they actually started doing it for
the 6.9 merge window (so your 6.7 example is probably out of date).

> So if those 440 fixes could wait some time to be mainlined and were
> not important enough to get into 6.7 (2024-01-07 20:29 UTC) in the
> first place, why the rush backporting them to 6.7.y so quickly after
> the merge window?
> 
> All that leads to the related question "How many of those changes
> maybe should have gone into 6.7?". And maybe even "Should we somehow
> try to motivate more people to try -next?".

Actually, if we got more people to try mainline we could perhaps find
more bugs.  Testing -next is problematic because its instability makes
things like bisection and update to next release difficult.

>  But those are different problems.
> And the situation regarding the first already got somewhat better
> from what I can see -- among others afaics due to me prodding people
> when the queue fixes for recent regression for the -next merge
> window.

Yes, that's why I was asking for stats on 6.9 and 6.10 where this delay
policy was apparently in place.

> >  Plus it also means that a backport
> > delay or cadence would actually delay discovery of some regressions
> > because the patches that cause them won't be seen by the configs
> > that run into them until they get put into stable.
> 
> And why is that a problem?

Because a regression we haven't found yet is still a regression.  If
all we cared about was minimizing the regression stats, we could simply
not look for any of them.  But we do care about this, so we need to
support all our mechanisms for finding them and the point I was making
is that one such mechanism is the early backports to stable.  There is
probably a sweet spot backport delay for regressions we do eventually
find in main, but for regressions that others only find in stable (and
would never have been found in main however log we delayed) arbitrary
delays merely increases the time to finding them.

Perhaps one thing we should track with regressions is time to discovery
and also ask about ones in stable if they could have been found in
mainline?  That would give us more data for tuning the backport delay.

> > [...]
> > 
> > The other thing I think would help is better tooling and advice to
> > help reporters find regressions in stable.  What we do a lot
> > upstream is ask if they can reproduce it in mainline.  However, not
> > everyone is equipped to test out mainline kernels, so we could do
> > with helping them bisect it in stable
> 
> FWIW Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> /
> https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html
> covers this: users that notice a regression in a stable tree will
> bisect that tree. But before...

Some do, but realistically the best others can do is this bug was in
X.Y.Z but not in X.Y.Z-1 because they can't build their own kernels.

> > (note this can be time dependent: older stable
> > trees more naturally give rise to the question "has this been fixed
> > upstream" making mainline testing more of an imperative).
> 
> ...it does so, but tells users to try mainline for two reasons:
> * It might be fixed there already.
> * When Greg receives a regression report for stable he'll usually ask
> "is mainline also affected" anyway to figure out if this is something
> he or somebody else has to look into. And some of the mainline
> developer will ask this, too.

Again not saying that's wrong, just saying we must accept that some
bugs will only be found in stable and thus we could do with improving
our tooling to help stable users pinpoint the backport that caused
them.

James


