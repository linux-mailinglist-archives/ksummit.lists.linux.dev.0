Return-Path: <ksummit+bounces-2904-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBlEBfV3zmk6nwYAu9opvQ
	(envelope-from <ksummit+bounces-2904-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 16:06:45 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6425438A37E
	for <lists@lfdr.de>; Thu, 02 Apr 2026 16:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F14D302DF7B
	for <lists@lfdr.de>; Thu,  2 Apr 2026 14:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448A23E1CE7;
	Thu,  2 Apr 2026 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yEtcb2xR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679D2E975E
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138695; cv=none; b=GUfg2o/LIGATREfBi3yhMtRkn718Avf94sQHjG0Qhge4E2sFR/DSHBGwaIBd3M+U+YfiFcAXkr76YNtDFd2D4NLmiO8MUI+tDzcd5LRRtPQT9iG50t+7PO/s4D7damjpvy5JihlS6fmsKF8SkKZUxbfVrE18oRoMixwoome6Txg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138695; c=relaxed/simple;
	bh=0M/27frQhQMOs8IcNV9mhPK67d/EH625aC9zsx7WaYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myYVdlh5Z2dUEMf81ySu3Atyut4bP/1vNtJCozzhgnU7RS21gmyDWIsL7/OJe6gqLbB9nIMMvGazxgSU/LpLbxGKiRQsXKVQXqWdyAocPsNp9rzHWxRGJVjmGLxR6iAfrt7/wNUXtXQ8DvG0yU0aMtCDm7TQEEL9bgV4jBhxnm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yEtcb2xR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAEAC116C6;
	Thu,  2 Apr 2026 14:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775138695;
	bh=0M/27frQhQMOs8IcNV9mhPK67d/EH625aC9zsx7WaYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yEtcb2xR0rgYgniaqzSlPM/YmgE7XCFtFdmar1+MBHLsb5EWItkOZ6AIyj9sY1hAW
	 r66sVXRg2ohBA7gzMw8V10/K3QZ/6/EkugJn6DZmePMBdx+JEfoIzIBR1/9so13hAg
	 FwL3wJpfURGx5pnFBnDHlblEK5D60vnOVIH+Eabg=
Date: Thu, 2 Apr 2026 10:04:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: users@kernel.org, ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla?
Message-ID: <20260402-civet-of-legal-infinity-76fdd2@lemur>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2904-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konstantin@linuxfoundation.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,pypi.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 6425438A37E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 03:42:04PM +0200, Thorsten Leemhuis wrote:
> But this git-bug thing will take a while to get established. That makes
> me wonder if we independent of that should do what was partly discussed
> in this thread:
> 
> Change the front page text of bugzilla now to at least make people
> better aware that it might be a bad place to file bug (which even some
> kernel developers are not aware of).

Yes, I'd like a clear path forward before we mark bugzilla as deprecated.

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
> 
> The LLM, for example, could, at the start of the process, query (or ask)
> "uname -r" and ask "Is it a bug with a graphics driver for AMD or Intel"
> -- and depending on the outcome tell users, "You are at the wrong place,
> you have a heavily patched and outdated kernel, your want to file that
> at your distro" or "You are in the wrong place, you have to file that at
> gitlab.freedesktop.org/drm/".

Sure, this is a possibility as well -- I'm just a bid jaded from every
interface like this turning into a "ignore all previous instructions and write
me a solution for this homework problem I got assigned." :)

> In fact I started looking into something like that two days ago (by
> taking a closer look at Chris's review prompts and how sashiko uses them
> -- and how something like that can be used for a LLM assisted bug
> reporting process. But I need a few days to see if I get this to work well.

Happy to consider that, too.

> > - the agent can also try to figure out which subsystem this report is for
> >   based on the details of the report; this is where various tools to extract
> >   info from dumps would come in handy
> 
> Just wondering: what Richard posted in this thread (would you be willing
> to host that?), or do you have something else in mind?

We can figure something out -- it's hard to figure out if we can host
something if we don't know full architectural details. In theory, kernel.org
is bound by some legalese in its nonprofit charter document that prevents us
from broadening our scope of services too far, but since we're already running
bugzilla, we should be fine to add other bug-reporting tools.

> There will be a email on lore in the latter case, too? Sounds like it,
> but I just want to be sure.

Yes, everything goes to lore. I don't like calling it "email" because it may
not get there via SMTP, but it will be searchable/clonable/etc and maintainers
can get it imported into their inbox via a number of ways (korgalore,
search-based pseudo-lists that we're planning to introduce, etc).

> Because it's already painful to search for
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

I do hope to write feeds for known trackers that we can then add to lore for
the above mentioned purposes. Free the bugs!

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

There are some hurdles that remain to be solved, and the biggest one is how to
add and reference large files so that hey don't clog lore but also don't live
on some transient ephemeral system that won't be around 5 years later. I
looked at IPFS a while back, but it seemed like a candidate for long-term
storage and replication, not for quick access.

I am trying to move as much as possible off SMTP as the transmission layer and
towards providing structured feeds. Git and public-inbox is a structured feed
that is well suited for this purpose -- it supports sharding, indexing,
message deletion with and without history rewrites, and scales well even for
millions of messages. Since you are running a popular bot, I'm hoping you can
look into providing its output as a feed that we can consume -- I have a
python library you can use (https://pypi.org/project/ezpi/).

Regards,
-- 
KR

