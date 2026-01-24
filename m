Return-Path: <ksummit+bounces-2811-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y0a2HPJ0dGlI5wAAu9opvQ
	(envelope-from <ksummit+bounces-2811-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 24 Jan 2026 08:29:54 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D27CD0A
	for <lists@lfdr.de>; Sat, 24 Jan 2026 08:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2261C300AB20
	for <lists@lfdr.de>; Sat, 24 Jan 2026 07:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411E92853E0;
	Sat, 24 Jan 2026 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUBU07SC"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7913595D;
	Sat, 24 Jan 2026 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769239785; cv=none; b=jW0aj3pw0yoWao5SXCVVaEYMU30O3QbV6ujKwftq21q9bIDCLF8Xzk8AzQ5kd5xds9LuDzP9qQujk6UP1iIfYdxsHaemt2bcfrvMGeY3ECdeOL65mWYpIy8TnkzbU+MM+r5yVOZybqFGz7Vj2ZmOelh/DzHMym3QMpif91l8smE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769239785; c=relaxed/simple;
	bh=ST6IpVeWS3bpJyvYownQxuQCLcBaWzR7gY0tyXUyjaU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DRCLQ7XFMOAp8gW+2nE34H3AxBmdwU9XlZeIHTc7D0Z/gaVHxgZGWnGeovktUHckpuHn21JPApyd4H8r0XORB4sYQF4lWOSOnaNXNERxI47yzk+2CsPDaonm7LA/ZEQ81lupG4u+gCLZWPEHjk1XpIh5t8tR7owM2RWFMZKoIFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUBU07SC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5630BC116D0;
	Sat, 24 Jan 2026 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769239785;
	bh=ST6IpVeWS3bpJyvYownQxuQCLcBaWzR7gY0tyXUyjaU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PUBU07SC0C8LBXu88aFSwF7o2j9X7F63sA2lzh9qDlJvZt6lx727noP/6riS1xK66
	 9cCpAhPwIZuzhKqvmkJ0tBR6I626iwI1+dq/KzdqwRDdSLpN0GNt1qcxmGR6l40bLV
	 +W67XZD0j7Pn6LZDxVi/pn1AIAybdZo4XFNKhih30s5zqkWJ07pdcOjzWHhsMTjizo
	 BZGyunj/bprUBciY9gnyX7qk+ZLoTJx/KQeCTOC2vljiLLpzd7y/2GFdM+5VRhZ7mE
	 MwHCU/SOP77Yt+bMkqeZL6ktBCiIcBTpOp3M0e+HUgtim1p+++v7M3KNfaXjQkVusE
	 hxnZSxwjJYvEg==
Date: Sat, 24 Jan 2026 08:29:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: corbet@lwn.net, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 tech-board-discuss@lists.linux.dev, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook
 <kees@kernel.org>
Subject: Re: [PATCH] Documentation: Project continuity
Message-ID: <20260124082939.40715e13@foz.lan>
In-Reply-To: <20260124012256.1856709-1-dan.j.williams@intel.com>
References: <20260124012256.1856709-1-dan.j.williams@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2811-lists=lfdr.de,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:url,lwn.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: BB0D27CD0A
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 17:22:56 -0800
Dan Williams <dan.j.williams@intel.com> wrote:

> Document project continuity procedures. This is a plan for a plan for
> navigating events that affect the forward progress of the canonical Linux
> repository, torvalds/linux.git. It is a follow-up from Maintainer Summit
> [1].

The idea behind this document is interesting, but IMHO it is too
optimistic for a contingency plan ;-)

Conceptually, contingency plans are written to overcome all foreseeable
bad consequences that might happen. So, it should include backups
for each possible bad scenario.

> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Co-developed-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Link: https://lwn.net/Articles/1050179/ [1]
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  Documentation/process/conclave.rst | 41 ++++++++++++++++++++++++++++++
>  Documentation/process/index.rst    |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/process/conclave.rst
> 
> diff --git a/Documentation/process/conclave.rst b/Documentation/process/conclave.rst
> new file mode 100644
> index 000000000000..6a1234f54612
> --- /dev/null
> +++ b/Documentation/process/conclave.rst
> @@ -0,0 +1,41 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Linux kernel project continuity
> +===============================
> +
> +The Linux kernel development project is widely distributed, with over
> +100 maintainers each working to keep changes moving through their own
> +repositories. The final step, though, is a centralized one where changes
> +are pulled into the mainline repository. That is normally done by Linus
> +Torvalds but, as was demonstrated by the 4.19 release in 2018, there are
> +others who can do that work when the need arises.
> +
> +Should the maintainers of that repository become unwilling or unable to
> +do that work going forward (including facilitating a transition), the
> +project will need to find one or more replacements without delay. The

Perhaps it should mention that the "replacements" can be transitory,
e.g. something like:

	The maintainer replacements will have their mandates
	limited to the the period of time where the maintainers are 
	unwilling/unable to voice, if the situation is transitory.


> +process by which that will be done is listed below. $ORGANIZER is the
> +last Maintainer Summit organizer or the current Linux Foundation (LF)
> +Technical Advisory Board (TAB) Chair as a backup.

At the worse "hit-by-a-bus" scenarios, the plan may consider that neither
$ORGANIZER nor TAB would exist.

For such scenarios, I would add:

	If the $ORGANIZER can't be reached within 72 hours, any participant
	of the last Maintainer Summits can start the process.

> +- Within 72 hours, $ORGANIZER will open a discussion with the invitees
> +  of the most recently concluded Maintainers Summit. A meeting of those
> +  invitees and the TAB, either online or in-person, will be set as soon
> +  as possible in a way that maximizes the number of people who can
> +  participate.
> +

Due to the time between the last Maintainers Summit and the conclave,
I would add:

	The participants of the meeting shall still be actively contributing
	with the kernel over the two most recent kernel releases.

Also, it sounds reasonable to define a the minimal number of people
for the conclave (let's say 30). If the number is inferior, the criteria
would be to pick people from the former year and so on until it reaches
the minimal threshold.

> +- If there has been no Maintainers Summit in the last 15 months, the set of
> +  invitees for this meeting will be determined by the TAB.

I would just drop this paragraph. 

This text is meant to prevent any weird situation that might compromise 
the Kernel future. Making it dependent on having an event that could be 
controlled by outside forces to have happened in the last xx months
sounds a bad idea.

Also, if there were no kernel summit in the last year (*), TAB may not 
have its normal 10 members. It may even have zero elected members on its
worse case "hit-by-a-bus" scenario.

Also, on a scenario where TAB won't have enough elected members, a
LF contingency plan might be activated, leading to some weird TAB
composition, which could be filled with people that don't fill the
current criteria and may not understand the Kernel maintainership
processes.

For a contingency plan, all of above sounds a bad idea.

So, if we drop this paragraph nominating TAB as backup, the rule
would be to pick former Maintainers Summit invitees, which should
work properly.

(*) The text says 15 months, but the worse case possible scenario
    with one Maintainers Summit per year would be to have one event
    in, let's say, Jan, 2027 and the next year's one would be in
    Dec, 2028 (so, 23 months).

    Still, if we what happened in 2020, most events were canceled
    those days, including the Maintainers Summit: 

	https://events.linuxfoundation.org/archive/2020/linux-kernel-maintainer-summit/

    It is not absurd to consider we might have things like
    that happening in the future.

> +
> +- The invitees to this meeting may bring in other maintainers as needed.
> +
> +- This meeting, chaired by $ORGANIZER, will consider options for the
> +  ongoing management of the top-level kernel repository consistent with
> +  the expectation that it maximizes the long term health of the project
> +  and its community.
> +
> +- Within two weeks, a representative of this group will communicate to the
> +  broader community, using the ksummit@lists.linux.dev mailing list, what
> +  the next steps will be.
> +

> +The Linux Foundation, as guided by the TAB, will take the steps
> +necessary to support and implement this plan.

This sounds OK, but in this case we probably need a SoB signed by
someone that can legally sign in the behalf of The Linux Foundation.

> diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
> index aa12f2660194..492b808a6977 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -68,6 +68,7 @@ beyond).
>     stable-kernel-rules
>     management-style
>     researcher-guidelines
> +   conclave
>  
>  Dealing with bugs
>  -----------------
> 
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c



Thanks,
Mauro

