Return-Path: <ksummit+bounces-326-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50143BF2DC
	for <lists@lfdr.de>; Thu,  8 Jul 2021 02:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CD4EF1C0EE3
	for <lists@lfdr.de>; Thu,  8 Jul 2021 00:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5062FAD;
	Thu,  8 Jul 2021 00:28:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34B470
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 00:28:00 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id o10so4895166ils.6
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 17:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M+ueQBsA3QJ4W+COpJ+xOg02LAI6imJ0tDkWYh5vqXQ=;
        b=iVZULAiGn15x0kblYJH2ptTusRlVpMuuhld1vNDIeZematLIQ0BvnP+Edl5ErydThr
         znOmOeLOzSyQv+ZFm7ykJpQ7hCjzOA8dGmwMMKjCGd8oI4FwVIabQItKpNj3NXQlUgfh
         fKmWGObeYbCUCVXsSig8A8IkBBdzm/g8f3FDOqid20SfRVfa9pDmBaro2PsH+zPLKJbB
         ya99K3e+ehiufGA79+IDX5i6dUODR7scbYiuc8g+JGyM2KR4millztH1k+nR37qF3G49
         HWVCvdPyHsrmCqIPIlOMojh5tAt/eewG9OLlHCNd8s5RjG1aRtL/31U7ziHGNPWW0ING
         ntcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+ueQBsA3QJ4W+COpJ+xOg02LAI6imJ0tDkWYh5vqXQ=;
        b=CyINgfecJPhs4KK0DCYQmPO2y8icvtskwCOLcOZlP5h7n/vQmKwMHJYuyst8Iq1TVz
         A119bWBjUORVqJvgF0lSfB+U/sjWx/+F7xjmpMeIHzYNXeAPZ4KbhXEFGha7/kSox64n
         c6HtyuP49fVIBSpSZEPnapQeHYaRfMUZk9cegHOh6SdCFE2DZ95+npSbX+yZC6ToX1ch
         i0AvZKIx49ubcGoGBiVTFzd4/gPK+zF6Gk2x3dDIfJ9UfvcrqFRHaprPpA+IWv+RX1ts
         F10cNNnb0DA1hoszuVsSizWDTiPqDRsbZuFSiTKn1c8jfbGsTsFv2usFCw9DmGuAptOn
         RXVg==
X-Gm-Message-State: AOAM533cRDsBZAhwseTrHPiltBcYJeoGJytP82wOiq5t7i0uLpxc1hYj
	XNYfDxtBs55FXWysJzwhoai24Xidm4ANWUMGGyM=
X-Google-Smtp-Source: ABdhPJwzWmwCbi0HBtpJ/AdzReEcL42HSsFaja81gn9CPG/jxuMz1Uvr206mbK+0ahgWNxUAmtkN7DxddhixZlTt7Xs=
X-Received: by 2002:a05:6e02:20ed:: with SMTP id q13mr20389562ilv.176.1625704079958;
 Wed, 07 Jul 2021 17:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org> <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org> <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org> <CANiq72nKao=rz89yajChtsM8Nvv2LM-xZfX+iwk686SDMhv5iw@mail.gmail.com>
 <YOYuCXKm3g1elu0t@pendragon.ideasonboard.com> <CANiq72=o5hKZyFqnGvd-3LeqjbR+JDsWhf=rJkimTKQSqf45pg@mail.gmail.com>
 <YOY7bJ2n67XVo5cG@pendragon.ideasonboard.com>
In-Reply-To: <YOY7bJ2n67XVo5cG@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 02:27:47 +0200
Message-ID: <CANiq72kD7BqTgzOdHALDjMDzBXpz56n13+=rDCzs5RuSnLWpcg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, Roland Dreier <roland@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 1:41 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> I don't think anyone ever claimed that C++ offers the same kind of
> compile-type checks that rust does, so there's no disagreement there.

My apologies if I have misinterpreted your claims (or those of Bart).

The thing is, claims such as "C++ is as safe as Rust, you just need to
use modern C++ properly!" are still way too common online, and many
developers are unfamiliar with Rust, thus I feel we need to be crystal
clear (in a thread about Rust support) that it is a strict improvement
over C++, and not a small one at that.

In any case, please note that I am not a Rust "fan" or "believer"
(somebody mentioned that word) -- if the C committee opens up to add
these kind of things, I will gladly work on that as my free time
permits. But Rust works, and it works today, and the language brings
many other things too in a fairly well-designed package (though it is
not perfect either).

> The discussion has drifted from rust in the kernel to features that C is
> missing and that make our life painful when it shouldn't be. Some of
> those features are fairly basic (such as features that would allow
> implementing RAII idioms with a syntax that wouldn't make all developers
> want to jump through the window), and available in multiple languages,

The C committee is looking into adding `defer`, so you may actually
get RAII in C ;)

They are also looking into adding lambdas (with a similar syntax to C++'s).

> This being said, I don't think C++ would be a particularly good
> alternative even for that limited goal, as there could be more drawbacks
> than advantages. Furthermore, if we're considering supporting a second
> language in the kernel, it would likely be best to pick a language to
> would bring us as many benefits as possible. Rust is a good candidate,
> even if I'm not convinced at this point that the gains outweight the
> costs (especially when it comes to the disturbance to the development
> flow, see the discussion in this mail thread about subsystem-wide or
> kernel-wide changes). Time (and discussions) will tell.

This is fair, thank you.

> Speaking of sweeter syntax, in the "if only I had a time machine"
> category, I wish rust would have picked a syntax closer to C when
> departing from it wasn't strictly necessary :-(

Interesting -- in which regard? i.e. it is actually quite close, their
designers were clearly going for something relatively familiar to
C/C++ programmers (at least in its current state, not the very early
design iterations of Rust).

Cheers,
Miguel

