Return-Path: <ksummit+bounces-138-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158A368DC2
	for <lists@lfdr.de>; Fri, 23 Apr 2021 09:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 6EE013E9049
	for <lists@lfdr.de>; Fri, 23 Apr 2021 07:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891E32FA4;
	Fri, 23 Apr 2021 07:13:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BB2FA1
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 07:13:55 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id k128so6908123vke.9
        for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 00:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j9Ic9W7mtZncUBVTMeBKySExuiDJv16P2Skp68R804c=;
        b=mIhUc2XP/eyzhkXprfTQIYvNM3DjNEvARsbAWtWnUEB/SjzQmc+gH28SHwMm3azjLV
         FeJ2OoG1K3z/c/fpZQqx9fXHQIuC0yQtocXZk0TjSEu/x9SmdeknPC4ZqZeq+SXwveIn
         qXEB5AklJuDHQfXnB8ZSOvfdTinYtt34S83sKYVR4qp7SAtlkNBbotgzxMO/PPjOCtwq
         RFG30cTbCzC7fce8bytcFOII9DdGOkOx+q0rlmLl4K3XmDdV69ELXAi1UNhT571Ey/GZ
         IPkZID2sCLuZmKfJ8EaZsN+MFiLQJdSdZHgbLDGFHms7hFActITCxLmq0rrp5ngZ195k
         qV1Q==
X-Gm-Message-State: AOAM532IZDC62NwpPkSWFWDGN/nuB1vc1TpNwqiIRVKQyL35z1aYrqzF
	YpblSLba8S9HpEZcccCWQxb5r2hh7LXETIQHpo3CG5fgXKQ=
X-Google-Smtp-Source: ABdhPJyJxFXiTUuyYH18h9vN/BedJUG+JIStKFxMdq78Ka5NymKgWTpoHwuwmIqJhnAf1/K9nTA5CycJt0x+seoFbtM=
X-Received: by 2002:a1f:5682:: with SMTP id k124mr2087150vkb.2.1619162034343;
 Fri, 23 Apr 2021 00:13:54 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal> <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com> <20210422132339.GF4572@sirena.org.uk>
 <20210422111939.0c555039@gandalf.local.home> <YIJmBvtU74D+N2DL@kroah.com>
In-Reply-To: <YIJmBvtU74D+N2DL@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Apr 2021 09:13:43 +0200
Message-ID: <CAMuHMdV5UxsHu9WyahuXAzCzP2k4wwrexA7g-pB4XyzctMcZ+Q@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Greg KH <greg@kroah.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Mike Rapoport <rppt@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Fri, Apr 23, 2021 at 8:17 AM Greg KH <greg@kroah.com> wrote:
> On Thu, Apr 22, 2021 at 11:19:39AM -0400, Steven Rostedt wrote:
> > On Thu, 22 Apr 2021 14:23:39 +0100
> > Mark Brown <broonie@kernel.org> wrote:
> > > > For me the most annoying is to get several patches from the middle of a
> > > > series. IMHO, sending at least cover letter to everyone is the bare minimum
> > > > so that people at least can take a look at high level details and request a
> > > > repost.
> > >
> > > Yes, the cover letter should always go to everyone.
> >
> > And that's still the one thing that quilt send-mail does not support :-p
>
> 'git format-patch --cover-letter' also does not seem to support this, so
> what tool does?

You can (manually) add "Cc: name <address>" lines to the individual
files created by "git format-patch", which will be used by
"git send-email".
I guess this can also be done to the mbox saved by "quilt mail --mbox"?

Alternatively, if you have format.thread in your git config, the saved
files will already have their final Message-IDs, so you can add to
all individual patches a lore link pointing to the cover letter.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

