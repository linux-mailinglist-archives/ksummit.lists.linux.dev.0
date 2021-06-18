Return-Path: <ksummit+bounces-206-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6A3ACD80
	for <lists@lfdr.de>; Fri, 18 Jun 2021 16:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 2841C3E1111
	for <lists@lfdr.de>; Fri, 18 Jun 2021 14:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B072FB0;
	Fri, 18 Jun 2021 14:28:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA070
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 14:28:14 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id j15so5044288vsf.2
        for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 07:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpS6QroHuI0Ot0nY6i49aZuPyLqHan9IIfQa2dpKXgY=;
        b=EpNrDHLqzfT7bwoPG0Z+yl13n1PiArA7mfKa/HPLxP6hJwdtXiafxtz2WiSoIPe2tQ
         4bQxe+KjDh5x5LIh76hoWUqyO55LYco/AGrJAsgL0LzoGVFK2pZAcdpMQJvseOJP16dE
         amUWdujhXNLqdqhc7wr9JfaJRkwG/MODVwdzH0g5ckJeqbgjJcbNy5lVccDtFydu2oPP
         WA7RVQwVzWmSmIKRclRefVgiIspVb5ExbfuXfKrXjvGAYCjZaGZLhkuigGWvtn2A8wvO
         yyfU6wv630xOujYmScKqcLy/69PnisxNiZ4AbKicnk8SImQ1G/BJppEUIY9IGWMhAsxh
         H/YA==
X-Gm-Message-State: AOAM530BmEbWKJYBG2qSYzMJUoaqbxrK3J3goXvcG6PUHJ6Ed8Vw+J6Q
	vL2cn6sg/waePtKvIlqNLAA2Btw1ymZJOtepO75nmaL6A14=
X-Google-Smtp-Source: ABdhPJzdh6L1VpRsrh92eO3uJR1GKWcu3EWNO1w+Ez7YI5z7LoBIg3gSmZF2HB6Pv0YFaCrWrh9wQb1RBGmHtXwjJ0k=
X-Received: by 2002:a67:7787:: with SMTP id s129mr2392253vsc.40.1624026494097;
 Fri, 18 Jun 2021 07:28:14 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YIx7R6tmcRRCl/az@mit.edu> <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com> <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com> <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local> <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
 <20210610152633.7e4a7304@oasis.local.home> <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
 <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com> <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
In-Reply-To: <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Jun 2021 16:28:02 +0200
Message-ID: <CAMuHMdVcNfDvpPXHSkdL3VuLXCX5m=M_AQF-P8ZajSdXt8NdQg@mail.gmail.com>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"Enrico Weigelt, metux IT consult" <lkml@metux.net>, David Hildenbrand <david@redhat.com>, Greg KH <greg@kroah.com>, 
	Christoph Lameter <cl@gentwo.de>, "Theodore Ts'o" <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, 
	ksummit@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, 
	Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
	netdev <netdev@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 18, 2021 at 4:11 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Fri, 2021-06-18 at 16:46 +0300, Laurent Pinchart wrote:
> > For workshop or brainstorming types of sessions, the highest barrier
> > to participation for remote attendees is local attendees not speaking
> > in microphones. That's the number one rule that moderators would need
> > to enforce, I think all the rest depends on it. This may require a
> > larger number of microphones in the room than usual.
>
> Plumbers has been pretty good at that.  Even before remote
> participation, if people don't speak into the mic, it's not captured on
> the recording, so we've spent ages developing protocols for this.
> Mostly centred around having someone in the room to remind everyone to
> speak into the mic and easily throwable padded mic boxes.  Ironically,
> this is the detail that meant we couldn't hold Plumbers in person under
> the current hotel protocols ... the mic needs sanitizing after each
> throw.

What about letting people use the personal mic they're already
carrying, i.e. a phone?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

