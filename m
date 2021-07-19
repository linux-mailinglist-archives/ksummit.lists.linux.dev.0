Return-Path: <ksummit+bounces-398-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3673CDE1B
	for <lists@lfdr.de>; Mon, 19 Jul 2021 17:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D19961C0F38
	for <lists@lfdr.de>; Mon, 19 Jul 2021 15:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463FA2FB3;
	Mon, 19 Jul 2021 15:43:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAAF70
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 15:43:52 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id b14so16370264ilf.7
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=82b6blxRgiL/ZEp4slBYWuUBUjzTS32bdzd+GaAPuSE=;
        b=qrLbCK6WJBVcbfhL7qG33RvYwHXMYby8UnwYW8/VBALaq54niSQsyJqyDjX/uWoXJy
         /P19HBZVqDQB/nfktR4WYzDjzinf8nt5PA+lcWOv44EDbS4BYsV8XjoGQzr5ounmZPvG
         YkajVPPW2A9wxLQFq2wFmdDAZ256C0CC0H98hi/i0qSvOOgoHFvqot3GVvE5ppz/64VT
         yVCnNKVV+y+TqMaZ+fpASzbkBsLd6PXcpBT2VpGCFBexaVLHzZVEyXBTabFzfTsSJku1
         x1h6zu5MVS/KwULoCArZfOqV+FCxfnz1F6ciStrEupei6JlrJ0MJxvdqOH81NNG1BSdc
         HRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=82b6blxRgiL/ZEp4slBYWuUBUjzTS32bdzd+GaAPuSE=;
        b=nAaQfCusDz3YW/uruWsOXCdgP2xpRTSxHkAMAoh8YhB/bew5m4IjgAa7FOeg3BsdHG
         HTw21w+44HUFFrwq2xfWB5tOYVxXIBQarA1pCXlKRAmHzBX8WTc6U5mWV0Y/tAwf/I+b
         zXp/fJnM0/1uOxKyivO8i+d6fxTvxF3LuNlk6lc/o2rpBNqTbhXYCqN7l5CeBA+g3Zg2
         T+v2SMOuqJw3Vf5s95JlSNQ0b5S1AvsUUXt4klSl968bShpKSXk7wSYkierg+iz0CMNJ
         JqX3f7ar8s6Qb7CvHwuIXsb4RdI0FUV3Wo1UCqG4iAgep2F5/bcoHJzKQflllJeigFNZ
         Gxyg==
X-Gm-Message-State: AOAM533IH4ayoFOd+w4XeXFUqYepymSPLEdbHOl+QpxJOIb7d000qGbw
	ueWOTb5f/bneZYhbUFpZ+5TZWHbwQfQAyPCZNiXpa0wutok=
X-Google-Smtp-Source: ABdhPJwrmh5KRi3R6x5y1TGDsOegr8fmav0Mu7WFGJSS4iOADuLMGVvFErvXz/DlrHrPCyZzkpVK1TdbKcoyVHmTq5I=
X-Received: by 2002:a92:1908:: with SMTP id 8mr17674930ilz.149.1626709431406;
 Mon, 19 Jul 2021 08:43:51 -0700 (PDT)
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
 <YPVvEZgcP1LMGjcy@google.com> <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <CANiq72mAYE6Wh8AikfuuNm8Asr4+c90_bYbj8XdBGJ1Pb4kzvQ@mail.gmail.com> <YPWXBANGbaIO2ila@lunn.ch>
In-Reply-To: <YPWXBANGbaIO2ila@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jul 2021 17:43:40 +0200
Message-ID: <CANiq72nzWrs2RoLGYVy3s=bXCxywtOvQLMV7w6mnBgeMK8uwNQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 5:15 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Can you express endianness here as well? There are often cases where
> the hardware is always big endian independent of the CPU
> endianness. Some of the readl/writel macros handle this, adding a swap
> when the two don't match.

Yes, of course!

Querying the endianness can be done as usual, similar to the C preprocessor:

    pub fn f(n: i32) -> i32 {
        #[cfg(target_endian = "little")]
        return n + 42;

        #[cfg(target_endian = "big")]
        return n;
    }

As well as with the `cfg!` macro, more ergonomic for small things like this:

    pub fn f(n: i32) -> i32 {
        if cfg!(target_endian = "little") {
            n + 42
        } else {
            n
        }
    }

As well in macros (like the `memory_map!` shown above).

If you just need the most common case, i.e. converting from/to a given
endianness, the primitive types come with functions for that, e.g. the
following would include a `bswap` in x86:

    pub fn f(n: i32) -> i32 {
        i32::from_be(n)
    }

See `{from,to}_{be,le}` in https://doc.rust-lang.org/std/primitive.i32.html

Cheers,
Miguel

