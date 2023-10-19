Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F317CFAD1
	for <lists@lfdr.de>; Thu, 19 Oct 2023 15:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDA76B2107B
	for <lists@lfdr.de>; Thu, 19 Oct 2023 13:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC4827453;
	Thu, 19 Oct 2023 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C72375D;
	Thu, 19 Oct 2023 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a7eef0b931so97994087b3.0;
        Thu, 19 Oct 2023 06:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721695; x=1698326495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOdWAC+rZcyCYFgGHd9uFdZJkRXbsyb4tcDDTJxNV/E=;
        b=LUmbU+zoK3XJrGdPjp/JahHb87124+yzDoK5rAgf1W3KOTC4YkwLAOGDphJKaOTk1b
         uat6t2c4/JVbPWPpRR1hp0DLSmn8klO3RIY+HKVvKJau59DmGevefcxdWrrK3KgP5kqc
         D0oQ9tqqN5qrD87hSQnz5yx+jXDyfA0hoG2zEguPfJ45VzzPpi64nsQ6afrdgSO6oSX2
         eYPoVPjyA64jnmvQelR8upIegh72CuqqeMNfxocNQF1yjAXBorI7voYR8yUWjvVTgDR8
         11UKzpPjHVlQj4DS1EWUO2lSgXYWB/60gebMGEuU2O4Mv7vJ+h/bk/D9Z937zU46y66E
         IwXw==
X-Gm-Message-State: AOJu0YwGAwqCmGp2AxS9Wu2tpUesnT4ebWDnvBTY/F3YOasg/Z2I+/lM
	WStibg6rpBYcP/kmjZtlA7l62GJFTX/b/Q==
X-Google-Smtp-Source: AGHT+IG26G+Sldv1X+8CjfsXLsQZ+IsJaTyM28vC3QA7hYlgcr0RYrZJZtt+d4DcImlp7xfjuhaD2Q==
X-Received: by 2002:a81:4784:0:b0:59a:f131:50fa with SMTP id u126-20020a814784000000b0059af13150famr2248998ywa.47.1697721694656;
        Thu, 19 Oct 2023 06:21:34 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id x133-20020a817c8b000000b00583f8f41cb8sm2396630ywc.63.2023.10.19.06.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 06:21:34 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7cc03dee5so97622587b3.3;
        Thu, 19 Oct 2023 06:21:34 -0700 (PDT)
X-Received: by 2002:a81:4a55:0:b0:5a7:af72:ad6a with SMTP id
 x82-20020a814a55000000b005a7af72ad6amr2191129ywa.43.1697721694165; Thu, 19
 Oct 2023 06:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain> <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
In-Reply-To: <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Oct 2023 15:21:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
Message-ID: <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev, 
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 2:50=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
org> wrote:
> On Thu, Oct 19, 2023 at 6:11=E2=80=AFAM Dan Carpenter <dan.carpenter@lina=
roorg> wrote:
> > We could add that kind of
> > thing to a todo list by using a KTODO line.
> >
> > KTODO: add check for failure in function_something()
> >
> > Then people can look on lore or use lei to find small tasks to work on
> > or they could use lei.
> >
> > lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=3Dmid 'K=
TODO AND rt:6.month.ago..'
> >
> > Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.
>
> I like it! There are too many of these things falling on the floor.
> An easy way to stash it on the technological debt hitlist would be
> really helpful.

And if people use appropriate Closes: tags, someone can write a tool
to only list non-closed items.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

