Return-Path: <ksummit+bounces-420-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E53CF72E
	for <lists@lfdr.de>; Tue, 20 Jul 2021 11:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7BC991C0EFD
	for <lists@lfdr.de>; Tue, 20 Jul 2021 09:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DC12FB6;
	Tue, 20 Jul 2021 09:49:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81806173
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 09:49:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id D8140CBEA0
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 09:39:56 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 70152FF805;
	Tue, 20 Jul 2021 09:39:47 +0000 (UTC)
Date: Tue, 20 Jul 2021 11:39:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>,
	Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPaZ4zTZHOQfBhOk@piout.net>
References: <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <YPV7DTFBRN4UFMH1@google.com>
 <YPYDb0Z19qohUjua@piout.net>
 <CANiq72mpCysR3B=sLBWOi4PGSZf9B5e1bXQJaGQ5MkknKfixhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mpCysR3B=sLBWOi4PGSZf9B5e1bXQJaGQ5MkknKfixhg@mail.gmail.com>

Hi,

On 20/07/2021 09:15:44+0200, Miguel Ojeda wrote:
> Hi Alexandre,
> 
> On Tue, Jul 20, 2021 at 12:57 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > I'd love to have a side by side disassembly of the generated object
> > files (ideally intermixed with the source).
> 
> It is hard to do such a match because of different reasons, such as:
> 
>   - The extra work that the Rust version does (the revocable resources feature).
> 

Well, the point is exactly to have a look at that extra work.

>   - The Rust version not being able to inline the opaque helpers that
> we use to avoid rewriting C macros (without cross-language LTO
> support).
> 
>   - The Rust version inlining generics from the `kernel` crate (which
> happens even without LTO, because they are generics).
> 
>   - The C version not being able to inline from other translation
> units (without LTO).
> 
> In any case, to give you an example, I took `get_direction()` which is
> fairly simple and under `-O2` with overflow checks disabled in Rust I
> got:
> 

I was under the impression that you would compile the kernel with
overflow checks enabled, why would you disable them here?

>     00000000000001b8 <pl061_get_direction>:
>         1b8:    a9be7bfd    stp    x29, x30, [sp, #-32]!
>         1bc:    f9000bf3    str    x19, [sp, #16]
>         1c0:    910003fd    mov    x29, sp
>         1c4:    2a0103f3    mov    w19, w1
>         1c8:    94000000    bl     0 <gpiochip_get_data>
>         1cc:    f9400408    ldr    x8, [x0, #8]
>         1d0:    91100108    add    x8, x8, #0x400
>         1d4:    39400108    ldrb   w8, [x8]
>         1d8:    d50331bf    dmb    oshld
>         1dc:    92401d08    and    x8, x8, #0xff
>         1e0:    ca080109    eor    x9, x8, x8
>         1e4:    b5000009    cbnz   x9, 1e4 <pl061_get_direction+0x2c>
>         1e8:    9ad32508    lsr    x8, x8, x19
>         1ec:    f9400bf3    ldr    x19, [sp, #16]
>         1f0:    f240011f    tst    x8, #0x1
>         1f4:    1a9f17e0    cset   w0, eq // eq = none
>         1f8:    a8c27bfd    ldp    x29, x30, [sp], #32
>         1fc:    d65f03c0    ret
> 
>     00000000000009d8 <...::get_direction>:
>         9d8:    a9bd7bfd    stp     x29, x30, [sp, #-48]!
>         9dc:    f9000bf5    str     x21, [sp, #16]
>         9e0:    a9024ff4    stp     x20, x19, [sp, #32]
>         9e4:    910003fd    mov     x29, sp
>         9e8:    f9400014    ldr     x20, [x0]
>         9ec:    2a0103f3    mov     w19, w1
>         9f0:    94000000    bl      0 <rust_helper_rcu_read_lock>
>         9f4:    39402288    ldrb    w8, [x20, #8]
>         9f8:    72001d1f    tst     w8, #0xff
>         9fc:    54000180    b.eq    a2c <...::get_direction+0x54> // b.none
>         a00:    f9419288    ldr     x8, [x20, #800]
>         a04:    91100100    add     x0, x8, #0x400
>         a08:    94000000    bl      0 <rust_helper_readb>
>         a0c:    92400a68    and     x8, x19, #0x7
>         a10:    1ac82408    lsr     w8, w0, w8
>         a14:    7200011f    tst     w8, #0x1
>         a18:    1a9f17e8    cset    w8, eq // eq = none
>         a1c:    aa1f03f4    mov     x20, xzr
>         a20:    aa1f03f5    mov     x21, xzr
>         a24:    d378dd13    lsl     x19, x8, #8
>         a28:    14000005    b       a3c <...::get_direction+0x64>
>         a2c:    d2dfff54    mov     x20, #0xfffa00000000 // #281449206906880
>         a30:    aa1f03f3    mov     x19, xzr
>         a34:    f2fffff4    movk    x20, #0xffff, lsl #48
>         a38:    52800035    mov     w21, #0x1 // #1
>         a3c:    94000000    bl      0 <rust_helper_rcu_read_unlock>
>         a40:    aa140268    orr     x8, x19, x20
>         a44:    aa150100    orr     x0, x8, x21
>         a48:    a9424ff4    ldp     x20, x19, [sp, #32]
>         a4c:    f9400bf5    ldr     x21, [sp, #16]
>         a50:    a8c37bfd    ldp     x29, x30, [sp], #48
>         a54:    d65f03c0    ret
> 
> To be a bit more fair to the Rust version by not having the revocable
> part, I wrote a `test` function in both C and Rust with only the read
> that `get_direction()` does:

But do we care about very simple test cases? The pl061 driver is already
simple and this would be an example of what to expect for most of the
simple drivers that would get converted.

> 
>     u8 test(struct pl061 *pl061, unsigned offset) {
>             return readb(pl061->base + GPIODIR) & BIT(offset);
>     }
> 
>     fn test(pl061: &PL061Resources, offset: u32) -> u8 {
>         pl061.base.readb(GPIODIR) & bit(offset)
>     }
> 
> This, of course, yields a much closer result:
> 
>     0000000000000000 <test>:
>           0:    f9400408     ldr     x8, [x0, #8]
>           4:    91100108     add     x8, x8, #0x400
>           8:    39400108     ldrb    w8, [x8]
>           c:    d50331bf     dmb     oshld
>          10:    92401d09     and     x9, x8, #0xff
>          14:    ca090129     eor     x9, x9, x9
>          18:    b5000009     cbnz    x9, 18 <test+0x18>
>          1c:    52800029     mov     w9, #0x1                    // #1
>          20:    9ac12129     lsl     x9, x9, x1
>          24:    0a090100     and     w0, w8, w9
>          28:    d65f03c0     ret
> 
>     00000000000009d0 <gpio_pl061_rust::test>:
>         9d0:    a9be7bfd     stp     x29, x30, [sp, #-32]!
>         9d4:    f9000bf3     str     x19, [sp, #16]
>         9d8:    910003fd     mov     x29, sp
>         9dc:    f9400008     ldr     x8, [x0]
>         9e0:    2a0103f3     mov     w19, w1
>         9e4:    91100100     add     x0, x8, #0x400
>         9e8:    94000000     bl      0 <rust_helper_readb>

This is a function call, I would not call that closer to the C
version. Can we see rust_helper_readb?

>         9ec:    92400a68     and     x8, x19, #0x7
>         9f0:    f9400bf3     ldr     x19, [sp, #16]
>         9f4:    52800029     mov     w9, #0x1                    // #1
>         9f8:    1ac82128     lsl     w8, w9, w8
>         9fc:    0a080000     and     w0, w0, w8
>         a00:    a8c27bfd     ldp     x29, x30, [sp], #32
>         a04:    d65f03c0     ret

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

