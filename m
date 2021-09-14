Return-Path: <ksummit+bounces-569-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 781D840B299
	for <lists@lfdr.de>; Tue, 14 Sep 2021 17:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 257EC3E1039
	for <lists@lfdr.de>; Tue, 14 Sep 2021 15:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA2E3FD3;
	Tue, 14 Sep 2021 15:10:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD18B3FD0
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 15:10:29 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id s125so3603780vkd.4
        for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 08:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cuyP4Y8XfTngDxn29BQzBWdn9DZaO3pf10OU5V2t5OQ=;
        b=0wBSnygm7JTsUWD2U9MBpUDRXwUFbuEcOZyZfpRUIPIaY97LuWe9XQwRuMvNIHKX2c
         KkVWyjqyq5MpQ5rj68SRKgGNiVdx3i5z8/dvlN0SAOhma7tua59UWw875dvjEH/FFrlD
         a2h2ukpa4EJb4QaVuhIcivVVhEqJmWJvW6MO4IqpvVLqhjLjPLd35XsB74uqO50KQ1dn
         6X96NoynVpwM+UUTJbnDFnqXyAkD8aNSuc9RCeaH5golrixP5KHpgPBncAvd/ssS/AQj
         yVC/w2pKTb0lzPxsrcoyWlbjut+ddsVOAlowQ4lapvqhkk74m5/8ajJxJsDrb7OL0XYa
         7cRA==
X-Gm-Message-State: AOAM532zcvauvwGw0348y9L8uBEbcOlAPJgv0SE60/Ko6OUv9DdYGDWb
	3UCXZ+2UN7S8HH9M3Ao2Vgd8HmX55pYaH2FRfIM=
X-Google-Smtp-Source: ABdhPJzajWkRhciOSkaNyfs2ZCQ8chTQeiis1Qp/oen2vHErXMl/rNFMHXO9xDGJjVMrETKRybDso7kRypnSnkGr8es=
X-Received: by 2002:a1f:9743:: with SMTP id z64mr304011vkd.15.1631632228819;
 Tue, 14 Sep 2021 08:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <877dfop2lx.fsf@meer.lwn.net> <YTvPAMT9FRCUeWjR@localhost>
 <878rzz2pby.fsf@intel.com> <CAMuHMdUfsQJiJ2eZJhroHTMbGbYfY0oAVYSvmUxsUHxUbz3MBw@mail.gmail.com>
 <875yv32oev.fsf@intel.com>
In-Reply-To: <875yv32oev.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Sep 2021 17:10:15 +0200
Message-ID: <CAMuHMdUtamk+EAEaogu+nCxjre+K75RyFiSGVWXs6232t=hE=Q@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Jani Nikula <jani.nikula@intel.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jani,

On Tue, Sep 14, 2021 at 5:00 PM Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 14 Sep 2021, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Sep 14, 2021 at 4:40 PM Jani Nikula <jani.nikula@intel.com> wrote:
> >> On Fri, 10 Sep 2021, Josh Triplett <josh@joshtriplett.org> wrote:
> >> > On Fri, Sep 10, 2021 at 03:00:58PM -0600, Jonathan Corbet wrote:
> >> >>  - What constitutes an acceptable user-space implementation in cases
> >> >>    where these restrictions apply?
> >> >
> >> > This seems like it'll always be a fuzzy line. The main issue: it's OK if
> >> > there are both open and proprietary users, but it's not OK if the only
> >> > open implementation is an outdated or token project that nobody actually
> >> > uses, that exists and is maintained solely for the purposes of placating
> >> > the kernel requirement. There's no easy way to define that line, other
> >> > than "we'll know it when we see it".
> >>
> >> One aspect of it should be easy enough: If you have an issue with your
> >> proprietary stack, but you can't reproduce it with the open stack, you
> >> won't get your fix in the kernel.
> >
> > Which basically boils down to the old mantra: before fixing a bug,
> > first add a new test case to trigger the bug.
>
> Oh, but then the question becomes, is it enough to add a reproducer,
> simplified from your proprietary stack, in your test asset, and then fix
> the kernel issue? Even if it's not a problem in your open stack at all?

I was thinking test ~ open stack.
I.e. enhance the open stack to reproduce the issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

