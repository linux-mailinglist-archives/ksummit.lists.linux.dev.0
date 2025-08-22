Return-Path: <ksummit+bounces-2215-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBB0B32227
	for <lists@lfdr.de>; Fri, 22 Aug 2025 20:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8F7E1D276C9
	for <lists@lfdr.de>; Fri, 22 Aug 2025 18:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033F72BE628;
	Fri, 22 Aug 2025 18:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0/qh204"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1912BE033
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886433; cv=none; b=Za4Oi2vkC33xcmtHbCWYNXLgd9VC6dQLdmsJzafK0yynsXwbwGZ+sKgN38q18LT/N+LYhko6YJjJLELUJ/KOAfU56moHF8o85twc1euOo3MCPntqrH4sL8RAWyHtreWCmu0haEtnX6UzGk013Kc3SWu8psF+z3C3I4JQfxwPD9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886433; c=relaxed/simple;
	bh=vU343fTAxgZmpgPZkktnORXe5EWIuSgLimMaZupOkQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsLws6+pUT4gYecTq/dYalJYTSsnHXXKbS5EHLDQ6kUsuhG44/w0I/ALgFpZYlxinOAeumETrzt8Yd0lVkbMknOmR2Hd0QfH5NLeifMYI+yLBRd6fcrTjsqVjT5v96yWp2bgRbyWNPNjF2rsptCaLLRE/x0voy+Rv0X4W5rqTDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0/qh204; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27F9C4CEF4
	for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755886432;
	bh=vU343fTAxgZmpgPZkktnORXe5EWIuSgLimMaZupOkQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J0/qh204A+4yfnTJ2NWo8b6v5sEJUk2J6Am+cWkIYuF7hk8eW6vHEeIfZv4DCg3e2
	 XRoXxlcezc/MkUUxB3/nLG8fEwQB5CLqXAEhpOZsS2+sOnHhn0sMM6O9Wnfh4XEHB/
	 vTlDpo/vsf+XBdF8EVTXikfB1BxWP/gKLcrKo75sdxv5jrBSwQNPOwt5bjpjZavgw7
	 u3mv8t+rBqapKK9qDQbTrVpI/OIKx/TA0yTS4MrKtM3MNnQJUiJg0gWTBGjU0CmmkS
	 FZV2D2loitmjwFdJg+1mTAPkv6gFS8xgH0eJZbjiH3m+PxhecWe/rTKCbEbT6aBi7R
	 xLJJfCWtZ2n+w==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e95230750ceso893921276.0
        for <ksummit@lists.linux.dev>; Fri, 22 Aug 2025 11:13:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZCk4qy+LnNfTxJ8t00bQpSxp83HU64P9EeooFnqFzqMN3PdA8EQECK9yDqxzNy0pkQ2J4A1YO@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0Zougjl+sBbJ6+bqI9+YtqdunR2/hpnF/Nm1asziRC98yir6T
	VpZyx09tYg+oXZqndGCsIUsZ8nlIZ5Oiq9QjPj7oduedM7/Kd1tF1nnPW8OqRhBB8kRPSPverNa
	/mdK8lfvUGPm+YAYV71om+pr9PNM04cHYFWfAK4BSTg==
X-Google-Smtp-Source: AGHT+IHhRf2TaqCZn/6kRt8XjIKqpaL9R5RJhn8UTmBo6Oybg2svLWl6m5S/cJDHVVyZbVAu3WydAGxqOV8Ga0ecPRc=
X-Received: by 2002:a05:6902:1891:b0:e95:11d6:258 with SMTP id
 3f1490d57ef6-e9511d6033cmr6400849276.16.1755886432211; Fri, 22 Aug 2025
 11:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aKgm+wisMipLqnL4@yjaykim-PowerEdge-T330> <aKihqI8PWLFL1b5i@casper.infradead.org>
 <20250822131022.4df59a60@gandalf.local.home> <aKisJJYL9LV20qzg@casper.infradead.org>
In-Reply-To: <aKisJJYL9LV20qzg@casper.infradead.org>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 22 Aug 2025 11:13:41 -0700
X-Gmail-Original-Message-ID: <CACePvbUYp7w68C8z_TeMhOJQ0hmWw1jkwy+D_Lb+N5WbmufAug@mail.gmail.com>
X-Gm-Features: Ac12FXyVtLiDu6js8Zea8UB6FyOKcVFb0xZCJLZ3n24tp2pC2drBWSymijPbbTU
Message-ID: <CACePvbUYp7w68C8z_TeMhOJQ0hmWw1jkwy+D_Lb+N5WbmufAug@mail.gmail.com>
Subject: Re: [TECH TOPIC] Per-cgroup Swap Device Control
To: Matthew Wilcox <willy@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, YoungJun Park <youngjun.park@lge.com>, ksummit@lists.linux.dev, 
	gunho.lee@lge.com, taejoon.song@lge.com, linux-mm@kvack.org, 
	David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 10:43=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Fri, Aug 22, 2025 at 01:10:22PM -0400, Steven Rostedt wrote:
> > On Fri, 22 Aug 2025 17:58:16 +0100
> > Matthew Wilcox <willy@infradead.org> wrote:
> >
> > > > Proposal:
> > > > I am developing on a restricted internal platform where there is a
> > > > technical requirement to use idle devices as extended memory.
> > >
> > > I don't think this is appropriate for the maintainer summit.  You
> > > can submit it to the Plumbers MM microconf [1] or LSFMM in May.
> > >
> > > [1] https://lpc.events/event/19/contributions/1995/
> > >
> > > Also you should have cc'd linux-mm for this kind of thing, adding
> > > it now.  Preserving the rest of the proposal for those who are
> > > interested.
> >
> > From Ted's original email: https://lore.kernel.org/all/20250805144357.G=
A762104@mit.edu/
> >
> >   Related to the Maintainer's Summit, the Kernel Summit is organized as=
 a
> >   track which is run in parallel with the other tracks at the Linux
> >   Plumbers Conference (LPC), and is open to all registered attendees of
> >   LPC.  The goal of the Kernel Summit track will be to provide a forum =
to
> >   discuss specific technical issues that would be easier to resolve in
> >   person than over e-mail.  The program committee will also consider
> >   "information sharing" topics if they are clearly of interest to the w=
ider
> >   development community (i.e., advanced training in topics that would b=
e
> >   useful to kernel developers).
> >
> >   To suggest a topic for the Kernel Summit, please do two things. by
> >   September 10th, 2025. First, please send e-mail with a subject prefix=
 of
> >   [TECH TOPIC] to ksummit@lists.linux.dev.  As before, please use a
> >   separate e-mail for each topic.
> >
> > So this appears to be appropriate.
>
> My mistake.  I thought tech topics were part of maintainer summit, not
> part of the kernel track.  It'll be up to the kernel track organiser(s)
> whether to accept it to that track or whether they think it'll be more
> appropriate in the MM microconf.

That is partly my fault as well. I suggest to YoungJun for the LPC
2025 in this email:

https://lore.kernel.org/linux-mm/CAF8kJuMo3yNKOZL9n5UkHx_O5cTZts287HOnQOu=
=3DKqQcnbrMdg@mail.gmail.com/

What I have in mind is extract as you said, the MM track Micro
Conference, and CC the linux-mm mail list as well. I forgot to mention
the details of the MM Micro Conference track part in my suggestion
email.

Anyway, is there any conflict to apply to LPC MM Micro Conference
track as well? Of course which conference to apply to is a decision
for YoungJun to make. I am just curious what options are available
now.

Hi, YoungJun,

If you decide to apply for LPC MM MC track as well, don't forget to
register yourself as a speaker on the LPC website.
https://lpc.events/event/19/abstracts/
The lower right of the page, there is a button "Submit a new abstract",
Click on that to start the process. Don't forget to select the pull
down menu MM Micro conference.

Hopefully see you in LPC then.

Chris

