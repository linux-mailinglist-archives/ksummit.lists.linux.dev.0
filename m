Return-Path: <ksummit+bounces-108-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D4D3684C6
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id E3AF53E6E8C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181A62FA1;
	Thu, 22 Apr 2021 16:25:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2470
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:25:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 901FF6141C
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619108706;
	bh=r69uuCspI1AASSTHAsgqEhtHtLs9orLQhooHTmSU8os=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KZhLqNk/Jz3C5gqytvor9+q/9VRBkzBC6n/7CP5GzgiHyAM9eS8IDBAevRZHHYhZY
	 urFcHOLd7xRjvqk9dR1H0TcLbCPmzaZJYhoeiKpVpibdPpyg7yyioDwuyhfrlLNyrB
	 lca7Ff492i/o07c7ASGc71Vp+iDinvei2Sw4eL/Ch4nUtMQEkvrCHa9NwOxAHzdD1u
	 wi7ozjrrssMFelZreKIJAmwN9l3vSrsDehtEVLIXwfRbJHHI5VYtTFzjhduOG4U+AK
	 CHc3xiSBXKMgrBhvYzRdCF3KMaOhVziQZrDgfjVY/xXF1t75nuZhzwP9nz3xuXDTiM
	 VlbSDvXb19Cpg==
Received: by mail-ej1-f53.google.com with SMTP id x12so48936630ejc.1
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:25:06 -0700 (PDT)
X-Gm-Message-State: AOAM532JZ9xsPasZyoilQd4D83cma4+lzGtp4rSxA/XsDeg8/dx3SThO
	2TxE7byXXTBkFhJnf8N1qXIoDdH+McHvmkVsTNw=
X-Google-Smtp-Source: ABdhPJy5CQJzjrIABRQzA+M4+osy+fB34HQaNYdCSMTh45RsT2srdtGYf8oAEKtQx8WkCLcVowoXQC/Xh/8V3VBOOck=
X-Received: by 2002:a17:906:a385:: with SMTP id k5mr4264057ejz.148.1619108705055;
 Thu, 22 Apr 2021 09:25:05 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <20210422055948.GA4171859@infradead.org> <CAG4TOxP8ZjDYJn5eZmF28Niv6=cMcTMhwaOb8QkoZR0WReT9FQ@mail.gmail.com>
In-Reply-To: <CAG4TOxP8ZjDYJn5eZmF28Niv6=cMcTMhwaOb8QkoZR0WReT9FQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 22 Apr 2021 18:24:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdSY-BUSi_+1REYOR3+WmCa2mjK-t4acPXEPErQkP8tsA@mail.gmail.com>
Message-ID: <CAJKOXPdSY-BUSi_+1REYOR3+WmCa2mjK-t4acPXEPErQkP8tsA@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Roland Dreier <roland@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Apr 2021 at 18:06, Roland Dreier <roland@kernel.org> wrote:
> In any case, academic researchers have an ethical obligation not to
> experiment on people without informing them.  When CS research turns
> into social science or psychology research, the researchers need to
> follow well-established rules about research on human subjects.
>
> In fact it's not clear what happened here - the UMN group has said
> that their research was reviewed and approved by their IRB and was
> designed and conducted so that no malicious patches ended up applied
> to any git tree.  That may or may not be true but Greg's
> (over)reaction seems to have generated a lot of unhelpful noise.

There is a statement now from UMN:
https://cse.umn.edu/cs/statement-cse-linux-kernel-research-april-21-2021
"Leadership in the University of Minnesota Department of Computer
Science & Engineering learned today about the details of research
being conducted..."
so one could question their review and approval process by IRB.

That research supposedly did not commit anything bad but, as was
found, there were buggy commits from uwn.net. Maybe they were part of
other research, maybe not? And now how do you know that research
actually ended or that there is no new research (since it's secret
till not finished)? What assurances do you have that recent commits
were in good faith, if original trust is ruined and benefit of doubt
is gone?

Best regards,
Krzysztof

