Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8007D61EC
	for <lists@lfdr.de>; Wed, 25 Oct 2023 08:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4A141C20D76
	for <lists@lfdr.de>; Wed, 25 Oct 2023 06:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2EB14276;
	Wed, 25 Oct 2023 06:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EB811C82;
	Wed, 25 Oct 2023 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a8ee23f043so53993147b3.3;
        Tue, 24 Oct 2023 23:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698216962; x=1698821762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksSM5UcSNSuje/8EMlCLMe9/k822Jb/DJeRzPPZzmIE=;
        b=qk3F372QlBsSfckBdUrIzElvkGb46ciCetTaRzOVXXR9xBodhLojVMnsFRqd+RehfR
         VEXUAfzgNDFSBfCRe9vnnqglv+66fbwExErtbUxCubGHQhy1Obw3V5ae19QhoPlOnNL1
         TQ9UMbCO4Zv1FkHlKv9DkeRBPlSFi9vseGBemo0RXx9H/5TF5Z9dp/ttEuEEXpuhhupE
         PPIxIN/LiZZWb46AXj3rDHFrlFDs9TjaTuIq60xxT07B7Prs+huq4hUQ6X0z/aZrqxRZ
         EwBRjxfBFpPYG9aksxhYdumI0Rf00iXE6rERWqNpAwHufzvtR/Bo31ilkorR9G4nnEPe
         NK2A==
X-Gm-Message-State: AOJu0YyXz9yk59WUfLXFR7Dp0uOb3aUO/mqUtg1hXxjx+SotCh8Op3d/
	YXtXmUCVnt/KMbPA8xyt51j+2d7eqGPXUA==
X-Google-Smtp-Source: AGHT+IHX9nLtwMwzXgy29rE3Ccehy+XcVyv79FHl+cPEqRpYXfE2rI+YBOG+bsdesk4r+BqEFn5EeQ==
X-Received: by 2002:a81:65c5:0:b0:59b:fda7:9d7f with SMTP id z188-20020a8165c5000000b0059bfda79d7fmr14748488ywb.49.1698216961918;
        Tue, 24 Oct 2023 23:56:01 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id j13-20020a81764d000000b005abd2a8b9ccsm2745698ywk.126.2023.10.24.23.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 23:56:01 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a7eef0b931so54241777b3.0;
        Tue, 24 Oct 2023 23:56:01 -0700 (PDT)
X-Received: by 2002:a0d:e291:0:b0:5a7:fbd5:8c1 with SMTP id
 l139-20020a0de291000000b005a7fbd508c1mr14810093ywe.17.1698216961347; Tue, 24
 Oct 2023 23:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org> <169818295461.20306.14022136719064683486@noble.neil.brown.name>
In-Reply-To: <169818295461.20306.14022136719064683486@noble.neil.brown.name>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Oct 2023 08:55:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
Message-ID: <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: NeilBrown <neilb@suse.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev, 
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Tue, Oct 24, 2023 at 11:29=E2=80=AFPM NeilBrown <neilb@suse.de> wrote:
> On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
> > On 23/10/2023 20:49, Andrew Morton wrote:
> > > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> > >> Yesterday someone on my lists just sent an email looking for kernel
> > >> tasks.
> > >
> > > Well here's a task: write a bot which follows the mailing lists and
> > > sends people nastygrams if one of their emails is more than 95%(?)
> > > quoted text.
> > >
> > > It's happening significantly more lately.  Possibly because the gmail
> > > client helpfully hides quoted text.
> >
> > I would also point to reviewers and maintainers who give a Rb/Ack tag:
> > 1. somewhere at the top, without any footer like Best regards, and then
> > quote entire patch, so I don't know shall I look for more comments afte=
r
> > Rb/Ack?
> >
> > 2. quote entire email and then add Rb/Ack, so I need to figure out
> > whether there was something between the hundreds of lines of text or no=
t.
>
> Here we all are, brilliantly talented computer programmers who spend
> our days making amazing fast digital devices do amazingly clever and
> subtle things, inventing time-saving tools and processing vast amounts
> of data without blinking, but for some reason we think the task of
> skipping over a few thousand lines that all start with '> " is too hard
> for us and that we should, in stead, complain to some other human to
> convince them to make our life easier for us.
>
> Does anyone else see the irony?

Please compare the numbers:
  1. 1 sender removes irrelevant parts,
  2. N receivers skip irrelevant parts.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

