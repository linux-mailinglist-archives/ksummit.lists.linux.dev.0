Return-Path: <ksummit+bounces-82-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C2C36825C
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 9F2F23E68AB
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDD32FA1;
	Thu, 22 Apr 2021 14:20:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043A2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 14:20:33 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id w23so53255931ejb.9
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jkPYIsj817pR7egh4JpfEo++2XD6di1X6Sdt0Th0+v8=;
        b=t9Y2LU1gNaFESxdSP6LLYDPEYpeFkg5YMsAPzobdw+SqSvDxOcq4PsOiZyftJIh0mV
         NRHJvgRkaOKriTRxcw5F9Rj7f06j2qTNW589VjYMmpT+jVar3ZPtVTsD1IqjDImyBFyl
         lU9MET9y9mNlMwtxvl8EZW/GLUQ0CKW2W/JCQ2MZ/eWByj85p5ViVsoYj6cVbHLIxJu4
         Pw3hynn2ZJmZYR/snYaFWEu+lzosiGMQzHBvRMEqYshgFSY0E+/cujTDGr3pwbFxMEk/
         qi+3UV5W3WRWqJ2+hX4J6HrcxIrY+cjfciXpOQj2Ut8EWLLILL01kiqMAcsHxBfYmLwS
         Dqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jkPYIsj817pR7egh4JpfEo++2XD6di1X6Sdt0Th0+v8=;
        b=VH9bkwv5s5ETlcBIrf67M9RYKf+CgcJbcix2wYw23RxLttYS9XhTJ/rJFBIGbMJAH2
         8woOApl+dAfoS6I9uVMSXtAVFaxQpk7HYLOWuN271acILxJDdmzIAR9oxDOble5VvAZq
         r6tmZvx9XPy5uUhrlCTFOCxCHeegWoW7NSmSCVU2CMXA9KPfpb+je/mi5u0Hu269HtEF
         Nsfj+4H+rpJSTAF4l+CrLZjsHhdxCqgQbpCwRxfBo5uhpY7Pk4D/yugfdiJmR1c5Xi5U
         uvVgCeq6C6v6JRvjHH90AXGOALhkNpRRHBxdPAcs9UnDOoi2yAIZ33ghyHLppXSvLIEw
         mSXg==
X-Gm-Message-State: AOAM531hypm83UtgL6bndaanwHjvGSf4y1rF4oay01Pxamj+VOEjKmug
	qWDWiDNxcQmaQLhUHOqUrDWMA0QLBLeD+ST4P5YEK54=
X-Google-Smtp-Source: ABdhPJz2Ak93FzDDxJrmmsKW5XH9bxG+v5JhBBjrxAk3Gnka1vTDAz6fmjfy0otZ86oSxQGLlvvkoiMoT4k9A9+fCj0=
X-Received: by 2002:a17:906:7806:: with SMTP id u6mr3482083ejm.130.1619101231492;
 Thu, 22 Apr 2021 07:20:31 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal> <20210422112001.22c64fe9@coco.lan>
 <YIFfXTVMDmHwVmSR@unreal> <20210422092916.556e5e50@gandalf.local.home>
In-Reply-To: <20210422092916.556e5e50@gandalf.local.home>
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 22 Apr 2021 09:20:19 -0500
Message-ID: <CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Leon Romanovsky <leon@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 8:30 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Thu, 22 Apr 2021 14:34:53 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
>
> > > This is not a matter of bad practice. There are a couple of reasons
> > > why each patch on a series will have a different group of Cc, like:
> > >
> > >     - driver maintainers for each patch may be different;
> > >     - scripts/get_maintainers.pl will return a different Cc/To;
> > >     - patch series touch different subsystems;
> >
> > Like Christoph said, if it is unrelated send the patches as separated
> > series.
>
> Since I use quilt to send my patches, my only two choices are all patches,
> or individual ones with Cc. Some of my patches will need to touch every
> architecture. I'll Cc the maintainers of the architecture code, but not
> include them in every architecture patch. And because this code depends on
> other patches, I can not send them as individual series.
>
> I use to have issues with this, but now with lore, I can trivially find the
> entire thread and read it the whole story. IMO, it is no longer bad
> practice to Cc only a single patch is a larger series to a maintainer, for
> the one patch that touches their code. It's a "FYI, I'm touching your
> code". But because of lore, it's really easy for them to get the full
> picture.
>
> I much rather have my INBOX today be only patches that touches my code,
> then full series of patches that I really don't care about. Worse yet, I'll
> get Cc'd on a full series of 20 patches, where only one patch touches my
> code. The sad part is, I'm much more likely to ignore that series, because
> I'm added to stuff by get-maintainers for the strangest reason, and
> completely miss that there's a single patch in there that really requires
> my review.
>
> Please, just Cc me on code that touches something I maintain or listed as
> a reviewer (which is still a lot).

Unless the process of who to Cc or not is completely automated,
relying on submitters to do the right thing to give you the subset of
emails you want to see is never going to work. I have frequent
problems with folks not Cc'ing the DT list for DT patches, how hard is
that? I think the answer is making where patches are sent less
important and better/easier filtering from lore (which is coming).

Rob

