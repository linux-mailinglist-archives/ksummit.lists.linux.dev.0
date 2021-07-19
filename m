Return-Path: <ksummit+bounces-406-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357D3CEAF0
	for <lists@lfdr.de>; Mon, 19 Jul 2021 20:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5D0961C0F6A
	for <lists@lfdr.de>; Mon, 19 Jul 2021 18:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1582FB6;
	Mon, 19 Jul 2021 18:25:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8E2FAE
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 18:25:03 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id l5so21110058iok.7
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPn5ImHjkZXlJR+Dg3JAFTE7p5JMahnNswTb1G5+hds=;
        b=iu3ohQY3EzAIgPpXV3W6/Sk+ANjrwyRaRZQJoGfJznSF0SUZBS256nmDkYUbmiLask
         YR5ksUty72TrnNGMUd+bajPeeHj/a3nSys23PB6LG5XZ5+aBUt6gmV95Dv/DCDYYqD9C
         3DoVO3unBznRzbboTfzVq46sELuj9y1jlaoy1jaB6UhHsRPKzADGpRB1iBpxXZamKCIy
         JpuBTl2BQmF55FZCGvsDcKq+sKhGjwSsllbw5BC50Yi4d14oF0Q/PBnP8HL5Av8PwtsM
         9gMS9+zPCL2NA8A6qWP7+F1goSAxcYlIpKKHiLsFNG1uOoHkStBvt17d1vDHktsni/Ds
         nlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPn5ImHjkZXlJR+Dg3JAFTE7p5JMahnNswTb1G5+hds=;
        b=JQ5f4642RQnBKo8N3WUIFldQTZnvf7fHiyJachqP7EV3sLeOrM+tY/NhGdvgBtYicH
         1WsWhSJVR0WeeKIyKxaXb8WAofAiOzVv8/YYvMJKOOwOaMfEqzcPUEfpCawv5tewmRAa
         7QF1T6Y/dUiu+9SBbQotYc8e/pxjO3msoQ1ESAVrb9iHhLMEV8YhHk24yNf5CfLGDbwa
         xzODNj80AfdsyvGrvqESVH6zAZ6XveF1m4hzGOfM/8rHZczhsDo5bVtkJETHoY+n8uVX
         qpqrwX2rEMqh7nX5JoAMd5bJKhU9Axr0UtZVVTwUyIbtSjl4hMwRF0B2ZTWJqU9TOAcW
         RTXg==
X-Gm-Message-State: AOAM532xBHLQ9tFI6P2QES29U0lebo/AXz/Z0lu0OpEbwa2AqyfFs9VG
	nqSUrT+ADAq1AwdofOK4A/RLiNE3+QSLsLkTJUs=
X-Google-Smtp-Source: ABdhPJxtzG4qIc0WDD8n+vXDmdpKFVrQsA/L2a1JMGKN4X7+Zw5pQXPuenkmV2iHN+Y38Q+oS/HtbE1RKnKOP/yF6MI=
X-Received: by 2002:a5d:8c9a:: with SMTP id g26mr19968030ion.121.1626719102359;
 Mon, 19 Jul 2021 11:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
 <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com> <CAMuHMdV1M0jEMGNn4MNKULGWb-EXOBus8sQXFC5-iiySEcReRw@mail.gmail.com>
In-Reply-To: <CAMuHMdV1M0jEMGNn4MNKULGWb-EXOBus8sQXFC5-iiySEcReRw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jul 2021 20:24:51 +0200
Message-ID: <CANiq72n706_u-q3=rTL9UCNhJrji3VvOpGg+6uoEttBWWpVfrw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 4:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Turns out "a..b" in Rust does mean "range from a to b-1".
> That's gonna be hard to (un)learn...

It may help to think about it as the usual `for` loop in C, typically
written with `<` and the "size" (instead of `<=` and the "size - 1"),
i.e.:

    for i in 0..N
    for (i = 0; i < N; ++i)

Cheers,
Miguel

