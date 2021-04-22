Return-Path: <ksummit+bounces-93-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2B36835B
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 71F3E3E7209
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FF52FA0;
	Thu, 22 Apr 2021 15:31:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A7370
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:31:52 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id v3so49584630ybi.1
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wbt1mVnO/ThamIMTsX6wgU/x9POxzZTn5qD7H+gnEhw=;
        b=IjShQZdtzRMfSJPV7f+TiiJ0mhK8ZlQz9dWdzXDc6JHwYtRdl+UJ5Fx17Bfjj9zurm
         2TV9BaiWPLZYQRi0a0XYIP+gpOIUAv/kWsV2vEAVKS6pEHYfhfeNNrSeMef/czwwJpCG
         RJcTEQhc7nyzJzrDiOcvb43j9Mcqt9P4En87Hdvb8dq+aDSFOA9amWrsoqizes9kkx0y
         7Y6fzV+N6khs5qAL5yd1jFLPqRJWyUqII04xdTq0/9DWwmoAxsxAomtgjGDdgdvtXGSV
         LVHpISNVTq/bHya1gryxPs70BtTfIijNHmbczWCH59FhqVFo2s4ZQvZVuBaV2Xji4nj/
         S8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wbt1mVnO/ThamIMTsX6wgU/x9POxzZTn5qD7H+gnEhw=;
        b=ZYmvph2+38uKvHpRRIybfZ2obi1n6SW5PixTYwPXyXBO/YjX/ggbMY7xFjY/HP5CbS
         9G+fDiZ8SokOb9oAc6wAIZCtTor/e3uKTEPm8AhFbV5Jxi4B7zRUAw8Xewwn+QBq/CFv
         hTC/RpJnEJAqutNy06FdAbi9MpBByR/eQpbMzTPLYTVa2RAPrDhP+uj59vmZqADK+pWp
         AGX/ziKnSiMGhJe0l7afCqLwT4KmTmfx3AB6KYSZA9HaGr1hRhTcrry33zKgeQE445W3
         6b1M9iPac6bVFb7HFNRrKhhVS8iJPJEprcarsfNEIZ7t2fDav89bKnPh0XHWkH/V5mkQ
         DY8g==
X-Gm-Message-State: AOAM5335MmYPQdgM2aPktXnVWalB/Y1yTHqfLyAaSNLVe1UdMXWwdkiE
	otPXtu00V6aI+yb83aCN0zJmAzFuGt0/1lZU4oQ=
X-Google-Smtp-Source: ABdhPJwh5f0Mhn8KXopy6exGCvqK6O31YUbarGYD4xE3ymxc5RiVR4ToBzQfpSmwQRu09Xq1d5k14Mkma1O/stnKWTw=
X-Received: by 2002:a25:69ce:: with SMTP id e197mr5723492ybc.448.1619105511606;
 Thu, 22 Apr 2021 08:31:51 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan> <CADVatmM8Nrht+nWpP99WQSm8HtHimNkjmUFDjjRTmMjuB+401Q@mail.gmail.com>
 <20210422100021.1a3f143c@gandalf.local.home> <nycvar.YFH.7.76.2104221602590.18270@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2104221602590.18270@cbobk.fhfr.pm>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 22 Apr 2021 16:31:15 +0100
Message-ID: <CADVatmOy2vj8itMEJa_HL2tC-gGkOnXdHTCgBFntgW_uNOEk-g@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Jiri Kosina <jikos@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 3:07 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 22 Apr 2021, Steven Rostedt wrote:
>
> > > May I suggest that we have a separate tree for trivial patches like
> > > the trivial.git tree that Jiri has and all trivial patches goes
> >
> > Funny that you suggest something that we already have and you mention. Yes
> > Jiri had the trivial tree, but because it ends up being a lot of work, and
> > if the maintainer of that tree doesn't have the time to maintain it, it
> > becomes a dead end for those patches.
> >
> > It requires someone with a good enough reputation to maintain it, and that
> > means most people who have that reputation do not have the time to maintain
> > it ;-)
>
> Yeah, amen to that :)

I know, shortage of maintainers and reviewers.
I guess my suggestion was that all trivial patches goes via the
trivial tree and to have a group of interested people reviewing
patches which are submitted to trivial.

>
> That tree still sort of exists, I am collecting the patches that are sent
> there every now and then in big batches, and those which are still
> relevant by then I send to Linus afterwards.

I think this is a big blocker. Unless patches are applied to the tree
soon and added to linux-next, anyone creating patches based on that
tree and sending the patch might/will see the patch irrelevant.


-- 
Regards
Sudip

