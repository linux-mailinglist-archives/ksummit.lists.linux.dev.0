Return-Path: <ksummit+bounces-407-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297823CEB1B
	for <lists@lfdr.de>; Mon, 19 Jul 2021 20:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id C97B83E10ED
	for <lists@lfdr.de>; Mon, 19 Jul 2021 18:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677392FB3;
	Mon, 19 Jul 2021 18:48:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522A8168
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 18:47:59 +0000 (UTC)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 759AE610D0;
	Mon, 19 Jul 2021 18:47:57 +0000 (UTC)
Date: Mon, 19 Jul 2021 14:47:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann
 <arnd@arndb.de>, Wedson Almeida Filho <wedsonaf@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Kees Cook <keescook@chromium.org>, Jan Kara
 <jack@suse.cz>, James Bottomley <James.Bottomley@hansenpartnership.com>,
 Julia Lawall <julia.lawall@inria.fr>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>,
 ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210719144756.307e5d4d@oasis.local.home>
In-Reply-To: <CANiq72n706_u-q3=rTL9UCNhJrji3VvOpGg+6uoEttBWWpVfrw@mail.gmail.com>
References: <YOX+N1D7AqmrY+Oa@google.com>
	<20210707203827.GI18396@quack2.suse.cz>
	<YOY0HLj5ld6zHJHU@google.com>
	<YOaW/pR0na5N9GiT@kroah.com>
	<YOb/aJC2VuOcz3YY@google.com>
	<YOdJLYmUkoMyszO7@kroah.com>
	<CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
	<CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
	<CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
	<YPVvEZgcP1LMGjcy@google.com>
	<YPV7DTFBRN4UFMH1@google.com>
	<CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
	<CAMuHMdV1M0jEMGNn4MNKULGWb-EXOBus8sQXFC5-iiySEcReRw@mail.gmail.com>
	<CANiq72n706_u-q3=rTL9UCNhJrji3VvOpGg+6uoEttBWWpVfrw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Jul 2021 20:24:51 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Mon, Jul 19, 2021 at 4:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Turns out "a..b" in Rust does mean "range from a to b-1".
> > That's gonna be hard to (un)learn...  
> 
> It may help to think about it as the usual `for` loop in C, typically
> written with `<` and the "size" (instead of `<=` and the "size - 1"),
> i.e.:
> 
>     for i in 0..N
>     for (i = 0; i < N; ++i)
> 

Or think of it as the python range() function, but not as a git log, where

	git log sha1..sha2

is a list of commits from sha1 + 1 through to sha2 inclusive :-p

-- Steve

