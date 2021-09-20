Return-Path: <ksummit+bounces-625-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61A411CBC
	for <lists@lfdr.de>; Mon, 20 Sep 2021 19:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 445431C0A64
	for <lists@lfdr.de>; Mon, 20 Sep 2021 17:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D032C3FCD;
	Mon, 20 Sep 2021 17:11:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BAC3FC0
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 17:11:38 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id r8so11671547uap.0
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 10:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i9wjl3VW7I76KDvYCT3HzL0qO3/KX+BihrPKQ7omPYY=;
        b=7JLX6aHSiPwxXEBtqgkN2tRAwa6KGGdJps523Yd46CoZ4UjnIbXRanatw1Qr/ftka9
         G/RqtONPgJIjXNYew3QcYAJA7qopM9rU5Tl6oBNqsON7BDR812F5BThuZ2Ut+75716Jb
         yAkgcmUnsZEtbtpu/U7Kh2pHy9kqYW4/3CQhoTHvH19ZGtDc82vqYUbS8ItZVMDIxcd6
         DsCcQnvyxNoyYb0io6xHUIBcYm3OV+YfI9HoC0m6b7WR9LMd4RjKEcq/8Gk7KppZdcIv
         MV2waYi5c9sMGCyvflujccIqu1lVHzHck9pgkYsf3GF25zRPb3RvLPSg8VqGG/sTCUqd
         gMsA==
X-Gm-Message-State: AOAM530xnGYXDQgz+DEAwnhei5t9UIxhjJAQVsEG7s8+uy3DEAFaOeww
	HQ/1ri5vCocJnYZmFuPQfGQGKB4RjJVva91RUaI=
X-Google-Smtp-Source: ABdhPJxx16fBt/8fMvA5rPzV3VejL+j6VTqCq+jaPvhscrlPxci3ZuQtiJiDqSWvN/jJ/G2jOBqAKLCW50s0vrqauKY=
X-Received: by 2002:ab0:6ec9:: with SMTP id c9mr14237488uav.114.1632157897537;
 Mon, 20 Sep 2021 10:11:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
 <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net> <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
 <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
 <bf22702e-01b2-214a-1650-da9e4ec3c2be@labbott.name> <20210920162329.GJ4192@sirena.org.uk>
 <5c88ae67-df7b-60ab-d087-bd244753c98f@labbott.name> <20210920164837.GK4192@sirena.org.uk>
 <ebcaac1d-9b97-81d9-28eb-eeb51c51673f@labbott.name> <20210920165716.GL4192@sirena.org.uk>
In-Reply-To: <20210920165716.GL4192@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Sep 2021 19:11:26 +0200
Message-ID: <CAMuHMdVOEDLPRNi7YEV0foz5CRTq_7BHKiQCQY2JjkH7-=ZE9Q@mail.gmail.com>
Subject: Re: [Tech-board-discuss] IMPORTANT: CIVS opt-in for Technical
 Advisory Board voting
To: Mark Brown <broonie@kernel.org>
Cc: Laura Abbott <laura@labbott.name>, Dave Hansen <dave@sr71.net>, 
	"tab-elections@lists.linuxfoundation.org" <tab-elections@lists.linuxfoundation.org>, ksummit@lists.linux.dev, 
	"tech-board-discuss@lists.linuxfoundation.org" <tech-board-discuss@lists.linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Mon, Sep 20, 2021 at 6:58 PM Mark Brown <broonie@kernel.org> wrote:
> On Mon, Sep 20, 2021 at 12:53:48PM -0400, Laura Abbott wrote:
> > On 9/20/21 12:48, Mark Brown wrote:
> > > How can I do this?  As (IIRC) Geert reported if you've activated your
> > > mail then attempting to activate again causes CIVS to report "This email
> > > address is already activated" with no link to any existing polls.
>
> > CIVS said it should give a list of all polls but perhaps that didn't
> > happen. I'll see if I can get it to resend.
>
> It gives a list of all polls on activation but it seems like it doesn't
> get that far on reactivations, it looks like it's generating an error
> refusing to activate again before it gets that far.

Do you get the list when following the configuration URL at the
bottom of the activation code email?

BTW, just got an email "Poll: Linux Foundation Technical Advisory
Board Elections 2021". But I've already voted before ;-)


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

