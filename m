Return-Path: <ksummit+bounces-392-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id B47603CD649
	for <lists@lfdr.de>; Mon, 19 Jul 2021 16:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 82D1B3E114B
	for <lists@lfdr.de>; Mon, 19 Jul 2021 14:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CCC2FB3;
	Mon, 19 Jul 2021 14:03:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DD772
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:02:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBUyX-1ly5sd2cm7-00CyW3 for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021
 16:02:56 +0200
Received: by mail-wm1-f50.google.com with SMTP id c17so3383342wmb.5
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 07:02:55 -0700 (PDT)
X-Gm-Message-State: AOAM533Ui0+YcIxwV9Of5KSzgOM5ZuBVatp2whje1d5s9QxfmvsxPb3q
	cqdg4AO77Q8wj4mxay2S+NXey7AP61PRSq/VY0s=
X-Google-Smtp-Source: ABdhPJwmJd/Ix86WqTyiCFOB9NCP2QcoBq557RPZfJLAlXIsRpRXa6JM8SGYVKJ4v+Uec92ybRvWmJtZ1MHyYBmh9F8=
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr32248772wmh.120.1626703375061;
 Mon, 19 Jul 2021 07:02:55 -0700 (PDT)
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
In-Reply-To: <YPV7DTFBRN4UFMH1@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Jul 2021 16:02:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
Message-ID: <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Greg KH <greg@kroah.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, 
	Jan Kara <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EVVPtr/4glnik2SWm4h/T67DPHRselC4eX1MNwCZfwATnuupT6K
 xgFiodjgqiHG9JtmcWeTDo3o8IZ8hHj3NHv7y2BSrHkc1zhfXxolutcfkRFLVbM2gUxmo/A
 HaFoTw3Zl9SRAPvlKcl7jB0T17UTSgbSNyjhpqbIAjGAzyoa6xT1ZdhoeEOil/hh3s9f3qW
 4yLs3UvrLZkcTxaHyyjJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IQuBvsexjFU=:H+QDE//pRTSwFaGJo39vTn
 2TQ7a/GW9tfhSQaoVW8gSIue/Fvg1TUYqxHq+xHoYZOZ34TgM/6UPJuhtq/JLEzxnqbW+srv4
 Hr36vcS9oDWdZ8pMI1jRWHLYPQv9b8sZrHNYd9aoHeuP3MGrtD+qB3LMs5hCQlccwSbGsS/CC
 MhaeY18FQkNrNlCoGMuKpSmxlpA28XCRzDhRdIKq8r6+6tppZNoOTNn2hmylNwGGBUXJMluf6
 Lbv9j1haZ+RjeiyP1tF13XC6MAVrL2r8yzSjQ7pe0pG9UymDkn1KteV+QZSnIvpjx+/GPPham
 W/iMWj42GMlnJnKiOb3bIrbpIQqvyxGt1WrCs9TiWeGVBkvsayyVv09YdPorQ4pHzsANsrKa/
 u2nGVq/1mDinT5lX9yoJYczopAjmZO0clhcDlTHhYBYjSVFiX+VFHh9YRgZdIHe3I+VohP+1F
 LdMdmr3ltVcwWEv5X4Nk9U79VX2qMPiDWTtWBG+VU+/daeVY2xmQSEqS2L4ROZeGw/JhrpH9B
 +fD4bGbE9DWeFwwYSmPq57lt+0wk6jsrlPBejFbmyj6GRx2FEZ2TlGiUcNt+0j/Q2kgp7C0kg
 WBLlgFdn61tkWIeV1NPUlh5sf84GX/RNp/39yCeP/URTi8YL6t9tAuCeKOTtUOG5GfRMroLr1
 R3CdOLwJ6P2xQ64R8gNBu9P9Dg9+zsaVXYTk1rtZCrhBi27JJtCyFUO3x/kfFGz481Ez3RUUE
 n0Ko0ITVhIqJFFbFMvbzmv9D7MpLg7PlypP7/LDeBBvRYkIX3MSCphG+7ldSnwrBHG1PDAt02
 kUboYXUVo8RixgJ9ZlxsdwCAieai5dp6anTBTSAHjoh+X66tbdmZBxOleyPP6BZ8WMA7aqlxU
 oOVb5A8AYQ9eKaReaBNIELnWdooHAUcpk2cUcygwbNEnAc9KxQZmmvaV4BMcfQFwVaDZGe2lV
 WCeV3Qw4kt9qAOb7u+LuLd85g94XIvdx0pa4wNQyOQtzrwwVeyiCZ

On Mon, Jul 19, 2021 at 3:15 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
> On Mon, Jul 19, 2021 at 01:24:49PM +0100, Wedson Almeida Filho wrote:
> > On Fri, Jul 09, 2021 at 12:13:25AM +0200, Linus Walleij wrote:
> > > I have seen that QEMU has a piece of code for the Arm PrimeCell
> > > PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
> > > Note that this hardware apart from being used in all Arm reference
> > > designs is used on ARMv4T systems that are not supported by
> > > LLVM but only GCC, which might complicate things.
> >
> > Here is a working PL061 driver in Rust (converted form the C one):
> > https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs
>
> I'm also attaching an html rending of the C and Rust versions side by side where
> I try to line the definitions up to make it easier to contrast the two
> implementations.

Thanks a lot, this looks extremely helpful!

I have a couple of questions to understand some of the differences to the
C version, and what the reasons are for those:

- All the dev_dbg() seem to be replaced with pr_debug!(). Does that mean
  we lose the information about the device instance in the output, or is
  that magically added back?

- There is a lock of type IrqDisableSpinLock, which sounds like it would
  correspond to a spinlock_t that is always locked with spin_lock_irqsave(),
  but the original driver uses raw_spin_lock_irqsave(). Does that mean it
  won't work on CONFIG_PREEMPT_RT until both types are supported?

- What's with all the CamelCase? Is that enforced by the language, or
  can we use the same identifiers here that we have in the C version?

- What is the mechanism behind power::Operations that replaces the
   #ifdef CONFIG_PM of the C version? Will the rust compiler just drop
   the dead code when CONFIG_PM is disabled?

      Arnd

