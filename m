Return-Path: <ksummit+bounces-395-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B3D3CD6FD
	for <lists@lfdr.de>; Mon, 19 Jul 2021 16:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 33C0D1C0EB7
	for <lists@lfdr.de>; Mon, 19 Jul 2021 14:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7502FB6;
	Mon, 19 Jul 2021 14:43:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DA70
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:43:23 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id l5so20242391iok.7
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jxhiw388UDhWiEaVw2GSaPHY8B4YM5i9k6TVd8GI+wI=;
        b=Vq8bHNRhSSFCAS8pR/b6969O1xzm7CLib0YacDhSMUarA6c036ZcqKnWhgVd4bj894
         Y9uFaOl3aJ/SAyjIUXh5FpeuRGttsYpdRyBmrVkx7r0SHFF2s6NA2QOXRxK+RZH1Ydjc
         iCHa+7bv9oBScQ7VDr3v3Y4kCs18vAs0nGQuFrIpZNtMyeVzHILQwE+/iPtEY3TdaW9H
         BWzsPDTv9jE7C4yX2Ed5LJUDjvuTFvIX0GZypnfrXe/23CuPEC+gyfFZBl9rvcaDopgb
         XdQOBz81IlQ8Yxnor8K/s0t8QAfBsz5CM4EvK1tmh7hmPIEGbYuCZvJHUqq+BCMoGehD
         jJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxhiw388UDhWiEaVw2GSaPHY8B4YM5i9k6TVd8GI+wI=;
        b=VVjteqtrzKmO674rsmzE71yobeKok2OaMhy9TAysdP23B8Ao4T2QoFGFG+HumScAzF
         0mPr7xZeLl5lYB37zdIFRU52QNeM7HtaSPxhvZlA/dYzQG/w8ffVzh9Rfa0901c7mbsw
         dnAFjbIgXitRcjGXbEOBXvF00h8MTZ8O3kFjK1N7n8OHIzeZIk4TxohthAyGy4CCPuF0
         tZU1v0bM6l/E3DXyDqmsTgqVQ2FKRF3TNJu2pGmD/3GpYlJ6nlORrpjwVUPqfRLg26kD
         QwMQVBKaSGF1dfXTwO75cE/5RmloCd15bILZwa9QLioKapO1D86fP3hJsucAU8wQ+nt+
         xr0g==
X-Gm-Message-State: AOAM532GGNhwLSpgOfrDpkFymBfe5Vj1/KXY8nzsQC7zGe2HVun1iQqv
	kQ2j+iYdcCm9zM/glHWu3OAtuEEwHJmtE1YD9mA=
X-Google-Smtp-Source: ABdhPJzGgtZhadMsG4r33SaS3feD+TfHcGjEcqmKPzuwyZHmA+S5kHYdF5nxwBojZil2OjC64ESRaTGI+DUd1eFUfh4=
X-Received: by 2002:a6b:e417:: with SMTP id u23mr8047686iog.91.1626705803012;
 Mon, 19 Jul 2021 07:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
In-Reply-To: <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jul 2021 16:43:11 +0200
Message-ID: <CANiq72mAYE6Wh8AikfuuNm8Asr4+c90_bYbj8XdBGJ1Pb4kzvQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 3:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
>     fn unmask(data: &Ref<DeviceData>, irq_data: &IrqData) {
>         let mask = bit(irq_data.hwirq() % u64::from(PL061_GPIO_NR));
>         let _guard = data.lock();
>         if let Some(pl061) = data.resources() {
>             let gpioie = pl061.base.readb(GPIOIE) | mask;
>             let _ = pl061.base.try_writeb(gpioie, GPIOIE);
>         }
>     }

Wedson will answer thoroughly your other questions, but a quick note
on handling `{read,write}{r,w,l,q}` (since you asked in the past and
you put here the example :)

`pl061.base.readb(GPIOIE)` like above and similar calls are safe --
the function knows the address is correct because it controls the
computation of the address, rather than leaving users to compute the
address and then call a generic `{read,write}{r,w,l,q}` e.g. via
`readb(foo->base + GPIOIE)`. This is key.

`regmap` is able to check things similarly, but it does it at runtime
-- here the check happens at compile-time.

In fact, we can take this further. For instance, take a look at this
function in another GPIO driver that uses `regmap`:

    static int ts4900_gpio_get_direction(struct gpio_chip *chip,
unsigned int offset)
    {
        struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
        unsigned int reg;

        regmap_read(priv->regmap, offset, &reg);

        if (reg & TS4900_GPIO_OE)
            return GPIO_LINE_DIRECTION_OUT;

        return GPIO_LINE_DIRECTION_IN;
    }

The entirety of this function and similar ones can be automatically
generated, including the masking and conversion into another type,
things like shifting, unit conversion, bit banging, etc. so that you
could call:

    ts4900.map.get_direction()

Of course, this can be automated in independent tools/scripts that
e.g. generate C code from a hardware description. However, we could
also do the codegen in Rust itself, and provide a custom syntax to
describe the register map easily.

For instance, the driver developer could write something like this
right in the Rust source code:

    memory_map!(
        0x0042  simple_value  2  value(u16)
        0x0044  some_flags    2  flags(..., FLAG1, FLAG2)
        0x0046  custom_type   1  value(MyCustomType)
        0x0047  across_bits   2  [
                                   0..2  other_flags  flags(FOO, BAR),
                                   2..4  _            unused,
                                   4..31 temp         value(Temperature),
                                 ]
    );

And then simply call:

    driver.map.read_temp()

and it would automatically perform the shifting, masking, unit
conversions, etc. to get the raw sensor data into a value in proper
Kelvin.

Cheers,
Miguel

