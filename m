Return-Path: <ksummit+bounces-734-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC255BF49
	for <lists@lfdr.de>; Tue, 28 Jun 2022 09:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 210692E0A85
	for <lists@lfdr.de>; Tue, 28 Jun 2022 07:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0DA633;
	Tue, 28 Jun 2022 07:57:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB97624
	for <ksummit@lists.linux.dev>; Tue, 28 Jun 2022 07:57:45 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id y14so18857312qvs.10
        for <ksummit@lists.linux.dev>; Tue, 28 Jun 2022 00:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RZhkIcBb0UvlKui7fnJ99Jd27Cnp4VrERsVVBH/lnJ8=;
        b=dKCL6uJ8NgPvTzsmvM0rrBkIt7U/XCu175HkdV9yL7JTwR3pBy5yuEJQh2vGD4OkH4
         0lIgjv9skAeCkyZ5WIYm0McgGgUFgftlpTztBRgq7jQ5kakmnaXR3j7N772dpoa1EKct
         IrDKH6C/oJ+7yMbqQwsTbzKTAY0j2Q+7Eo16k1Z/xsdqxJY+U4U6P59e7MP3a9Y+LRx2
         Zvxf4DGStAXl4nFaasGGLGGld80Dl2n+mlMyrfAbENMQApnhhLZuFvXNWNqcq7pAjBz6
         6D5o2yIvECZ4uvSQ0HeFz1yrckah4tt7Oj8mbRh/qJx3cLwOoENXgSEkdMFVPQyNMbCo
         qWuA==
X-Gm-Message-State: AJIora+IGZd4UvYfQxA+XTMg06j1Nx8Q07SQ/kN7EjeG9LGAo4nb0PtL
	90P+gd8KwdsFOvt+zV2UdVSOJ3kPLsqZ9A==
X-Google-Smtp-Source: AGRyM1t0Ntn/WpK/6mKIZHhXzceRsAyNuAiQBX7OisnZhgt8f5f9W/IY50d00unCQmKTHsqrWnmqew==
X-Received: by 2002:ac8:5ac1:0:b0:304:f656:6ad5 with SMTP id d1-20020ac85ac1000000b00304f6566ad5mr12133695qtd.116.1656403063796;
        Tue, 28 Jun 2022 00:57:43 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id j22-20020ac85516000000b0031778b5567asm6783422qtq.63.2022.06.28.00.57.42
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 00:57:42 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-318889e6a2cso108087197b3.1
        for <ksummit@lists.linux.dev>; Tue, 28 Jun 2022 00:57:42 -0700 (PDT)
X-Received: by 2002:a81:4fc9:0:b0:318:b0ca:4b13 with SMTP id
 d192-20020a814fc9000000b00318b0ca4b13mr20028428ywb.502.1656403062312; Tue, 28
 Jun 2022 00:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87sfo3nh3t.fsf@meer.lwn.net> <20220618092447.5ebed314@sal.lan>
 <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
 <963dd061-47ba-6f96-72e2-4f34cc952b8c@darmarit.de> <87fsjqyvlx.fsf@meer.lwn.net>
 <20220628084317.2f033ad5@sal.lan>
In-Reply-To: <20220628084317.2f033ad5@sal.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2022 09:57:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_EkQ8pSgJjrZtBXXkitRv2Wq+fP4wCnPmyvaPQO-kxA@mail.gmail.com>
Message-ID: <CAMuHMdW_EkQ8pSgJjrZtBXXkitRv2Wq+fP4wCnPmyvaPQO-kxA@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Markus Heiser <markus.heiser@darmarit.de>, 
	Jani Nikula <jani.nikula@intel.com>, ksummit <ksummit-discuss@lists.linuxfoundation.org>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mauro,

On Tue, Jun 28, 2022 at 9:43 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
> Em Mon, 27 Jun 2022 09:27:54 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> > Markus Heiser <markus.heiser@darmarit.de> writes:
> > > IMO It is unnecessary that the build-chain must run on all
> > > platforms and with all distributions.
> > >
> > > Who observes the Sphinx-doc & docutils development since (>15)
> > > years is aware that with various (old) Sphinx-doc & docutils
> > > versions no stable results can be produced, not without
> > > complicating the build-chain.  And this is exactly the situation
> > > we are facing today.
> > >
> > > The build chain of documentation has nothing to do with kernel
> > > development (at least in my opinion) and should be decoupled from it:
> > > maintaining one defined build environment is enough work ... this
> > > becomes especially clear if you (as Jani recommends) rely more on
> > > sphinx-modules and widely used tools.
> >
> > The counterargument to this is that we want as many developers as
> > possible to be able to build the docs and contribute to them.  We can't
> > complain that developers have broken the docs build if we don't do what
> > we can to help them do the build themselves.
>
> Agreed.
>
> > One of our longstanding contributors is on Sphinx 1.8.5:
> >
> >   https://lwn.net/ml/linux-doc/4c403239-3c71-4ab9-2168-f7e9d77008b2%40infradead.org/

Ubuntu 20.04 LTS also has 1.8.5.
Looks like I'll get 4.3.2 after upgrading to 22.04 LTS (which is only
about two months old).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

