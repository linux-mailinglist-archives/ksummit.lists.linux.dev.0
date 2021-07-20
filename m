Return-Path: <ksummit+bounces-419-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id C23233CF528
	for <lists@lfdr.de>; Tue, 20 Jul 2021 09:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id E03A33E102E
	for <lists@lfdr.de>; Tue, 20 Jul 2021 07:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E5F2FB6;
	Tue, 20 Jul 2021 07:16:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38C70
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 07:16:07 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id c68so14507548qkf.9
        for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t31hdjn6l9jwXYpIK6Z1zJhiaj1N3keWS1QyEcQun3I=;
        b=CA94yHXuux5jD1cwLHrmaocaLF+m7Fk19hgz0LNrP0dIlos48NhePPswLjtAdjXb9l
         0aagC5HGT0q/CPNRhziAWf/Ag8dbVV7MjA9jT/hQXKNnt5C5fM6wdSKiPTxqUo3Hap6x
         g2maBUGZMKRTm8C5Xv7VD7QCAWKzUs7HdcsYeg10R3JAX6SRd1WBCqbYll05AIxSOJJW
         kxxB6BEMdFfcGVyDC2vWFF1eLGR70NB7ApYov7oUfLYMG9r211hHXYmQOxIjq+949RPd
         YdYy8QUdcsuN1WcNjfcBhAM67eZS/gM0Z5TVOg327LJkQ8t2gKULdnONTuxSeGy6QN9Q
         kXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t31hdjn6l9jwXYpIK6Z1zJhiaj1N3keWS1QyEcQun3I=;
        b=QJctg0TMuE7uoN5lWRfXZ+5Nmfw2A1j0dBwIjdyqV/NtOpqAVY1ybb2wJu2RlxBDKE
         ufHrIUYb0lqZSMnOuhnalHo4uf2Tw9aediUF5HIkzeL3kCnOT8LXs5dymrF/S3hHMl1j
         Xo2SgDGjf7/fmsZaeHJaMxIVq0xodgSfBYxgpFP/Vfh9WKnRRZiryh+XA7xR3VwsVm7M
         hskjIeb8H1RrSHL17mqwb6q+/ieDXn0u3T3rkr67fmlpRw0XqRdjUngCMv+WWC/NqkGl
         N2XU43lBwYOXdINm8cGtPFndUXgFZ5i1cF4bl9TxQcjBva1FdMgz4u3UDdvM5x0zlsbe
         FjYg==
X-Gm-Message-State: AOAM53348iVpG/6znYRlVvbPipg7dW5alzDlgUXGHajT2GYEGYUJTNdJ
	kon9VOcsKoxP8X3vepsaoEX611WyyPfCghRx/HFZWO1DgVY=
X-Google-Smtp-Source: ABdhPJyYeiKtNK7I3eRG9OGa9qMhUFbZ6YjDwG7PvcmUNYQpWv9EBiZHoOu2ShDmx6cv0jdpUBDCUqPJQPwpH/N5aqA=
X-Received: by 2002:a02:2b21:: with SMTP id h33mr24773599jaa.31.1626765355859;
 Tue, 20 Jul 2021 00:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com> <YPYDb0Z19qohUjua@piout.net>
In-Reply-To: <YPYDb0Z19qohUjua@piout.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jul 2021 09:15:44 +0200
Message-ID: <CANiq72mpCysR3B=sLBWOi4PGSZf9B5e1bXQJaGQ5MkknKfixhg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexandre,

On Tue, Jul 20, 2021 at 12:57 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> I'd love to have a side by side disassembly of the generated object
> files (ideally intermixed with the source).

It is hard to do such a match because of different reasons, such as:

  - The extra work that the Rust version does (the revocable resources feature).

  - The Rust version not being able to inline the opaque helpers that
we use to avoid rewriting C macros (without cross-language LTO
support).

  - The Rust version inlining generics from the `kernel` crate (which
happens even without LTO, because they are generics).

  - The C version not being able to inline from other translation
units (without LTO).

In any case, to give you an example, I took `get_direction()` which is
fairly simple and under `-O2` with overflow checks disabled in Rust I
got:

    00000000000001b8 <pl061_get_direction>:
        1b8:    a9be7bfd    stp    x29, x30, [sp, #-32]!
        1bc:    f9000bf3    str    x19, [sp, #16]
        1c0:    910003fd    mov    x29, sp
        1c4:    2a0103f3    mov    w19, w1
        1c8:    94000000    bl     0 <gpiochip_get_data>
        1cc:    f9400408    ldr    x8, [x0, #8]
        1d0:    91100108    add    x8, x8, #0x400
        1d4:    39400108    ldrb   w8, [x8]
        1d8:    d50331bf    dmb    oshld
        1dc:    92401d08    and    x8, x8, #0xff
        1e0:    ca080109    eor    x9, x8, x8
        1e4:    b5000009    cbnz   x9, 1e4 <pl061_get_direction+0x2c>
        1e8:    9ad32508    lsr    x8, x8, x19
        1ec:    f9400bf3    ldr    x19, [sp, #16]
        1f0:    f240011f    tst    x8, #0x1
        1f4:    1a9f17e0    cset   w0, eq // eq = none
        1f8:    a8c27bfd    ldp    x29, x30, [sp], #32
        1fc:    d65f03c0    ret

    00000000000009d8 <...::get_direction>:
        9d8:    a9bd7bfd    stp     x29, x30, [sp, #-48]!
        9dc:    f9000bf5    str     x21, [sp, #16]
        9e0:    a9024ff4    stp     x20, x19, [sp, #32]
        9e4:    910003fd    mov     x29, sp
        9e8:    f9400014    ldr     x20, [x0]
        9ec:    2a0103f3    mov     w19, w1
        9f0:    94000000    bl      0 <rust_helper_rcu_read_lock>
        9f4:    39402288    ldrb    w8, [x20, #8]
        9f8:    72001d1f    tst     w8, #0xff
        9fc:    54000180    b.eq    a2c <...::get_direction+0x54> // b.none
        a00:    f9419288    ldr     x8, [x20, #800]
        a04:    91100100    add     x0, x8, #0x400
        a08:    94000000    bl      0 <rust_helper_readb>
        a0c:    92400a68    and     x8, x19, #0x7
        a10:    1ac82408    lsr     w8, w0, w8
        a14:    7200011f    tst     w8, #0x1
        a18:    1a9f17e8    cset    w8, eq // eq = none
        a1c:    aa1f03f4    mov     x20, xzr
        a20:    aa1f03f5    mov     x21, xzr
        a24:    d378dd13    lsl     x19, x8, #8
        a28:    14000005    b       a3c <...::get_direction+0x64>
        a2c:    d2dfff54    mov     x20, #0xfffa00000000 // #281449206906880
        a30:    aa1f03f3    mov     x19, xzr
        a34:    f2fffff4    movk    x20, #0xffff, lsl #48
        a38:    52800035    mov     w21, #0x1 // #1
        a3c:    94000000    bl      0 <rust_helper_rcu_read_unlock>
        a40:    aa140268    orr     x8, x19, x20
        a44:    aa150100    orr     x0, x8, x21
        a48:    a9424ff4    ldp     x20, x19, [sp, #32]
        a4c:    f9400bf5    ldr     x21, [sp, #16]
        a50:    a8c37bfd    ldp     x29, x30, [sp], #48
        a54:    d65f03c0    ret

To be a bit more fair to the Rust version by not having the revocable
part, I wrote a `test` function in both C and Rust with only the read
that `get_direction()` does:

    u8 test(struct pl061 *pl061, unsigned offset) {
            return readb(pl061->base + GPIODIR) & BIT(offset);
    }

    fn test(pl061: &PL061Resources, offset: u32) -> u8 {
        pl061.base.readb(GPIODIR) & bit(offset)
    }

This, of course, yields a much closer result:

    0000000000000000 <test>:
          0:    f9400408     ldr     x8, [x0, #8]
          4:    91100108     add     x8, x8, #0x400
          8:    39400108     ldrb    w8, [x8]
          c:    d50331bf     dmb     oshld
         10:    92401d09     and     x9, x8, #0xff
         14:    ca090129     eor     x9, x9, x9
         18:    b5000009     cbnz    x9, 18 <test+0x18>
         1c:    52800029     mov     w9, #0x1                    // #1
         20:    9ac12129     lsl     x9, x9, x1
         24:    0a090100     and     w0, w8, w9
         28:    d65f03c0     ret

    00000000000009d0 <gpio_pl061_rust::test>:
        9d0:    a9be7bfd     stp     x29, x30, [sp, #-32]!
        9d4:    f9000bf3     str     x19, [sp, #16]
        9d8:    910003fd     mov     x29, sp
        9dc:    f9400008     ldr     x8, [x0]
        9e0:    2a0103f3     mov     w19, w1
        9e4:    91100100     add     x0, x8, #0x400
        9e8:    94000000     bl      0 <rust_helper_readb>
        9ec:    92400a68     and     x8, x19, #0x7
        9f0:    f9400bf3     ldr     x19, [sp, #16]
        9f4:    52800029     mov     w9, #0x1                    // #1
        9f8:    1ac82128     lsl     w8, w9, w8
        9fc:    0a080000     and     w0, w0, w8
        a00:    a8c27bfd     ldp     x29, x30, [sp], #32
        a04:    d65f03c0     ret

Cheers,
Miguel

