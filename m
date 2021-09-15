Return-Path: <ksummit+bounces-574-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 629D540C70D
	for <lists@lfdr.de>; Wed, 15 Sep 2021 16:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6DA131C0BF5
	for <lists@lfdr.de>; Wed, 15 Sep 2021 14:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8903FE2;
	Wed, 15 Sep 2021 14:06:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998473FD2
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 14:06:08 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id t19so1041461vkk.2
        for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 07:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m2WChWZGlQxsFYb5JrGN7t7fX8JCDCZT6o4viPHxy0o=;
        b=6RZeEKd7lp9mTseIoy2pR5RXTwkYqqtzaKYnXcgVOKD7DeLDscR5VG+wLCBqW03ybV
         iRBVSQPQbzYg8Ejpy7igEar2vwv8q1oqzp8FI3OIVhIgfX2x+IVwKFGiNNzC9eSL0+dx
         1qkhz+4iWWLRULm4lyIAU64PRL3IzNLNaGEnISh/sYh7v4XyyA/zwWC7+s0qII3pw3J3
         2NzfhfVw9HhztXox8zOlVfz5aDekQfocirJSogDniUe9MNT2mVqBXxeaVa1kO1GEIYR7
         QIpkjDa2ehMtp3ocw+dd/lBaPIZo29kb+K0K0Bs7dT6a69cuv5KmavAaJPpPVuDL29ct
         hOpA==
X-Gm-Message-State: AOAM533oMMLASI1jTHAZkjCL4sdoW3q4o3Av2DafBaP08fmP6C6BzLOZ
	+9I/h/ghUT0fXV6nTY2NVynNAU0eBOo/4FekA/w=
X-Google-Smtp-Source: ABdhPJwq88uag8sLUL0AAvEneG0eyseE6jdVcHHOoZVOoMhrvYMxKtjvnZFdumRCf3JC/GN0NhYm1F6kBQUNf2bP8S0=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr224041vkj.11.1631714766406;
 Wed, 15 Sep 2021 07:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a52baa8b-6743-7570-aaa6-411b5b13c8aa@labbott.name>
 <CAMuHMdXMbuFww73q3QgdroEYmWXe00rKsbd9pCgYd2zsuc06FQ@mail.gmail.com> <20210826074311.r2aumout2fvmncby@wittgenstein>
In-Reply-To: <20210826074311.r2aumout2fvmncby@wittgenstein>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Sep 2021 16:05:55 +0200
Message-ID: <CAMuHMdWx0C5bVdKEYQi-xgKF3LygGd95948_aK68vQOdQS9_Jg@mail.gmail.com>
Subject: Re: [Tech-board-discuss] Linux Foundation Technical Advisory Board
 election: call for nominees
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Laura Abbott <laura@labbott.name>, ksummit@lists.linux.dev, 
	"tech-board-discuss@lists.linuxfoundation.org" <tech-board-discuss@lists.linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 26, 2021 at 9:43 AM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
> On Wed, Aug 25, 2021 at 06:34:53PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 25, 2021 at 4:27 PM Laura Abbott <laura@labbott.name> wrote:
> > > Over the last year, matters tended to by the TAB include proposals for
> > > developer workflow improvement, overseeing the Linux Plumbers
> > > Conference, supporting the review of the University of Minnesota
> > > patches and more.  Minutes from TAB meetings can be found here:
> > >
> > >      https://git.kernel.org/pub/scm/docs/tab/tab.git/tree/minutes
> >
> > It seems there are no minutes more recent than October 2020?
> > Are they just missing, or were there no meetings?
>
> Hey Geert,
>
> Thanks for pointing that out. There definitely were meetings. It seems
> the minutes repo simply hasn't been kept up to date.
> I just brought this up and we will update the repo soon and I'll notify
> here.

Thanks, the minutes until June 2021 have appeared.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

