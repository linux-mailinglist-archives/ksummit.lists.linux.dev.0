Return-Path: <ksummit+bounces-652-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA0550431
	for <lists@lfdr.de>; Sat, 18 Jun 2022 13:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 27E4F2E09FF
	for <lists@lfdr.de>; Sat, 18 Jun 2022 11:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769942599;
	Sat, 18 Jun 2022 11:16:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826007B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 11:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781BCC3411A;
	Sat, 18 Jun 2022 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655550973;
	bh=RJpPFToWyREP9oTwDYrBftJAL/JgBShndx+Y8Q+Kk3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s7qDWkK7fJAWLtXQ/bbaVkFbd5NIaMXaeVDTxaQ1xWMczuJzof4M5f6ip/Z9pDenv
	 Ew+YsQcByDfr/QNlZ/klMV4RF9zqFEWJHjnEUZyLYnB+Bhe6kuzRo5K4VOD53V3ft9
	 kQHqvHPVbvMl+PZpwKIZWJEM6/8KKEfU1XGAuBM1kIm2Kw4ElczRBArlX6pfg6mNqX
	 HoARr7yulHacLGLCtNUYEuwJCAJoI7WOt1i0Pn8VAFLtU3SrqQUTU5BG3mB2UqSEZw
	 Q7v52D1a8lPywzZynzzBjOkJDM6YCtYxSCW6SFQoMu24BQRH+Im4CxniEIaBJsgAkd
	 9UZHzeF4M2LpA==
Date: Sat, 18 Jun 2022 12:16:06 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit
 <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220618121606.755e40df@sal.lan>
In-Reply-To: <CANiq72kafybxPbS13g+heYMX=Ggmw_8MqYj41uJ0Ek=3HP7-eA@mail.gmail.com>
References: <87sfo3nh3t.fsf@meer.lwn.net>
	<20220618092447.5ebed314@sal.lan>
	<CANiq72kafybxPbS13g+heYMX=Ggmw_8MqYj41uJ0Ek=3HP7-eA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 18 Jun 2022 13:03:38 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> escreveu:

> On Sat, Jun 18, 2022 at 10:24 AM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> >
> > Life would be a lot easier on this side if rustdoc could
> > support ReST.  
> 
> Not sure what you mean by this. Do you mean writing ReST for Rust
> documentation? For the files inside `Documentation/rust/`, we already
> use ReST [*] like the rest. For the source code docs (the ones handled
> by rustdoc), it outputs HTML. Or do you mean using rustdoc to generate
> `Doc/`s or similar?

I meant that rustdoc could generate ReST output, being included inside
the Kernel documentation on a way similar to kerneldoc. This would
integrate better with our building system, which can produce output docs
on 3 different formats (html, epub and pdf).

Regards,
Mauro


> 
> [*] Though it would be nice to be able to use Markdown (but that is a
> different topic).
> 
> Cheers,
> Miguel

