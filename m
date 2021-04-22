Return-Path: <ksummit+bounces-104-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766BB36845D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 21F473E7B27
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581482FA0;
	Thu, 22 Apr 2021 16:06:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493C570
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:06:14 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id y14-20020a056830208eb02902a1c9fa4c64so6138540otq.9
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhBDtUdTrz/ItndSurfpAEvlVg0tL87TVWQV/exUqSo=;
        b=LrXYTDvly/VCUqd2yklTpWXggTNfwbnBi+q1WzfyTbmRuSrSfx+UcLZvndc6/6sbpN
         /dIOTWt9SfUwbJlENRDVsyZxUK16uEal9z62bixoGmu+9mqqg089N5Z65h5kRRC90vUR
         xe7zGBs/YFe4zhuGmYVkWVCnadYpsNOM6SLPe0IBPoPhdrANnYa6/Nm8Wqfy8aEe4FDl
         LcALZmY8vM4kTZXniC50GcSO2B2C9IjaH9umyqrMLnFOWAbFIYBY/syqsyIAXjloRg+u
         0PXYpdGAQz/TTp/268Na9EAmDIItN9tOumP8e5kVSu+cyQozB1C4dqZMw4G9mQXkwEqu
         GXSA==
X-Gm-Message-State: AOAM531yZgbttRuvFEKlVU0rD7MhpXkxmF03l4zWirtKhP0zorjVQn/N
	CXzLG8lQjnbswfIuCdARyw1nh3ccdTnGRpE8PvI=
X-Google-Smtp-Source: ABdhPJyXcuVZQ+G+6N7jE97ABDxsI5gS+pBBpMFKy+u3ZJn3LPjBdVnQeCwSmOtFLQu5PfwMKbNzEqZ1D2YB401YHvk=
X-Received: by 2002:a05:6830:1094:: with SMTP id y20mr3534008oto.135.1619107573584;
 Thu, 22 Apr 2021 09:06:13 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <20210422055948.GA4171859@infradead.org>
In-Reply-To: <20210422055948.GA4171859@infradead.org>
From: Roland Dreier <roland@kernel.org>
Date: Thu, 22 Apr 2021 09:05:56 -0700
Message-ID: <CAG4TOxP8ZjDYJn5eZmF28Niv6=cMcTMhwaOb8QkoZR0WReT9FQ@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Christoph Hellwig <hch@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 21, 2021 at 11:00 PM Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
> > I also think there does need to be a strong sanction against this UMN
> > research group, since we need to make sure there are strong incentives
> > against wasting everyone's time with stunts like this.  Hopefully on
> > the academic side it can be made clear that this is not ethical
> > research - for example, why did IEEE think this was an acceptable
> > paper?
>
> I wholeheartedly disagree.  Demonstrating this kind of "attack" has
> been long overdue, and kicked off a very important discussion.  Even
> more so as in this area malice is almost indistinguishable from normal
> incompetence.  I think they deserve a medel of honor.

I think everyone already knew bad patches could get merged.  I'm not
convinced Greg sending a giant pile of patches, some/most of which
seem to be reverting valid fixes and reintroducing bugs, is
particularly productive either.

In any case, academic researchers have an ethical obligation not to
experiment on people without informing them.  When CS research turns
into social science or psychology research, the researchers need to
follow well-established rules about research on human subjects.

In fact it's not clear what happened here - the UMN group has said
that their research was reviewed and approved by their IRB and was
designed and conducted so that no malicious patches ended up applied
to any git tree.  That may or may not be true but Greg's
(over)reaction seems to have generated a lot of unhelpful noise.

 - R.

