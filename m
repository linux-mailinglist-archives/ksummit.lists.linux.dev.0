Return-Path: <ksummit+bounces-2901-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6De6JXBxzmkhnwYAu9opvQ
	(envelope-from <ksummit+bounces-2901-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 15:38:56 +0200
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089C389DE7
	for <lists@lfdr.de>; Thu, 02 Apr 2026 15:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 704C3304A205
	for <lists@lfdr.de>; Thu,  2 Apr 2026 13:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074033043DC;
	Thu,  2 Apr 2026 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dQXhWJLw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DD2DE6F1
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136542; cv=none; b=DWZKQyZ504v4W7t8jBRyo7SJIQipuDfqK6yjhxTiuIsEnyb4GI2is21BR6Ea/fRdqyZjP8zKKBv96tXTya5s2rJ2jEZ/K8a6DpM3cwaYyoewRzyUJ7KAMuX7seee/KCJzhuxmYl5zFBKe1GZbaE9AJTJujD92fMFTRWgiGIaSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136542; c=relaxed/simple;
	bh=FZ5k1hxSM7HRpFgRdxXN3KDE0QRPGPoA6VVJZEe45+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGfaonm/CqqNNMqjiKhVINFruJJcTBTAnufQc/ypCFwFNBuHATmw2I9nKsHJb9XQAAO2VI0AfI6s6WTv79sLKZgaa1q0Uplhv6MVXc/UBg64hRgZFXQeR3r07MI1GFLh1gqQ0DhNzpg32a70hG0mqF2IwppZfrZsKKS1ENI6pUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dQXhWJLw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99B8C116C6;
	Thu,  2 Apr 2026 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775136542;
	bh=FZ5k1hxSM7HRpFgRdxXN3KDE0QRPGPoA6VVJZEe45+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQXhWJLwYavSJ98DZgPyjQ3kYsMLwzI4PlV0qBfwhbTt4YroxMxn8PHitJx55oLdJ
	 dbhmI5dy6kEebFzNCQ1uGfKNT9Pu7oZgh7RGPEaOQn/S45sWIVOFni964yZye/mwlS
	 HA6818IHCJJKfbT2ewTdiwGSnks428DlEVZzrwoU=
Date: Thu, 2 Apr 2026 09:28:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Theodore Tso <tytso@mit.edu>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, users@kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Message-ID: <20260402-complex-ultraviolet-limpet-aea0bc@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260402-expert-maroon-partridge-f77f94@lemur>
 <20260402130706.GA15407@macsyma-wired.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402130706.GA15407@macsyma-wired.lan>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2901-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konstantin@linuxfoundation.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 3089C389DE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 09:07:06AM -0400, Theodore Tso wrote:
> On Thu, Apr 02, 2026 at 12:59:46AM -0400, Konstantin Ryabitsev wrote:
> > # git-bug
> > 
> > The git-bug project aims to keep bug tracking integrated into the git
> > repository itself. It's not a new project -- it's been around for a while,
> > though its development has been advancing in spurts. The fundamentals are
> > sound and the design is robust. It's an active project with ongoing
> > development:
> 
> The documentation from git-bug is not great from the perspective of
> someone who is trying to understand the security properties of the
> system.  But after looking at the architecture documents, I *think*
> this is how it works.  Please correct me if I'm wrong, perhaps git-bug
> can improve their architecture docs?

Yes, I can totally relate to that sentiment, but "scant docs" is definitely
not a problem unique to this project. :)

> 1) A separate git repository is used for the bug store it's not the
> same git repo as the project where the project's sources are stored.
> (Your use of "the git repro" in your first paragraph made me made my
> eyebrows --- *surely* we wouldn't put the bug tracking information in
> linux.git, right?

Right, let me clarify this. I don't expect that we'd be keeping *any* kernel
bugs in torvalds/linux.git. Kernel development happens on a subsystem level
and especially bugs are rarely relevant across the tree, so, in my mind, bug
tracking would be done per-subsystem. They can either use their own fork of
the kernel for this, or they can use a dedicated repo just for bugs.

E.g.:

    pub/scm/linux/kernel/git/mysubsystem/linux.git:refs/bugs/
    pub/scm/linux/kernel/git/mysubsystem/bugs.git:refs/bugs/

You can definitely keep the bugs in your main subsystem tree, as they are in
their own ref and don't impact the heads in any way.

> 2) The primary way that git-bug seems to be focused is that "bridges"
> are used to sync status between some other bug tracker (such as
> github's issue tracker) and the git bug.

That part we don't really care about, though if subsystems like, they can
bridge to a GH/GL tracker. The primary purpose of git-bug, to me, is to keep
bug data a) transparent, b) capable of fully replicating so it doesn't get
gated at a single-point-of-failure.

> 3) You *can* create new bugs via the git-bug CLI, but this
> seems... weird, since only a person who has write access to a git repo
> can create a bug.

That's actually the whole point. Only subsystem maintainers would be able to
create a bug. To *report* a bug, the reporter would use an ingestion frontend
as I described -- bugs.kernel.org or similar that would pre-analyze the bug,
create a bug report and *then* send the report to maintainers. A bug report
doesn't automatically become a tracked bug in git-bug unless the maintainer
then imports that report into their bug-tracker.

So, yes, only the person who has write access to the repo can create a bug and
that's by design. Everyone else participates via discussions that are synced
to the bug entry whenever the maintainer runs "update" on the bug.

The git-bug entry is simply for lifecycle/tracking/triage purposes.

> Sure, anyone can fork the git repo, and create a
> bug in their local repo, but then in order to publish it, either (a)
> you have to have credentials so you can publish to some publically
> available bug tracker via a bridge, or (b) you can convince someone to
> pull from your repo to get your new bug --- but that is going to have
> to be a trusted source, because...
> 
> 4) A git pull from some other bug tracking repo would completely
> bypass any kind of anti-SPAM or quality checking.

Not even part of the picture. The only pushing/pulling that happens is
between co-maintainers to their canonical repo and never from any other
source.

> This is much like
> how a maintainer might trust doing a git pull from a submaintainer,
> but the submaintainer has to be trusted, because doing code review
> before doing a pull is... possible, but it requires a human being to
> sanity check a pull and make look for red flags, but in general you
> only pull from trusted repositories.  (Which is why I hate github PR's
> as being a security disaster in waiting for Jia Tan style attacks, but
> that's for another rant.)

Hopefully that clarifies this concern.

> 5) If there are any data format attacks where a maliciously crafted
> git-bug object can trigger some kind of security failure (SQL
> injection, shell quoting attacks, ... the mind boggles), which can be
> introduced either via a malicious issue that translates through a
> bridge, or via a "git pull" from a trusted repository, this could be
> used to attack either trusted infrastructure where the webui is
> hosted, or a developer's development machine behind their firewall.

This, too.

> This is making me super nervous.
> 
> What am I missing?  How can these concerns be mitigated?

Regards,
-- 
KR

