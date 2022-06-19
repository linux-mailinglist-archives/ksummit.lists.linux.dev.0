Return-Path: <ksummit+bounces-667-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C1550CB6
	for <lists@lfdr.de>; Sun, 19 Jun 2022 21:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id B1C6A2E0A07
	for <lists@lfdr.de>; Sun, 19 Jun 2022 19:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E6733D6;
	Sun, 19 Jun 2022 19:08:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7123C7B
	for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 19:08:22 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id q4so1283098qvq.8
        for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 12:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzoWA0G5jxlkcRZIeVNLZAKCGcQYNqBC2xUBPGoWpTU=;
        b=Kz84V7VqPZmv0hYNLj4LxOYgqlyFTp1wP7wk+dDCUZu/OcPtqyv8m7f62NBuoOAJNf
         U5Ok63uoyXO0/JNsaKSNOaf0u4kknwdbx9pkTIuGiS2aRvq970SQjq3mmFegUszkUEpi
         0AUW62IVs9NpTgG6C1U8U11wUUkPv22hXaAmlQcmtHSH6duJ+zNTcWnlXO3WuZER2Olj
         yDNYfjU9G86bBEqTuW3IXhRPukVp+yoT7W4hexG3WEtLPIWhCPE6Drut6inekyq7QyjD
         akAC8Mx755TGJ3sK9mZGot4Z23J482zXDNeodng+TCxchEhpZwjLyMY9fitoGUW5hwMU
         mIAw==
X-Gm-Message-State: AJIora8ATjq3zbhQF157SX3ogYbW804NL9lkHU4p3M2K3fJN4YEKvDB4
	nSKDi8OfcByXgquEhKSYQ7y3k59i0xsY/w==
X-Google-Smtp-Source: AGRyM1ubqifbiUXXK4jptVVMOzNQMChFD/UKiwscvItSDeKxE2YQKgOj3sQ1KfD6qsjLqYUVgx+TOw==
X-Received: by 2002:a05:622a:3cd:b0:305:321b:c870 with SMTP id k13-20020a05622a03cd00b00305321bc870mr17035184qtx.190.1655665700980;
        Sun, 19 Jun 2022 12:08:20 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id v8-20020a05622a130800b002f9114d2ebcsm9443108qtk.17.2022.06.19.12.08.20
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 12:08:20 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3178ea840easo43778767b3.13
        for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 12:08:20 -0700 (PDT)
X-Received: by 2002:a81:3a81:0:b0:317:7dcf:81d4 with SMTP id
 h123-20020a813a81000000b003177dcf81d4mr16072677ywa.47.1655665699902; Sun, 19
 Jun 2022 12:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com> <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com> <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com>
In-Reply-To: <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 Jun 2022 21:08:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW02U7qdvGNqijyg_5NbJ3aKyCB8j26FjeAMR-aMY_bDQ@mail.gmail.com>
Message-ID: <CAMuHMdW02U7qdvGNqijyg_5NbJ3aKyCB8j26FjeAMR-aMY_bDQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Christoph Hellwig <hch@infradead.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Sun, Jun 19, 2022 at 3:49 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Sun, Jun 19, 2022 at 08:56:46AM -0400, James Bottomley wrote:
> > On Sun, 2022-06-19 at 13:04 +0300, Laurent Pinchart wrote:
> > > On Sat, Jun 18, 2022 at 11:13:59PM -0700, Christoph Hellwig wrote:
> > > > On Sat, Jun 18, 2022 at 11:42:07PM +0300, Laurent Pinchart wrote:
> > > > > All previous topics but this one are technical. To restore the
> > > > > balance a bit (and also because I believe it's important to the
> > > > > success of this project :-)), I'd like to also discuss the impact
> > > > > on the kernel maintenance at large, beyond just the maintainers
> > > > > who opt in to be early adopters of rust in their subsystem.
> > > >
> > > > Yes.  That is I think the most important point.
> > > >
> > > > I've played around with rust a bit for userspace project, and there
> > > > is things I like a lot like strict type safety and the ownership
> > > > model, and things I detest like verbose and unlogic syntax, the
> > > > cargo cult of vendoring libraries instead of a sane shared library
> > > > and versioning model (althought that should be largerly irrelevant
> > > > for the kernel), and compared to many other languages it seems
> > > > overall rather sane.
> >
> > This is more or less my assessment from playing with rust as well.
> >
> > > > But I'm really worried about the impact on the kernel, as interface
> > > > between languages are a real pain, and so far I'm not convinced at
> > > > all that this pain is worth the gain, even if that could change in
> > > > the future.
> > >
> > > One point I'd like to explicitly address, as it seems to be very
> > > relevant to me when it comes to whether or not the pain is worth the
> > > gain, is how we'll deal with the fact that the rust compiler will
> > > tell a non-negligible [*] part of the kernel developers that they
> > > don't have the skills to write kernel code. Will we have a credible
> > > option to offer there to help people improve their skills set, and
> > > how will we deal with the fact that some people will be left on the
> > > side of the road ? Or would we acknowledge what may be the elephant
> > > in the room that this would actually be a good thing for the kernel
> > > code quality ? What about the impact on a community that is already
> > > overworked and prone to burn-out ?
> > >
> > > [*] I have no way to quantify this at the moment, maybe I'm overly
> > > pessimistic, and the number will likely vary depending on areas,
> > > probably impacting BSPs differently than mainline.
> >
> > I don't think that's a huge concern.  After all rust isn't going to
> > penetrate every subsystem all at once ... and realistically it will
> > only penetrate some subsystems if there's the ability to review it.
> >
> > I really doubt anyone at the maintainer or reviewer level of the kernel
> > doesn't have the ability to learn rust (now whether they have the
> > desire to is quite another matter) and I'd be surprised if we can find
> > any kernel developer who only speaks C.  I think the biggest problem
> > with rust is that there's definitely an anti-C bias in the language.
> > What I mean by that is if you look at Java they chose to be as close to
> > C where possible to make the language easier to learn.  Rust seems to
> > have taken the opposite view and picked a lot of things which could
> > have been C like (typing, function calls, returns, mutability, etc.)
> > and done them differently just because they wanted to be different from
> > C.  That does cause issues for C people because you tend to trip over
> > the anti-C biases in the language and are constantly having to look the
> > basic syntax up.  This really increases the learning curve going from C
> > to rust, which gets annoying very fast, but it's not insurmountable.
>
> Time to invent a C-like version of rust ? :-) Jokes aside, as far as I
> understand the syntax is different from C because it was inspired by
> other languages, not out of a desire to be anti-C. I could be wrong
> though, and it doesn't really matter anyway, I doubt there's anything we
> could do there.

When reading "things which could have been C like", I had the exact
same thought ;-)

In the past, many new paradigms were implemented in a variety of new
languages, usually inspired by other languages (e.g. some looked like
C, others like Pascal).

At the risk of sounding too procrastinating (perfect is the enemy
of good, and see James' thread about becoming too fearful...),
perhaps it is wise to question if Rust arrived too soon, and a more
C-like language implementing the same safety paradigms is just around
the corner, or already in its infancy?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

