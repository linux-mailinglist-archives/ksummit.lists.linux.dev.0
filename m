Return-Path: <ksummit+bounces-2837-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLusIDeHoGlSkgQAu9opvQ
	(envelope-from <ksummit+bounces-2837-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 26 Feb 2026 18:47:35 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7721ACD19
	for <lists@lfdr.de>; Thu, 26 Feb 2026 18:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9157F321A3DB
	for <lists@lfdr.de>; Thu, 26 Feb 2026 17:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BDA3290AE;
	Thu, 26 Feb 2026 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rToufFrH"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D8C3290B6
	for <ksummit@lists.linux.dev>; Thu, 26 Feb 2026 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125466; cv=none; b=e7ju3jySl9il1DHEvd54valAVigpVF84kWoytyu8eaV+Ad/31pTyHvF+wEFt3VASQnqTopnmFUiFmMn30ziLTlNqTLUnYfT3IVrjXxkib0I3Dg0TvbqxVe4RWUN2x3D1WbMSa7acIT/PprSPH73cMmiz/5beljqjjAiMrGlT8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125466; c=relaxed/simple;
	bh=ql/ryqnr7Ra//Kryt+L4SCW65ItqbKIb4ZDIJAvpgew=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O+YLliK4IA6j9/xdKlV8BdZ0NiRnhewH07/sywFH41QviViusqvqqzqMo+XkveOmY99p7sSUyPo6FzFVju4YTo9OfQot+8XoRG8mEawGl5QaiHNKFqcu8GLL9HBXzEwoOEyVPa7OFwb4tg0kubXWf0rJoQonnKuni2Lj3NRwgJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rToufFrH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE26DC116C6;
	Thu, 26 Feb 2026 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1772125466;
	bh=ql/ryqnr7Ra//Kryt+L4SCW65ItqbKIb4ZDIJAvpgew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rToufFrHPcObpH/hYBzy7TzmbUdAT1E4N6WHk2OXIqBKzMjZX01H6LGbS7rB+VFC6
	 PTnkuwhRCARPAe3a3w9wr+B34hJRe3Yk/4GFuXtS2K6it2+3SoBvvx4JX7fBSaZEky
	 OXJK7P1NwAqPU6Vr5IdgzBKnwsaUGUvnkR5OyKak=
Date: Thu, 26 Feb 2026 09:04:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Message-Id: <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org>
In-Reply-To: <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2837-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-foundation.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,linux-foundation.org:mid,linux-foundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 1E7721ACD19
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 09:44:32 +0100 Thorsten Leemhuis <linux@leemhuis.info> wrote:

> * Create a new front page that tells users that they most likely are in
> the wrong place. The text could look like this:

I think it would be best, please.  Bugzilla has never worked for us.

> """
> Welcome! Note: The kernel.org bugzilla is slowly being decommissioned!
> 
> This bug tracker is a kind of failed experiment, which at the same time
> still is useful sometimes and thus for now kept alive. Due to this and
> how vendors utilize the Linux kernel, you are most likely in the wrong
> place to report your bug.
> 
> To find the right place, check the Linux kernel's [MAINTAINERS
> file](https://docs.kernel.org/process/maintainers.html). Most of the
> time it will tell you to report bugs by email with some mailing lists in
> CC. Bugs with all the kernel's modern graphics drivers, on the other
> hand, [must be submitted to a Gitlab
> instance](https://gitlab.freedesktop.org/drm) – and a small number of
> subsystems want reports in issue trackers of dedicated Github projects
> or this bug tracker.

Perhaps point people at scripts/get_maintainer.pl

Or heck, add a front-end to get_maintainer right here in this web page.
People paste in a pathname and it spits back a bunch of email
addresses.

> For more details on this and reporting Linux kernel bugs in general, see
> the [official step-by-step guide on reporting
> issues](https://docs.kernel.org/admin-guide/reporting-issues.html#step-by-step-guide-how-to-report-issues-to-the-kernel-maintainers).
> It covers all the important aspects, including one that is often missed:
> 
> In case somebody else compiled your Linux kernel, you most likely have
> to report bugs to said vendor – like Linux Mint, Red Hat, Ubuntu, or
> SUSE. That is because the majority of the Linux developers only care for
> bugs occurring with kernels built from Linux sources that are pristine
> (aka "vanilla") or nearly so. Kernels using independently developed
> kernel modules are therefore just as unsuitable for reporting bugs upstream.

