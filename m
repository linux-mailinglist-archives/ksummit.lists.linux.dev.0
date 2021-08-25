Return-Path: <ksummit+bounces-480-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C393F7AB2
	for <lists@lfdr.de>; Wed, 25 Aug 2021 18:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 9816D1C0F98
	for <lists@lfdr.de>; Wed, 25 Aug 2021 16:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FD53FCB;
	Wed, 25 Aug 2021 16:35:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5608D72
	for <ksummit@lists.linux.dev>; Wed, 25 Aug 2021 16:35:05 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id a4so69293uae.6
        for <ksummit@lists.linux.dev>; Wed, 25 Aug 2021 09:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=83OVBCnfk7sBlKxb4S0hG/dKOkZ6Z4IHGlU5t4vNnnE=;
        b=pEnEUxsol3DMFlvkjYCpHzcVICZgW1BlnsrxgBmwexXReor3SkqBeVBam9rZW2hbsA
         ckbTKcwRB84QH22lgiKKr60hZkmo949fsvaEd7vYcw2oll34wR9S1K6a0ELIS0Vq2HCW
         EUCNTcC5llK2d6zy6U7qx5jsZUCOArqnMmPJW/Su28A+QXI5DXj9GOvGWjhsBOzpJF7I
         fyfBO5xEP7E/RELDRBxzDUd6saLh/y0ks87NIwBQJ9M709/VwjWVpTWL3uYbIehtA+5Q
         aZ3PIUamCzsf94PbH6ZStT2JHYWsnThVa/WAYHwwHuqi9THiWGm2COZNZjIHsCwm7bgi
         Zmfg==
X-Gm-Message-State: AOAM5319wV3/er9i3fzfv20KQIp7hsgErDXA47JqtL5CAjiBBeGtSVVX
	N4PGSvSxpVVPBxd7nPwRQAPT9jRI3t3EA+XxUM8cue6B
X-Google-Smtp-Source: ABdhPJy5clPFNXhJoMuRuH6RJrg+novCLmNYnU787rBDzoCnquhEvfHnTLpAx4/T/rrqnrzIidoYgAHXTqLIqzBFirU=
X-Received: by 2002:a9f:35aa:: with SMTP id t39mr3004251uad.89.1629909304332;
 Wed, 25 Aug 2021 09:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a52baa8b-6743-7570-aaa6-411b5b13c8aa@labbott.name>
In-Reply-To: <a52baa8b-6743-7570-aaa6-411b5b13c8aa@labbott.name>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Aug 2021 18:34:53 +0200
Message-ID: <CAMuHMdXMbuFww73q3QgdroEYmWXe00rKsbd9pCgYd2zsuc06FQ@mail.gmail.com>
Subject: Re: Linux Foundation Technical Advisory Board election: call for nominees
To: Laura Abbott <laura@labbott.name>
Cc: ksummit@lists.linux.dev, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"tech-board-discuss@lists.linuxfoundation.org" <tech-board-discuss@lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laura,

On Wed, Aug 25, 2021 at 4:27 PM Laura Abbott <laura@labbott.name> wrote:
> Over the last year, matters tended to by the TAB include proposals for
> developer workflow improvement, overseeing the Linux Plumbers
> Conference, supporting the review of the University of Minnesota
> patches and more.  Minutes from TAB meetings can be found here:
>
>      https://git.kernel.org/pub/scm/docs/tab/tab.git/tree/minutes

It seems there are no minutes more recent than October 2020?
Are they just missing, or were there no meetings?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

