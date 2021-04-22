Return-Path: <ksummit+bounces-53-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873D367F3F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 31CC23E4834
	for <lists@lfdr.de>; Thu, 22 Apr 2021 11:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72B52FA1;
	Thu, 22 Apr 2021 11:04:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB62F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 11:04:01 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id k73so44596906ybf.3
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 04:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qjTs4AqjLam+YkZ2KtvCRui2AqngoGKLnNt22W783oA=;
        b=O92Fp0G1DEPWYSj+a1XvJkfdWO5nCpI5TKQoKRPPbxY7MEhOYo7w26EPEk9vX11OqG
         mZGyRuki/mrXe3CBPf+/wwCp36JV+yL9F1PwKXBNlUKkk5MosHcN9Sb6hd48BUCjpPmH
         yyOKQzz2y2pwoR9+LQ34i/3PRMInbhtiJVHLpfHSu4bX5r6/tqInTs9d1smwdYhQPjpE
         dZ+4ZII7l0m4L2lz5RuakB4cZV7jCOBNZFDhzaw1J8Riwu5eU8jjqZslMxENVq2OPYIy
         Bg96GUeWX0k53l7T3Qyxt+AGv5z3t+uilbQAjyAh/zvGlOn4LM1y8Zs3to16oYQcDP5T
         DDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qjTs4AqjLam+YkZ2KtvCRui2AqngoGKLnNt22W783oA=;
        b=F1A+0279bZXBBZf1WGPu/0sFjH+Hs0eefInyL79vC+KkRoyCemnjAIm6SD0XMQd/EV
         cXBft75Cjnj6QDBxFHfZU9uUAtFx549i3+hfG3Y7Yvme5qWpW2UWpdQWaBsdsAi8ZOMh
         2eLr8MFwpbmH52VQpaGSU+ZkGvPodfeCGG/uFkak+/3i/xZCwsrxm5+MbjG2WA8Q80v7
         hexCoTp/9anPBvHAYcQk3uRBxHEIbxff9EDs/0vAbxi2QcPcveswNsjKuY/AX6at7ny6
         KS9tezj64nGzloJP/duugTcem4yr63+MLbfZ6YURJynELbHjoqXnmjWw7kC6fUzv7ahh
         700w==
X-Gm-Message-State: AOAM5307+c2aNZfVmcGwRbCzlM7CzsF/RXPB4nRm8rvboTwISsCNupH7
	P4a59kPh98voPyy0Kjs0Vc3TgCeWb0mUi+k/EC0=
X-Google-Smtp-Source: ABdhPJzd0PSdmkmHK0CMuD6lYWOK3WMd5vAovdgO+0e3MenlMlLz5yQH9PIRNMdp2eUr8OGPhu190f/kcokCBbE1ylk=
X-Received: by 2002:a25:d113:: with SMTP id i19mr3638724ybg.39.1619089440526;
 Thu, 22 Apr 2021 04:04:00 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
In-Reply-To: <20210422123559.1dc647fb@coco.lan>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 22 Apr 2021 12:03:24 +0100
Message-ID: <CADVatmM8Nrht+nWpP99WQSm8HtHimNkjmUFDjjRTmMjuB+401Q@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 11:37 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Hi James,
>
> Em Wed, 21 Apr 2021 11:35:36 -0700
> James Bottomley <James.Bottomley@HansenPartnership.com> escreveu:
>
> > I've long been on record as not really being a fan of trivial patches
> > because they can cause merge issues with current patches and introduce
> > bugs, particularly in older drivers, that don't get detected for a long
> > while.  However, the recent events with the University of Minnesota:
> >
> > https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> >
> > Have elevated the risk factor around trivial patches claiming to fix
> > bugs to the point where it looks like there's no such thing as a truly
> > trivial patch and they all need reviewing.
> >
> > Our policy in SCSI for a long time has been no trivial patches accepted
> > to maintained drivers, and I think that would be a good start if
> > adopted kernel wide, but I think the next policy should be no trivial
> > bug fix without a pointer to the actual bug report or report from a
> > trusted static checker.  This would likely mean we have to create a
> > list of trusted static checkers ... obviously 0day and coverity but
> > what else?
>
> I agree that we should have a "Rethinking the acceptance policy" talk
> at the Maintainer Summit, but it should cover a scope wider than just
> trivial patches. At least the patches I checked, sent from "@unm.edu"
> to media subsystem, they all looked good enough to be merged[1].
>

May I suggest that we have a separate tree for trivial patches like
the trivial.git tree that Jiri has and all trivial patches goes
through that tree. There can be a separate set of reviewers for those
patches who can work under the guidance of GregKH or others who are
looking at trivial patches on a daily basis for staging subsystem. But
I guess the question is where do you draw the boundary of a patch
being trivial or not.


-- 
Regards
Sudip

