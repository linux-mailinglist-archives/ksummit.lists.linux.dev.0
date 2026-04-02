Return-Path: <ksummit+bounces-2900-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GucFg5tzmmpngYAu9opvQ
	(envelope-from <ksummit+bounces-2900-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 15:20:14 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B83898FF
	for <lists@lfdr.de>; Thu, 02 Apr 2026 15:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36AE630B4D80
	for <lists@lfdr.de>; Thu,  2 Apr 2026 13:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B073E4C6E;
	Thu,  2 Apr 2026 13:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="YIs5J7Bd"
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3840A3DFC6D
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135310; cv=none; b=NMJRsimmWMEs/u7FVFqOji/W86jLZg0PtjyJnNt/ACMWrqU4JoXVqVO2OWVwUW6RNa+bTOTBzm3xplQOZetJuviSoRc3JlNvDLJrQazAO5v4kqky3TyXGeJJztYJAMRTIOQUH3TBJUlVHl+Y4DLgsMbSsp+AN3ad7jmI0phPgfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135310; c=relaxed/simple;
	bh=VF9KHJgOoEM4QrIwq9zUZLUchJaW0fcXMZ6+Nok9ME0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAQAKb3iePV5q2Rck8qD+p3oNV2cfpAzMy90MDBkGW1hMwq+dwCaEuBFQ1ZTUmoxDfeVUo+udui51/rDN8l0Dzlks/Ie2bffisDfmUQXogyT4qGleGL/Btr/5h8n2nxAxx3FsuSxgmKzMs7wCrlHZwaV+hdRX0CudHg2XaPCo0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=YIs5J7Bd; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org (pool-173-48-112-174.bstnma.fios.verizon.net [173.48.112.174])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 632D8630017378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Apr 2026 09:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1775135288; bh=pPbfbklnQ+4ncgQ+th4v60FWzamzNYoC4ZCkPHLkZ3M=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=YIs5J7BdC0U3dEm/PVIb10SHBm0OpjQFYasdKXI5SrWkAumFXZ0pi4l9HpZGQqfOK
	 0AAkqDFRVy+HGmSi3KYvgNReJq0oat80IECn+ZulElvcXAqjOL6SiNNZVGCGlC1QbN
	 t38V+sphes1AL8S+RHeLF95abljkj9jIedtKOXrZsNAGfEWJ7Ak3ISGEOWLvm5RLaW
	 1XifsDshg0cQ6+PBemFNHbi4km+pkfAXRym0BlcABrBbqskxAQjy0wkgaxLoz55EJk
	 yEeMIyH3572dL93dcoI3dk0x7SZ7+ebiXUGsmeB9xFcwYDHtI8vzJvPXh15gZBvt9g
	 6KS77JYTIdsaQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 3D41A60D1759; Thu,  2 Apr 2026 09:07:06 -0400 (EDT)
Date: Thu, 2 Apr 2026 09:07:06 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, users@kernel.org,
        ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Message-ID: <20260402130706.GA15407@macsyma-wired.lan>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260402-expert-maroon-partridge-f77f94@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-expert-maroon-partridge-f77f94@lemur>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mit.edu,none];
	R_DKIM_ALLOW(-0.20)[mit.edu:s=outgoing];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-2900-lists=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mit.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: AE3B83898FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 12:59:46AM -0400, Konstantin Ryabitsev wrote:
> # git-bug
> 
> The git-bug project aims to keep bug tracking integrated into the git
> repository itself. It's not a new project -- it's been around for a while,
> though its development has been advancing in spurts. The fundamentals are
> sound and the design is robust. It's an active project with ongoing
> development:

The documentation from git-bug is not great from the perspective of
someone who is trying to understand the security properties of the
system.  But after looking at the architecture documents, I *think*
this is how it works.  Please correct me if I'm wrong, perhaps git-bug
can improve their architecture docs?

1) A separate git repository is used for the bug store it's not the
same git repo as the project where the project's sources are stored.
(Your use of "the git repro" in your first paragraph made me made my
eyebrows --- *surely* we wouldn't put the bug tracking information in
linux.git, right?  But looking at the the git-bug documentation, it
wasn't immediately obvious without my having to read way more
documentation pages than I would have liked.  From git-bug's
perspective, if they want to keep people from running away screaming
before giving it a fair shake, they should think about having some
high-level architecture documents that explains how this actually
works.)

2) The primary way that git-bug seems to be focused is that "bridges"
are used to sync status between some other bug tracker (such as
github's issue tracker) and the git bug.

3) You *can* create new bugs via the git-bug CLI, but this
seems... weird, since only a person who has write access to a git repo
can create a bug.  Sure, anyone can fork the git repo, and create a
bug in their local repo, but then in order to publish it, either (a)
you have to have credentials so you can publish to some publically
available bug tracker via a bridge, or (b) you can convince someone to
pull from your repo to get your new bug --- but that is going to have
to be a trusted source, because...

4) A git pull from some other bug tracking repo would completely
bypass any kind of anti-SPAM or quality checking.  This is much like
how a maintainer might trust doing a git pull from a submaintainer,
but the submaintainer has to be trusted, because doing code review
before doing a pull is... possible, but it requires a human being to
sanity check a pull and make look for red flags, but in general you
only pull from trusted repositories.  (Which is why I hate github PR's
as being a security disaster in waiting for Jia Tan style attacks, but
that's for another rant.)

5) If there are any data format attacks where a maliciously crafted
git-bug object can trigger some kind of security failure (SQL
injection, shell quoting attacks, ... the mind boggles), which can be
introduced either via a malicious issue that translates through a
bridge, or via a "git pull" from a trusted repository, this could be
used to attack either trusted infrastructure where the webui is
hosted, or a developer's development machine behind their firewall.

This is making me super nervous.

What am I missing?  How can these concerns be mitigated?

						- Ted

