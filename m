Return-Path: <ksummit+bounces-447-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7A23D47E3
	for <lists@lfdr.de>; Sat, 24 Jul 2021 15:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0EA183E0ECD
	for <lists@lfdr.de>; Sat, 24 Jul 2021 13:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5302FB6;
	Sat, 24 Jul 2021 13:34:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71595173
	for <ksummit@lists.linux.dev>; Sat, 24 Jul 2021 13:34:00 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id x21so2651188vsx.5
        for <ksummit@lists.linux.dev>; Sat, 24 Jul 2021 06:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zpu0gLtlQlX388dclk8DmGz3HRFxdD6ZUpeAqJeCy2c=;
        b=sMSU67+M6pH+Mr1+TGyIs1Ky73OY4OclccpXr2hCXemA9nkuhyx9Wp4MEh4BIpwhPW
         uSkCBiOq6kX+diPnTRZPCpBYoG8S4hu2MKrBSXEgeFdjji8TjtHl9mb6Heaz2Vg0kRv6
         9OfHjr2LqbXfoYHQNfHzdVbNvBocQffBYzffoOiS5rl733y+6KlNMcCciKwIKVyqDYMW
         gsvxh4/gv411Pb2LwiEhkPV4P92zGVWBBtS7DH1X04PiT8sN2n6c9CYVuTzX5QLqVL5W
         uXSKE8otbuyvOtfc1VuSc8JUrK58DhM3KLuRwCC/ooMBzMeRE8KiakciiujSTVeTLKP5
         roJQ==
X-Gm-Message-State: AOAM5312/ca97/1cBqV/HP4i3T5L9HqWNLInMfjMZJz+wftccalAjMSR
	Z49e/ELdMPo0N1Ktj960nBc7ypXl+0Adg/6iQ9w=
X-Google-Smtp-Source: ABdhPJwgWY8n+8hejeRvRkg+JMvTwB+nZ3lF36p1aWtxgc5jLdF3bwPlvMJ+hbMGRah2vWJgxcx/n1nupdC+N66zd3I=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr8097151vsd.42.1627133639406;
 Sat, 24 Jul 2021 06:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam>
In-Reply-To: <20210723191023.GG25548@kadam>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 24 Jul 2021 15:33:48 +0200
Message-ID: <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ksummit@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Fri, Jul 23, 2021 at 9:11 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> These days we have disabled GCC's uninitialized warnings so it falls
> to static analysis devs to review all the new warnings.  I sometimes
> ignore warnings if they look like probably they aren't a bug.  Does this
> function allow zero size writes?  Does this switch statement really need
> a default case?  Maybe sometimes I miss bugs.

Yeah, I tended to find a few real bugs every release using the good old
gcc 4.2, before support for it was dropped.
I hope someone still runs modern compilers with GCC's uninitialized
warnings enabled again?

> Here is another example of something which I have a check for but I
> haven't pushed.
>
>         ret = frob();
>         if (!ret)
>                 return ret;
>
> This code is normally correct but sometimes it means the if statement is
> reversed and it should be "if (ret) return ret;".  To me returning a
> literal is always more clear but but clearly the original author felt
> "ret" was more clear...  It's only a few bugs per year so it's not a big
> deal either way.

To make it work well, you need to know if frob() and/or the current
function return an error code or not.  While you can use some heuristics
(e.g. is there any return -Exxx), perhaps we can add an annotation to
indicate if a function returns an error code, or an error pointer?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

