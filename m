Return-Path: <ksummit+bounces-2907-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJjvLt18zmnBnwYAu9opvQ
	(envelope-from <ksummit+bounces-2907-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 16:27:41 +0200
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E838A7F9
	for <lists@lfdr.de>; Thu, 02 Apr 2026 16:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2C85303D722
	for <lists@lfdr.de>; Thu,  2 Apr 2026 14:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB50F3DEFE5;
	Thu,  2 Apr 2026 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nj1gy1lo"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905630FC2E
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139704; cv=none; b=UisXK0kmR0pmCOh+ZZPzp1mZx19+VFbuEISuNUITsgVoPxmZeWFmFoAl/0gT5jdO7q9bev2vGeuf2aMYOuLIVibyW/c1Arkj0B80x/tMmFfoa9rQMEEB+Tw/L8TB5Uukf3Y43FdjMhCWa4fE/VlZB1wQqfSF5zbdPElAMi5vfAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139704; c=relaxed/simple;
	bh=z9jnx3hvyi8e+WoxCpuorwAsl6QZqRELRB6jCGcHz5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVJAUMW/22nmkM8c5t77ZtbVaUd/zrDOa0ey/KWHvHNOhDMT74mcVH6w5EIflNIJVR5mqXoNw2hr7F0VuBCze7o18dEVrUY1PRc7/7hxcpi8Q7+lKV874umDVImTSnKFq+Lv3Tl4azdYKG6jfXZwaHObspi9zOOdvGEwF6Rl3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nj1gy1lo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033EDC19424;
	Thu,  2 Apr 2026 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775139704;
	bh=z9jnx3hvyi8e+WoxCpuorwAsl6QZqRELRB6jCGcHz5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nj1gy1loinTalLdzZ5xzM8aEN3TtqtYU5AN7bf6Dd9WmBU/SFIEnzp5SSXTOBycEA
	 XxF3F0pKSVD6s3Y7bZxFxy7TyZCkfyqCdXe7oLZiyrsGGoOvXtv0N/RRGqae8UlW+1
	 92lJIOta+Diyf8aSBcKCwc3ug4yyFSmjQHK++PXs=
Date: Thu, 2 Apr 2026 10:21:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Theodore Tso <tytso@mit.edu>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, users@kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Message-ID: <20260402-eminent-loyal-unicorn-fb85fb@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
 <20260402-expert-maroon-partridge-f77f94@lemur>
 <20260402130706.GA15407@macsyma-wired.lan>
 <20260402-complex-ultraviolet-limpet-aea0bc@lemur>
 <20260402140822.GG15407@macsyma-wired.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402140822.GG15407@macsyma-wired.lan>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2907-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konstantin@linuxfoundation.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: D26E838A7F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 10:08:22AM -0400, Theodore Tso wrote:
> On Thu, Apr 02, 2026 at 09:28:58AM -0400, Konstantin Ryabitsev wrote:
> > 
> > Right, let me clarify this. I don't expect that we'd be keeping *any* kernel
> > bugs in torvalds/linux.git. Kernel development happens on a subsystem level
> > and especially bugs are rarely relevant across the tree, so, in my mind, bug
> > tracking would be done per-subsystem. They can either use their own fork of
> > the kernel for this, or they can use a dedicated repo just for bugs.
> 
> That makes sense.  Are you thinking that there might be some public
> interface that might allow users to search across all known and public
> big-tracking repositories to try to find "known issues"?

I'm not sure how actually useful this would be across the entirety of the
kernel. There are thousands of open bugs in the k.org bugzilla right now --
but I'm not sure you can call them "known issues."

I do intend to have a redirector that would keep track of all known bug ids,
so that you could refer to bug abcd1234 and we'd find it without you having to
also know in which subsystem this bug is tracked. I.e. you would just go to
bugs.kernel.org/abcd1234 and we'll redirect you to
git.kernel.org/pub/scm/linux/kernel/git/mysubsystem/linux.git/bugs/abcd1234 --
since we see all git trees, it will be possible for us to find the bug and
redirect to it.

The same interface could also give you some views like "all bugs reported in
the past N days" or "all bugs updated in the past N days" etc. However, that's
a secondary goal for the moment.

> > That's actually the whole point. Only subsystem maintainers would be able to
> > create a bug. To *report* a bug, the reporter would use an ingestion frontend
> > as I described -- bugs.kernel.org or similar that would pre-analyze the bug,
> > create a bug report and *then* send the report to maintainers. A bug report
> > doesn't automatically become a tracked bug in git-bug unless the maintainer
> > then imports that report into their bug-tracker.
> 
> If users have additional information that they contribute in response
> to clarifying questions from the maintainer, that would be tracked via
> an e-mail thread from lore.kernel.org, and it would be optional if the
> maintainer wanted to ingest some additional data that might be useful
> from the bug tracking perspective into the repo?   Is that the idea?

Yes, this is why we collect "how do we contact you" from the reporter and the
entire bug discussion can be viewed on lore. Syncing to b4-bugs/git-bug is
straightforward, but is entirely optional.

Regards,
-- 
KR

