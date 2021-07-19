Return-Path: <ksummit+bounces-414-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A43CEFB4
	for <lists@lfdr.de>; Tue, 20 Jul 2021 01:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 224021C0F2D
	for <lists@lfdr.de>; Mon, 19 Jul 2021 23:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BD82FB6;
	Mon, 19 Jul 2021 23:22:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A670
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 23:22:03 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 0065BC689B
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 22:57:59 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7D657200004;
	Mon, 19 Jul 2021 22:57:51 +0000 (UTC)
Date: Tue, 20 Jul 2021 00:57:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wedson Almeida Filho <wedsonaf@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPYDb0Z19qohUjua@piout.net>
References: <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <YPV7DTFBRN4UFMH1@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPV7DTFBRN4UFMH1@google.com>

Hello,

On 19/07/2021 14:15:57+0100, Wedson Almeida Filho wrote:
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

I'd love to have a side by side disassembly of the generated object
files (ideally intermixed with the source).


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

