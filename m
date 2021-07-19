Return-Path: <ksummit+bounces-410-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id A45893CEE22
	for <lists@lfdr.de>; Mon, 19 Jul 2021 23:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 418253E1061
	for <lists@lfdr.de>; Mon, 19 Jul 2021 21:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8B62FB3;
	Mon, 19 Jul 2021 21:31:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117872
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 21:31:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MVv8f-1ldiBn0W3h-00RoAU for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021
 23:31:50 +0200
Received: by mail-wm1-f41.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso296969wmh.4
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:31:50 -0700 (PDT)
X-Gm-Message-State: AOAM531Oim8rYpK770ZcHebnYRrqkKORd8bjA3Gh2z/s6T11bmtsnUtW
	uWxpzHsisUTqfD/WM/XS0HpQjKEBczmLMNDIkzw=
X-Google-Smtp-Source: ABdhPJxT1xrTWIAPQ1nOIEu0P4H2Dbd0NKelYDeI2r4w3Wmlwbbv8+OUHdg7fr/SiF0P9gNDJlpAy0Hf+vIe6aepiWo=
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr34255437wmk.84.1626730309821;
 Mon, 19 Jul 2021 14:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com>
 <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com> <YPW3FgN0qtDpPSAc@google.com>
In-Reply-To: <YPW3FgN0qtDpPSAc@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Jul 2021 23:31:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3D9F7930knQFSkw4dfiPtMw-OFQaacd-ZV9Wqf4OcQ2A@mail.gmail.com>
Message-ID: <CAK8P3a3D9F7930knQFSkw4dfiPtMw-OFQaacd-ZV9Wqf4OcQ2A@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JTkfFVpJl4nRoB7BPOInnSBrIhD9HBJMo+9Z2ourPoSzOS/F0td
 PzeBbe74n6JYy5A/JGFTag+sNU+EJQrQRf6LPBh4pAWDoMq5+NTAEFQLCjLhlQVc51HHfUF
 G5lwYYnx2fTDokYLO0VVpq2goThNPXojh2tcCAkd6Na54xCtYwIDfEvCLEnIvFne68tOEWh
 vOJ9LsbytwqKvumgPmVtw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fKE3i9q4npg=:Fs5DBE5DsRX/mIOladvriZ
 2+NQZBvGKN/AKJUhcSNJJStvLyFgu8UcVw3Xwhjts7bhH9BBCFpcI/jAM1WKHRlhWXHeIfBaV
 HN8161OKj5rvHXAYvFTky+z0oN+aR/89ZFPBjmnRB1LqJXtmH31dt9YJakuuHLtfjZXM2Jm6N
 fGp9SkFyCLHCWDiW6OpcNmKcgJqNZ5wy4QwiCYMeVZhlC9/dYypH7nU0wRSeVzqn8mguwwgXj
 ysF39//WoUXg6AqD0X9T1DaTJ8sBCe7UiqF73tVaimRQkLQ3juHzsy3Wla7QhKvoP7IYYV9me
 oOzzYn1QX2NK0iv1G3WwCjw7aG2Q/6aIYcFMVvgNXKlryiw08RW0cv4OPvJbhVnObPZs5OcSs
 DdRJ2G8Eqf2aSECk/6M1syzoHFWLy7KNb2V2jNqw2kUreUqF19R8rfivI0f2tYFZayQQOcETt
 c2oIE7bOpwUrd7zVibp9MrNk7ncuUZTn81t5zhtF5RpLTfAIDbk+OJixeAjqZRZ9ibKsrDv01
 ry0jUVDljwGqab8Z8J4o8e57F4uCBh5JNCJrW1b9ZtaOsyRh/V4HXq0vBZM8OL6N/ZFrBQybn
 tIGp3dHxjpifzHFejf9SZN0Xaf5QpwMBGNhR1HQhacf1WXFUiHoiMlUsESbMnsVqlhIn6PMwr
 g1Ssx0xqHfjQhCYOGSs+XmG8HEDLFLMmnGc6KdfD5fdOxbeyYtqUeyW0ZR6QHCR8ecqO0fmSg
 LzLtJ1xqkwbuOFcYx5Ungu08zsn1E1wIVvfMCDbTWNmTSz4XuL6OJqYYxJcU8y/PvBnz3154p
 +ToqbgTkarWXHf/7vFgHDXiy/rEe6hmYElyNX2xo03qJcswRNeSEz15Q3trsemjHP+OM56CUP
 G42hjTGnw4cgItNbq5/hdXbHQUGglQAiFkjR95UtxC+Bn4w310Rzd3HvADZiAM+GE749IPwfP
 0euEuqli8+uhMvxRi7Bfigvrow8kzLOy+nWh9QG4H6MFroQ+ZSr5R

On Mon, Jul 19, 2021 at 7:32 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
> On Mon, Jul 19, 2021 at 04:02:38PM +0200, Arnd Bergmann wrote:
>
> At the moment we lose information about the device, but simply because we
> haven't implemented dev_ variants yet, there is no fundamental reason for this
> though.
>
...
>
> Yes, it uses spinlock_t. But again, just because we don't have an implementation
> that uses raw_spinlock_t yet.
>
...
> It's not there yet, but the idea is to wrap the place where `drv.pm` is
> initialised in the amba code with `if cfg!(CONFIG_PM)` -- if CONFIG_PM is
> disabled, all references to PM code are gone and they are removed by the
> compiler. This way we move configuration-dependent code out of drivers and into
> core libraries.

Ok, that all sounds good to me. I'll reply separately on the coding style.

       Arnd

