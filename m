Return-Path: <ksummit+bounces-422-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 868363CFA72
	for <lists@lfdr.de>; Tue, 20 Jul 2021 15:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id C1F143E1071
	for <lists@lfdr.de>; Tue, 20 Jul 2021 13:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC652FB6;
	Tue, 20 Jul 2021 13:21:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49272
	for <ksummit@lists.linux.dev>; Tue, 20 Jul 2021 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yzYqI5fPyt9Uopnm9h328lSxRcBF9m2iX9L41EB/KoQ=; b=DpN5NdPsHN0phHtr+3iKBzgXb+
	P3yWi33mD/S1rm6D2Eh3I6pDT0N47DCVRmUYuQQxe8iW5AZMuFPYfkmWpAd1La2hFFOyUK/w+XW1d
	M178VMhB7K2xVAb/vEFQZv0HFbDDwHyB7Vbfuoh+nbyo3nK8z9Sl4D1/ervxDmLhgrfM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1m5pgi-00E3So-SJ; Tue, 20 Jul 2021 15:21:32 +0200
Date: Tue, 20 Jul 2021 15:21:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <YPbN3G6qgaeABWEW@lunn.ch>
References: <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <CACRpkdZE+tnS1qV3xC0tDV1aSxBtfJq81+eBtkrovCgOOUimwA@mail.gmail.com>
 <YPWPbbqdG3aFCmAZ@google.com>
 <CACRpkdYqfYrhWT2kZ0uy8hS__EfVmQdq8X5ev6Oke+WQWfiDSg@mail.gmail.com>
 <YPYk4gSGJrGvg+M+@google.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPYk4gSGJrGvg+M+@google.com>

On Tue, Jul 20, 2021 at 02:20:34AM +0100, Wedson Almeida Filho wrote:
> On Tue, Jul 20, 2021 at 12:16:32AM +0200, Linus Walleij wrote:
> > On Mon, Jul 19, 2021 at 4:42 PM Wedson Almeida Filho
> > <wedsonaf@google.com> wrote:
> > 
> > > > I think people want to see the code inside these classes as well,
> > > > can we browse it?
> > >
> > > The whole tree is available here: https://github.com/wedsonaf/linux/tree/pl061
> > > -- I should caution you that the two most recent commits are not merged into the
> > > rust tree yet because they're WIP. (I'll clean them up and eventually merge
> > > after the feedback from you all.)
> > 
> > I found that the gpio_chip C wrappers lives here:
> > https://github.com/wedsonaf/linux/blob/pl061/rust/kernel/gpio.rs
> > 
> > This file is very interesting!
> > 
> > I think it's not a good idea to keep these wrappers in their own
> > rust directory, they need to be distributed out into the kernel
> > everywhere they are used. We have made this mistake before
> > with OF (device tree) that started exactly like this in
> > drivers/of/*, and now I have part of the OF GPIO handling
> > and tests inside files in that directory as a consequence.
> 
> That's great feedback. Our plan was to have the core parts in `rust/kernel`, but
> once maintainers got involved, we would place things where it made more sense.
> Since we have no maintainers involved in development yet, everything is in rust/
> for now.

Part of the issue here is -stable and back porting fixes. If files
move around within the tree, it makes this back porting harder. git
cherry-pick is a lot less likely to work, it needs more manual
intervention. I expect it will make the stable teams job much easier
if these files are in the right place from day 1 and never move.

   Andrew

