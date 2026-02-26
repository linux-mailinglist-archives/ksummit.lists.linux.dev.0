Return-Path: <ksummit+bounces-2836-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NfrJA1doGm3igQAu9opvQ
	(envelope-from <ksummit+bounces-2836-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 26 Feb 2026 15:47:41 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B9D1A7D6B
	for <lists@lfdr.de>; Thu, 26 Feb 2026 15:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A68B3048889
	for <lists@lfdr.de>; Thu, 26 Feb 2026 14:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59EE3B960F;
	Thu, 26 Feb 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE4FSspj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426683A7846
	for <ksummit@lists.linux.dev>; Thu, 26 Feb 2026 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116836; cv=none; b=XlRhkXxLCYxsBbbk7SC+8iiwZy4w3OKSLjBihlVCjUfVNrysLTw3O5MILkhieq9mpLii0NGjZRhZcPg8r2oEa8qhiAZQeGVX4ojBIk10tEcP/RtRzSUsncEprNiIcMjiWlyQt9cedvcbK9JCIXoiIiq5ReKTmNT/D9Pz+BvKKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116836; c=relaxed/simple;
	bh=kmi6xKGz6eGca9CtKR4FnMs2eonP0R+mnRpmri4Meq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kn2bIwKWwZYiakv+BdffmN6Wl1bltfyT8d0Q46GiM7ZeZgL/EEPf0l5QvqRxpp45hcWcW9Xp3q7HyyKrY0hrDJNuS1jBgPLbNLkynkLmF3Mn6YdUVtrzir7tSCEfmGK8tsHG3CQPiilI4EBfnuZRH9e5ChhkgQz7X+Ej/8Naj3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE4FSspj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DF6C19422
	for <ksummit@lists.linux.dev>; Thu, 26 Feb 2026 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772116835;
	bh=kmi6xKGz6eGca9CtKR4FnMs2eonP0R+mnRpmri4Meq8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oE4FSspj1mbASNDQb9IDE8iZ3ljUlt+mPafdA6N2V+VHOuaDDHFYu9I89dFgPwyBM
	 33fGGlHjRsIFz6+Ol9N+bYIC1tC7QUr2VqJgg/CzdMicLajHZuQT57V7TGVnzbMZVg
	 HK3WnZMl65D5Z+qynaXS+S3RU5s/oWNgJoSBNgnM7tBWp1hndTaFiCxwSXIc5bU3qS
	 PGKyZSqXk7vd03GH8v0BSVF0Zd/2EU3KgCfJYNf8N3D6YcZMvQFq2Hp/c2h1ZUdPW4
	 +mVcojDrIuVYIVhfXGjRE8EpvrsyN78DpNDdNuB8BLi116RozsPpcNwCEla6JdU0eh
	 NU/uO7hDVfKsQ==
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-823c56765fdso546771b3a.1
        for <ksummit@lists.linux.dev>; Thu, 26 Feb 2026 06:40:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5bPLprEnEOP+figBGfGoxZ8UDfHup9tGidgi7/ue+I4tQCyQGtiDEDvV5Yz6PNmBj6Bb11V4F@lists.linux.dev
X-Gm-Message-State: AOJu0YxpVB0k2479D9UuH0riZ8o95F1ZCou56yXEOLKMLwBGsYDZx/ZU
	S+0o7TWfJDAa2VQJFJasB8OjX7Fw2HLxXQLcAc36HAT1F52HlQuFi5HnPd7zfvOurUStsRvNXjr
	mp6FZfFFt6lbao0zazAccFW0SsdzifN4=
X-Received: by 2002:a17:90b:184c:b0:356:5cf2:eb77 with SMTP id
 98e67ed59e1d1-3593dab825fmr2462070a91.2.1772116835303; Thu, 26 Feb 2026
 06:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209-roaring-hidden-alligator-068eea@lemur> <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
In-Reply-To: <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
From: "Andrew G. Morgan" <morgan@kernel.org>
Date: Thu, 26 Feb 2026 06:40:23 -0800
X-Gmail-Original-Message-ID: <CACmP8UKXwW5smbnqEcymxND0e6eLKuOTWvEtxHSU2LLH9Wn4ow@mail.gmail.com>
X-Gm-Features: AaiRm50L43VH8lDscij_KKt016WpBTBg3f65beOAnkzskxGBsxc3_OZ5pSVU5nI
Message-ID: <CACmP8UKXwW5smbnqEcymxND0e6eLKuOTWvEtxHSU2LLH9Wn4ow@mail.gmail.com>
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling update)
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-2836-lists=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morgan@kernel.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: F2B9D1A7D6B
X-Rspamd-Action: no action

Just want to say that the 'libcap' needs for bug reporting are quite
manageable and I find are adequately handled by its component in the
kernel.org bugzilla. If we do migrate to something else, my only
request would be that we support some redirection mechanism - old
commit messages that refer to specific bug URLs can find their way to
wherever the new bug tracker has imported them.

Thanks

Andrew

On Thu, Feb 26, 2026 at 12:45=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.=
info> wrote:
>
> On 12/10/25 05:48, Konstantin Ryabitsev wrote:
> >
> > ### Bugzilla
>
> Lo! I wonder if we should slowly and publicly start decommission
> bugzilla in areas where it's not working well today. I have a few
> reasons for that:
>
> > It may be time to kill bugzilla:
> >
> >     - despite periodic "we're not dead yet" emails, it doesn't appear v=
ery
> >       active
> >     - the upgrade path to 6.0 is broken for us due to bugzilla abandoni=
ng the
> >       5.2 development branch and continuing with 5.1
>
> * It looks like we will decommission Bugzilla anyway, and a replacement
> is afaics likely quite a while (years?) away -- so what is there now
> will likely be kept running for a while.
>
> * Bugzilla at the same time since a few years now is known to not
> working well, as many reports (including good ones) never get a reply --
> among others because the list of products/components is not kept in
> sync, so many reports never reach the right developers (see
> https://lwn.net/Articles/910740/ and the second and third links there
> for the more complete backstory; things are afaics round about the same
> from what I see when occasionally looking at bugzilla for regression
> reports worth forwarding by mail =E2=80=93 and that is really hard to wat=
ch, as
> it feels bad to see people spending time on something that is most
> likely not leading to anything).
>
> * Statements like "Dear Deity, I do wish kernel MM bugzilla would just
> go away. Sigh." (akpm recently in
> https://lore.kernel.org/all/20260206121151.dea3633d1f0ded7bbf49c22e@linux=
-foundation.org/)
>
> "Slowly start publicly decommissioning Bugzilla" could look like this:
>
> * Prevent new bugs from being submitted against products/components
> where the developers/subsystems are not engaging in Bugzilla (either
> directly or through replies by mail). That would make people like akpm
> happy afaics. I'm willing to help with talking to subsystems and
> adjusting settings in bugzilla.
>
> * Create a new front page that tells users that they most likely are in
> the wrong place. The text could look like this:
>
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
> instance](https://gitlab.freedesktop.org/drm) =E2=80=93 and a small numbe=
r of
> subsystems want reports in issue trackers of dedicated Github projects
> or this bug tracker.
>
> For more details on this and reporting Linux kernel bugs in general, see
> the [official step-by-step guide on reporting
> issues](https://docs.kernel.org/admin-guide/reporting-issues.html#step-by=
-step-guide-how-to-report-issues-to-the-kernel-maintainers).
> It covers all the important aspects, including one that is often missed:
>
> In case somebody else compiled your Linux kernel, you most likely have
> to report bugs to said vendor =E2=80=93 like Linux Mint, Red Hat, Ubuntu,=
 or
> SUSE. That is because the majority of the Linux developers only care for
> bugs occurring with kernels built from Linux sources that are pristine
> (aka "vanilla") or nearly so. Kernels using independently developed
> kernel modules are therefore just as unsuitable for reporting bugs upstre=
am.
> """
>
> Sigh, too much text, but you get the idea.
>
> Ciao, Thorsten
>
>

