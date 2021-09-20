Return-Path: <ksummit+bounces-615-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 604AF411899
	for <lists@lfdr.de>; Mon, 20 Sep 2021 17:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 2798C1C09AB
	for <lists@lfdr.de>; Mon, 20 Sep 2021 15:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04473FCA;
	Mon, 20 Sep 2021 15:48:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783CA72
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 15:48:20 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id l19so15684435vst.7
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 08:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XIrinN7AxFNslMU/oL1dAz4eVX1XxUFtIGJluVZ79A=;
        b=n3PjT6b+1zwDaq+ppO7j5aAgU68SB7MI294Gp9b9Rk4vhq1dhBFtequf33QrgwokhY
         JaD2fjkekdg+9mLOxms2D9QcAdE1nqM/Oj/00rta8886GFneFmv9GmrP0cV68mP/KIxG
         a1mlQ1Krq0UFsaeWhnbl7H8k2pII8ZO05i5bYnTXlBv7eLPxP5bZq35e3bKEvHfjIbuU
         Crcq8yR1F8czxYRGtWiDieCQVqQyEPkgSZCJiUhAT2vpN8ipnjNdnIUKuOceGeOLrJ/F
         6oMxjZgg1F+UUQpjcousFO+EzTcg1szAqYBlnn1jlgJeFRNNx+nV0bKHPnyVkPcz5uUZ
         O0/g==
X-Gm-Message-State: AOAM532MaUq0lYZ92Z5yFIxfQuPi24AQDPVZtZkS38cq+/1oGIoKGYZZ
	+onQLY/dKAKlXC/ErGCSLHyd7BpXWJo4/PRupEM=
X-Google-Smtp-Source: ABdhPJxjZKoTyAkMmmNlQd+SNmg4qFylQBCJHa8rcDR2Qu/ASVHuJgmD1OIQrevb6XFIQfkZEifsvrqMyWyq2m7atlM=
X-Received: by 2002:a05:6102:2417:: with SMTP id j23mr16612983vsi.35.1632152899468;
 Mon, 20 Sep 2021 08:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com> <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
In-Reply-To: <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Sep 2021 17:48:08 +0200
Message-ID: <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
Subject: Re: IMPORTANT: CIVS opt-in for Technical Advisory Board voting
To: Dave Hansen <dave@sr71.net>
Cc: Laura Abbott <laura@oxidecomputer.com>, ksummit@lists.linux.dev, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"tech-board-discuss@lists.linuxfoundation.org" <tech-board-discuss@lists.linuxfoundation.org>, 
	"tab-elections@lists.linuxfoundation.org" <tab-elections@lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 20, 2021 at 5:37 PM Dave Hansen <dave@sr71.net> wrote:
> My @linux.intel.com account is the most common one from the git logs.  I
> have only received one TAB-related email there:
>
>         Subject: Upcoming Technical Advisory Board election -- look for
>                  your ballot
>
> However, I never actually received a ballot at that email, presumably
> because of this CIVS opt-in issue.
>
> Was this just me?  Or would it be appropriate to send these opt-in
> instructions to all of those that should have received a ballot instead
> of just sending to the mailing lists?

I did the CIVS opt-in, and entered the confirmation number.
Still, unlike Vlastimil, I saw no way to vote?
Just retried the opt-in, "already opted-in".

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

