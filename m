Return-Path: <ksummit+bounces-213-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC733ACEF0
	for <lists@lfdr.de>; Fri, 18 Jun 2021 17:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id C75293E10A7
	for <lists@lfdr.de>; Fri, 18 Jun 2021 15:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838622FB0;
	Fri, 18 Jun 2021 15:29:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA972
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 15:29:17 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id k189so2212534vkb.6
        for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 08:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tbwA+IyCm/NwRqK4N5oJ3bfkUBqvAezf/1PBaQCP7JY=;
        b=nDeccgr3SUuDvWLdhA5jvgaBYv6MdKMjzl/VnnTKmn9ynywy9l7lVjJPifAIw0okfy
         mllnJ91ubPsuxdOSnVw9kpULtIwXJcObSsy4O6h7YFha3Tso6mrsuOkdfzcruahcCIEu
         kmdv5a5YKQf/y3AkaWWFc3RPQYs6vOAqSQHgwmv/t4hRn9goCKd40ZDJTibAuJC7Y6d5
         EzinqHGn33bTXI7g49AYj7h/G3gsP540Pst+qrSkkztAXps3QvyfM8FIoE5LHXG487J+
         VBIsLNXurmtSspSNp3ZGKM6NU9rh6Nvffqi5qWe11C+/vAbya5jV1VTdqhmaRU2okmCg
         HVHA==
X-Gm-Message-State: AOAM533qE7jpLPaolZAHU1Z/U/rtakzG7A11xo9RD1tzdf8KO1hChmWV
	0IR0naMVksNRW/t8eWXpafJpPQs4YuNj/m56S24=
X-Google-Smtp-Source: ABdhPJxEmFJfAgHdVEc+LB6mHSUHXYmYvJXtX7mWpBI0zcQ/6Lnom0KNtzfTrxWWH15izbyVI9mkUGQnhQl2V6QtMjM=
X-Received: by 2002:a1f:1a41:: with SMTP id a62mr6774027vka.5.1624030156104;
 Fri, 18 Jun 2021 08:29:16 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local> <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
 <20210610152633.7e4a7304@oasis.local.home> <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
 <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com> <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
 <CAMuHMdVcNfDvpPXHSkdL3VuLXCX5m=M_AQF-P8ZajSdXt8NdQg@mail.gmail.com>
 <20210618103214.0df292ec@oasis.local.home> <CAMuHMdWK4NPzanF68TMVuihLFdRzxhs0EkbZdaA=BUkZo-k6QQ@mail.gmail.com>
 <YMy4UjWH565ElFtZ@casper.infradead.org>
In-Reply-To: <YMy4UjWH565ElFtZ@casper.infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Jun 2021 17:29:04 +0200
Message-ID: <CAMuHMdWqUkfe7kdBO+eQdXHzhpygH=TivOBNqQJujyqP=wM5cw@mail.gmail.com>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
To: Matthew Wilcox <willy@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"Enrico Weigelt, metux IT consult" <lkml@metux.net>, David Hildenbrand <david@redhat.com>, Greg KH <greg@kroah.com>, 
	Christoph Lameter <cl@gentwo.de>, "Theodore Ts'o" <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, 
	ksummit@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, 
	Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
	netdev <netdev@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 18, 2021 at 5:15 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Fri, Jun 18, 2021 at 04:58:08PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 18, 2021 at 4:32 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > > On Fri, 18 Jun 2021 16:28:02 +0200
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >
> > > > What about letting people use the personal mic they're already
> > > > carrying, i.e. a phone?
> > >
> > > Interesting idea.
> > >
> > > I wonder how well that would work in practice. Are all phones good
> > > enough to prevent echo?
> >
> > I deliberately didn't say anything about a speaker ;-)
>
> There's usually a speaker in the room so everyone can hear the question
> ...

Oh IC.  I meant that not using the speaker on the phone, there cannot
be any feedback from the phone speaker to the phone mic.

W.r.t. the other speaker in the room, isn't that similar to the normal mic,
and can't that be handled at the receiving side?
There will be a bit more delay involved, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

