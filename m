Return-Path: <ksummit+bounces-475-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B913D7255
	for <lists@lfdr.de>; Tue, 27 Jul 2021 11:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5F14D1C095B
	for <lists@lfdr.de>; Tue, 27 Jul 2021 09:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF3C2F80;
	Tue, 27 Jul 2021 09:50:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4270
	for <ksummit@lists.linux.dev>; Tue, 27 Jul 2021 09:50:23 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id t2so1911539vsa.11
        for <ksummit@lists.linux.dev>; Tue, 27 Jul 2021 02:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYQFR51tT+qjJ7Tr8DV91nArSADiXt0/9xbuY4nMBQY=;
        b=M5QoYbchjCEpSaCbmr2LylblAPx1GSKyyrsJyyZoZ84G9+UYajVSiJVlfQvERpOGYU
         bUcwL7npdEAGeSz8QaPsRGW0oGw8YfwO8qF5r98aX/qCuz8PSqtwja/Z76fNs9w4sm9m
         7vQrKUig1eayAJD1+TFPU55sKfJViqYS2f7BRQkMuoi2es0d6ixuvmrpQJI3d42n/tla
         TbmV/OSbT/tQXWphWi+S7kn9kUHEBv/0zytX0cJR0wG4uz7FPJHxnuromllY4DYkGElh
         FHtrAjhemHtiVMWFVidoYFpSSk2KRrR7z17U62ugvXrskXzWV1n8fgW42010BM7nyc0N
         QgAw==
X-Gm-Message-State: AOAM532hHaNFDq2M6YGYyJFKMgFqw5iumX42qDkCJDNxVwhlVPU8tuIQ
	tYpoLEs99iFWiHbGD769MlMlDZViy9oEqLQDzUc=
X-Google-Smtp-Source: ABdhPJwI5Jdq9HT1m86eB2Pkx8vP+Fe5fzRFb4i7u2ELdpT05RSNeLXTf6i7VzdX+Qk91P0n59+YAH4huR5Plux8OXw=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr15583869vsf.40.1627379422484;
 Tue, 27 Jul 2021 02:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <20210726155039.GR4397@paulmck-ThinkPad-P17-Gen-1>
 <20210727093808.GO25548@kadam>
In-Reply-To: <20210727093808.GO25548@kadam>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jul 2021 11:50:10 +0200
Message-ID: <CAMuHMdWmAppKge-7_1HAsw2a8XXOOZYDacaXiUFS4Ectnmx+og@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, ksummit@lists.linux.dev, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 27, 2021 at 11:38 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Mon, Jul 26, 2021 at 08:50:39AM -0700, Paul E. McKenney wrote:
> > On Fri, Jul 23, 2021 at 10:10:23PM +0300, Dan Carpenter wrote:
> > > Rust has many good static analysis features but if we wanted we could
> > > implement a number of stricter rules in C.  With Smatch I have tried to
> > > focus on exclusively on finding bugs because everyone can agree that
> > > bugs are bad.  But if some subsystems wanted to implement stricter rules
> > > just as a hardenning measure then that's a doable thing.
> > >
> > > For example, I've tried a bunch of approaches to warning about when the
> > > user can trigger an integer overflow.  The challenge is that most
> > > integer overflows are harmless and do not cause a real life bug.
> >
> > I would not want overflow checks for unsigned integers, but it might
> > be helpful for signed integers.  But yes, most of us rely on fwrapv,
> > so that kernelwide checks for signed integer overflow will be quite noisy.
>
> Since we use -fwrapv then even signed integer overflows are defined and
> I haven't seen a way that checking for signed integer overflows can be
> useful.

For all people using git grep and investigating: we don't pass -fwrapv
explicitly, it is implied by -fno-strict-overflow.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

