Return-Path: <ksummit+bounces-2909-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHPEAp6PzmkbogYAu9opvQ
	(envelope-from <ksummit+bounces-2909-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 17:47:42 +0200
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B6A38B6C6
	for <lists@lfdr.de>; Thu, 02 Apr 2026 17:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B307303F9D1
	for <lists@lfdr.de>; Thu,  2 Apr 2026 15:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CB23DFC98;
	Thu,  2 Apr 2026 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xj/xPcqb"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0481430F816
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144764; cv=none; b=nrg6vTlr8MOgoCcyzm6uMYO/cfMDtDgbl95MfOuZXnxnDFNt6+KcIa3dSIcWBe+SHrcP57OlWLrseQ/yRBh674iO9texjDUnFS1x0uuGI2wFypXYVBgMI1iCjgx1+SYLoBsG4qhPMH8J6e2dD30vc1Z7Ahu3foPi6c1LrS0Wml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144764; c=relaxed/simple;
	bh=zWd3M6DAygDPyZ6YO8jL0pFLnObIKs4gGvVsouuyO7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGPUlAnpsKnxln71UKIHtds9QFPk+CHqL6cj1okaqGCyECOORjoq2ulzVrVFOyZpciwzmHURMDp7yscx/e/f7QxcgMqxMwsLFVbwIsbwRu2h3mAAVB6Qn9jlo8p+U0qJayiQjPGwCobSqWIiSzrsESi0lv8YLtKG9xkzniwpB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xj/xPcqb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AB7382295;
	Thu,  2 Apr 2026 17:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775144669;
	bh=zWd3M6DAygDPyZ6YO8jL0pFLnObIKs4gGvVsouuyO7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xj/xPcqbxoBiV3nq9QIPKAPeIwBQcXo5kBg4PmUnUTFdp05UawspHWxGBNq2SIqYz
	 1BQa+JtKkpZ9yu6gvHztffSs6Q7c0QUXXrXrxCcUBnieCGYUdJbfw+jaemtrAga5Ap
	 cReLlwNHViKKV5Aq18nkO60WEMpFRfH8geU5jcTk=
Date: Thu, 2 Apr 2026 18:45:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
	ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla?
Message-ID: <20260402154552.GF3757725@killaraus.ideasonboard.com>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260402-expert-maroon-partridge-f77f94@lemur>
 <ef874caf-5345-4c0d-8855-1338b5177d8b@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef874caf-5345-4c0d-8855-1338b5177d8b@leemhuis.info>
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2909-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: E5B6A38B6C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 03:42:04PM +0200, Thorsten Leemhuis wrote:
> On 4/2/26 06:59, Konstantin Ryabitsev wrote:
> > On Thu, Feb 26, 2026 at 09:44:32AM +0100, Thorsten Leemhuis wrote:
> >> Lo! I wonder if we should slowly and publicly start decommission
> >> bugzilla in areas where it's not working well today. I have a few
> >> reasons for that:
> >>
> >>> It may be time to kill bugzilla:
> >>>
> >>>     - despite periodic "we're not dead yet" emails, it doesn't appear very
> >>>       active
> >>>     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
> >>>       5.2 development branch and continuing with 5.1
> >>
> >> * It looks like we will decommission Bugzilla anyway, and a replacement
> >> is afaics likely quite a while (years?) away
> 
> Seems we'll get there faster. Thx Konstantin!
> 
> >> -- so what is there now will likely be kept running for a while.
> > Thank you for starting the thread -- it's been burning a hole through my inbox
> > and I honestly wasn't trying to ignore it. :)
> 
> No worries, I from social.kernel.org posts in March had noticed that you
> were working on something, so I let things rest.
> 
> But this git-bug thing will take a while to get established. That makes
> me wonder if we independent of that should do what was partly discussed
> in this thread:
> 
> Change the front page text of bugzilla now to at least make people
> better aware that it might be a bad place to file bug (which even some
> kernel developers are not aware of).
> 
> > - anyone can go to a site like bugs.kernel.org, which will be a simple bug
> >   entry form of the style:
> > 
> >   1. tell us what happened
> >   2. attach any files you want to attach
> >   3. tell us how we can contact you (with round-trip verification)
> > 
> > - the report then goes into a review queue that can be pre-processed by an LLM
> >   to help immediately weed out non-actionable items: spam, reports for tainted
> >   kernels, reports for distro kernels, etc. The agent can reply with
> >   cookie-cutter answers to those with a suggested course of action:
> >>   1. Please report this to your distro here: {url}
> >   2. Sorry, we can't help you because you're running a binary-only driver
> >   3. This report is for kernel 2.6, what is even happening?
> 
> If you ask me, that's the wrong way around. We IMHO want an LLM that
> helps users to submit good reports directly. That is in the interest of
> users, as then they won't waste time on submitting something that an LLM
> later will reject quickly, which they'll rightfully find annoying. And I
> guess it will be less work and thus cheaper for LLM, too.

We would still accept bug reports generated without that tool, and
document what we expect from a properly formatted bug report, right ?

> The LLM, for example, could, at the start of the process, query (or ask)
> "uname -r" and ask "Is it a bug with a graphics driver for AMD or Intel"
> -- and depending on the outcome tell users, "You are at the wrong place,
> you have a heavily patched and outdated kernel, your want to file that
> at your distro" or "You are in the wrong place, you have to file that at
> gitlab.freedesktop.org/drm/".
> 
> In fact I started looking into something like that two days ago (by
> taking a closer look at Chris's review prompts and how sashiko uses them
> -- and how something like that can be used for a LLM assisted bug
> reporting process. But I need a few days to see if I get this to work well.
> 
> > - the agent can also try to figure out which subsystem this report is for
> >   based on the details of the report; this is where various tools to extract
> >   info from dumps would come in handy
> 
> Just wondering: what Richard posted in this thread (would you be willing
> to host that?), or do you have something else in mind?
> 
> > -- though I expect final human-based
> >   review will be required for this to be not waste people's time
> Yeah, but that is always the case at some point -- whatever we do will
> likely improve things for developers and users.
> 
> > [...]
> > - the maintainers can their either handle this directly via email without
> >   turning the report into a bug entry, or they can use the above described
> >   tooling to manage the bug report's lifecycle via git-bug/b4 bugs
> 
> There will be a email on lore in the latter case, too? Sounds like it,
> but I just want to be sure. Because it's already painful to search for
> existing bugs, as one has to search lore, bugzilla, and in some cases
> places like gitlab.freedesktop.org/drm/,
> https://github.com/thesofproject/linux/issues,
> https://github.com/AsahiLinux/linux/issues,
> https://github.com/Rust-for-Linux/linux/issues,
> https://github.com/multipath-tcp/mptcp_net-next/issues,
> https://github.com/facebook/zstd/issues, etc. Would be good to lower
> that number; in a ideal world we'd likely have a "bugs" mailing list
> where all of those external issue tracker automatically forward all
> newly submitted issues and later replies to.
> 
> > This is my "bird's eye view" proposal, and I'm happy to now refine this and
> > find a solution that would be actually useful to maintainers.
> 
> All that sounds like I can continue with regzbot (which we soon
> hopefully will rework to make it more useful for everyone) without
> stepping on each others toes and solving the same or similar problems
> twice? Because that would be a pity and a waste or rare ressources,
> which I guess we'd all like to avoid.
> 
> But regzbot afaics (and definitively correct me if I'm wrong) handles
> just a subset of bugs -- but does that in all the places (email, gitlab,
> github), which git-bug won't be able to handle afaics.  I see some
> overlap with bugspray (which seems to be still involved, am I right?),
> but I guess we might find a way to work together there.
> 
> Ciao, Thorsten

-- 
Regards,

Laurent Pinchart

