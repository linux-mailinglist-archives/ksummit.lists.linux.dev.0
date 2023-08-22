Return-Path: <ksummit+bounces-1042-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722487838BF
	for <lists@lfdr.de>; Tue, 22 Aug 2023 06:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC4E2280F2F
	for <lists@lfdr.de>; Tue, 22 Aug 2023 04:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A231C07;
	Tue, 22 Aug 2023 04:12:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387917F
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 04:12:56 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c93638322so830059266b.1
        for <ksummit@lists.linux.dev>; Mon, 21 Aug 2023 21:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692677574; x=1693282374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tlA+SgM6f2ncqcUYMM0lLYe6OOM7Bpu2ICJB+0X1vrs=;
        b=j2OK332+UD7iBusTACdIAD5qn93DqE8GADI1iktmiW5Kvfp8mEyUhr7CCk9O/bt0cI
         JJJApTGXY0yWTHhsoQwrXYykpfkfgf1T0q8EA3g91nWbBKhgmx1gTxnd/xYMnT83I5yR
         stiq/Q0HfVv6Q5XhYPumv5c2V9NRFxae4ts0O3w26CsqaOPLzs4408JZ2OeGQ+9ssNMy
         BHzFPCARvgcs5oIoKXfWyd3aYTSCa1N35tL/TMAbm6y0tCGi0UjObOQzVTYrAbQPOjVT
         Cs5XFn1UEwOqmuzUugxo540TzCJItjiyR5JFjDBrcuTpjuT86ikVGYDMH+rnlYHCuHZa
         sYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692677574; x=1693282374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlA+SgM6f2ncqcUYMM0lLYe6OOM7Bpu2ICJB+0X1vrs=;
        b=SibXq/v54te6vQtF/lR/QckOyfJFJsZA9Q+qyx5xqPJoWQ2y+zQccSGWrzYzBt61TM
         9jmc+QjainHWlI6S8giHHWohP05UEJ1p9/oSAI0L3s/tzhMlstGfJfar+vHjZqjieWDC
         Bc1ZsOoT7G2M+f4EQ2eljXIbgn97BE396MagKhneELxGBL5Qh1ciVqx4SC3so5q1BmnQ
         /rFBHRB70nUvx9QwZKB8qgQQloffPQ4p0+T7ZnuKjMfsPkjLWWVjiHxdxBtMyo7mC9yz
         XbjnDF4+JnqcdU5Rx4ArEzPnpPBEFjSPs23J9V5ORJzrwCjFJ0x35fFlLGtRUzRN7s5F
         xUKA==
X-Gm-Message-State: AOJu0YxwejGgBSub/z1j6tVKtHG3KXnnpsMtNyETlzDVNC2eZ/OT4j5H
	bmASnSj6FQax3D6jqQmbwizHyuwCT+JRAWtiV24=
X-Google-Smtp-Source: AGHT+IFa9A2Dqb3QWo57kKcaXOkuTtgBst4rycRFvU2BoKCWZjv1QkMnqzEi0BF7cOyc6XskRvHSRFs/codELS0XssA=
X-Received: by 2002:a17:906:c116:b0:993:f664:ce25 with SMTP id
 do22-20020a170906c11600b00993f664ce25mr8719147ejc.19.1692677574150; Mon, 21
 Aug 2023 21:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816180808.GB2919664@perftesting> <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com> <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org> <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818080949.7b17b0d5@kernel.org> <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
 <CAKMK7uG68PV5MZLjZXNLxsfdweKVZwz2UW9fuG1vLBEi8600dg@mail.gmail.com>
In-Reply-To: <CAKMK7uG68PV5MZLjZXNLxsfdweKVZwz2UW9fuG1vLBEi8600dg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 22 Aug 2023 14:12:42 +1000
Message-ID: <CAPM=9txWhYKTu24yicdJ8NHjUus0=B0EPa0=E4v2f_Fxf81WaA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jakub Kicinski <kuba@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Aug 2023 at 18:50, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, 18 Aug 2023 at 19:07, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, 18 Aug 2023 at 17:10, Jakub Kicinski <kuba@kernel.org> wrote:
> > >
> > > I was wondering last time if we can do a run of short sessions
> > > where a few volunteers talk about their subsystems? Let's say
> > > 10min talking about
> > >  - current process subsystem uses
> > >  - "realities" / day to day challenges / problems
> > >  - how the subsystem is evolving the process
> >
> > I feel like we did exactly that a few years in a row, but it was
> > probably back before covid times, and probably when it was still
> > called the "kernel summit" rather than "maintainer summit".
> >
> > At that point it was mainly just the GPU and ARM people who were doing it.
> >
> > [ Goes back and looks at my old ksummit mails ]
> >
> > Heh. It seems we did it enough that during the 2018 discussion, we had
> > Daniel Vetter say "We don't need another overview over group
> > maintainership". I think most of this was 2016/17 or so, and then by
> > 2018 we had that "not again.." situation.
> >
> > But I suspect that all predates the networking people starting to do
> > the group maintainership (I think you started doing pull requests in
> > 2020?), so I guess you never saw any of that.
> >
> > I do think the whole "how to spread the pain of being a maintainer" is
> > very much the point of the maintainer summit, though, so I do think we
> > should revisit.
>
> I think hearing what the networking folks do would be rather
> interesting, maybe in a split format with a presentation for the
> entire lpc audience and then maintainer summit discussion with the
> small group. There's a lot more maintainers and area leaders than the
> 30 or so who can participate in the maintainer summit.
>
> For gpu not much really has changed in the process and approach, it
> seems to hold up the test of time. The one thing that's been under
> progress and might finally land is some CI integration with our
> gitlab.freedesktop.org infrastructure. We have that for years for the
> userspace side (including hw testing) and some kernel drivers, but not
> yet for the entire gpu subsystem. Which is pain because it results in
> a lot of duplicated work and stuff falling through cracks for no good
> reasons. I'm hoping that this merge window will finally have the pull
> with the initial thing (all contained in a dedicated directory so it's
> easy to delete in case it all turns out to be a big mistake).
>
> So there's really nothing to report from the GPU side, and I think my
> quote from 2018 still holds :-)
>

Yeah I think this is spot-on, our process works for us, I believe when
we've presented in the past, most of the feedback has been "why are
you telling us this? your process can't work for <insert niche
maintainer concern>."

But our process probably also relies on the fact that we have a
massive community that exists adjacent to the kernel and we can get
away with doing crazy shit because I've personally never been attached
to some OCD'ed niche email setup optimised for the mutt installation I
hand wrote that a lot of maintainers end up using.

I do hope we can get some movement on CI integration and possibly
gitlab merge requests next year, but again I'm not driving us there,
I'm mostly happy to adapt to whatever the community comes up with, and
act as the "I'll explain this to Linus" person.

Dave.

