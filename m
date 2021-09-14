Return-Path: <ksummit+bounces-567-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E114040B1CB
	for <lists@lfdr.de>; Tue, 14 Sep 2021 16:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1FEA41C0625
	for <lists@lfdr.de>; Tue, 14 Sep 2021 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E843FD6;
	Tue, 14 Sep 2021 14:45:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C2B3FD0
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 14:45:15 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id g16so8799734uam.7
        for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 07:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bwVy2Yyiis0YTJPnjwfesUxwkKegdjA26+2JPFiXlNA=;
        b=1MkpiY6S2V6QkuvGUcX4w61TrTSRD0NvR93J0SGNx2h6vLZ191bt3qp0YAyNOmJRWH
         rhy7U3vMfxt281uMjxuJmaOCjq4HYnCZZe8m6RfWeVgt+hM0D1WExvhKTld0djWClh1O
         uPWaJc5mA46tpRmAy4nwAraR6KBhKe0c1R0U1ki555/5SskCBDjhEIBZqSMJvSiDFabu
         ONsSI1L22kCYQV99pDVtw4PoSSKwHTlMoLU4eLLWKRzycKSGHdzHA3r+om46Fq/kRV5o
         oGnGvhzMXr+HdFXA9JN9LX5ACdO9xvkUSO4a3SmhZGHYuxSY2M4Q6F9wxzjYQsM/TQES
         ++OA==
X-Gm-Message-State: AOAM533cREoRnKfOsaIOcfBhHfvqw4TbyPI6ORVWgUwrarNLf4P3TuoA
	jG4hZpgQKubvJLgZbc6mjsS1TQvNDYrWq2K7vug=
X-Google-Smtp-Source: ABdhPJwS1s9MfeAhlUlJbfjtg+MmvWooLwOyLjQPgNiiB+0a5tLw1oW5BeqtNX9sP5tM0aJ0JP1DVgPBpe/v23JDYCU=
X-Received: by 2002:a9f:35aa:: with SMTP id t39mr4490656uad.89.1631630713398;
 Tue, 14 Sep 2021 07:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <877dfop2lx.fsf@meer.lwn.net> <YTvPAMT9FRCUeWjR@localhost> <878rzz2pby.fsf@intel.com>
In-Reply-To: <878rzz2pby.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Sep 2021 16:45:01 +0200
Message-ID: <CAMuHMdUfsQJiJ2eZJhroHTMbGbYfY0oAVYSvmUxsUHxUbz3MBw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator drivers
To: Jani Nikula <jani.nikula@intel.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jani,

On Tue, Sep 14, 2021 at 4:40 PM Jani Nikula <jani.nikula@intel.com> wrote:
> On Fri, 10 Sep 2021, Josh Triplett <josh@joshtriplett.org> wrote:
> > On Fri, Sep 10, 2021 at 03:00:58PM -0600, Jonathan Corbet wrote:
> >>  - What constitutes an acceptable user-space implementation in cases
> >>    where these restrictions apply?
> >
> > This seems like it'll always be a fuzzy line. The main issue: it's OK if
> > there are both open and proprietary users, but it's not OK if the only
> > open implementation is an outdated or token project that nobody actually
> > uses, that exists and is maintained solely for the purposes of placating
> > the kernel requirement. There's no easy way to define that line, other
> > than "we'll know it when we see it".
>
> One aspect of it should be easy enough: If you have an issue with your
> proprietary stack, but you can't reproduce it with the open stack, you
> won't get your fix in the kernel.

Which basically boils down to the old mantra: before fixing a bug,
first add a new test case to trigger the bug.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

