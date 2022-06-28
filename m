Return-Path: <ksummit+bounces-736-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35855C081
	for <lists@lfdr.de>; Tue, 28 Jun 2022 13:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F128280CB1
	for <lists@lfdr.de>; Tue, 28 Jun 2022 11:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E092588;
	Tue, 28 Jun 2022 11:01:49 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14391257A
	for <ksummit@lists.linux.dev>; Tue, 28 Jun 2022 11:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6902C341CA;
	Tue, 28 Jun 2022 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656414107;
	bh=51Hx7Rxwg1ttqY5xugIQOiYlgKFZfqgPB5EvlE4L0YE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VzxPfxCsYZnv2/lwjXt3FmoApSpM561oGnLyk634cShq/wqfzETQzHFsglPT5pD9R
	 kOb6oRUmAebWOO6fooW9KhpTDzATzmxhy0brHSZREU0eW3KaepOSLwHsQyFyeJ8je0
	 /k0DLNGGfkmWprBIGXH6j+FdRbNvGPQAA8VsbkPjwePlF2RCL4XL8Se3ltPrHzmi07
	 prbunBTw9xDZhF/xYC3N9S0AYpLR6MbA5w5g3ayZ9wK67THOO2xpxxO2XokubPwqib
	 170c9W6qr6tfa7axtLxpFZulFQE6mVYC5q2UQTK17IL4shvp8k+AWpt2aXLdIkEsCN
	 q8mfTu3/amurQ==
Date: Tue, 28 Jun 2022 12:01:42 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Markus Heiser
 <markus.heiser@darmarit.de>, Jani Nikula <jani.nikula@intel.com>, ksummit
 <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Message-ID: <20220628120142.4fe254f7@sal.lan>
In-Reply-To: <CAMuHMdW_EkQ8pSgJjrZtBXXkitRv2Wq+fP4wCnPmyvaPQO-kxA@mail.gmail.com>
References: <87sfo3nh3t.fsf@meer.lwn.net>
	<20220618092447.5ebed314@sal.lan>
	<875ykrrb45.fsf@intel.com>
	<20220623105747.079ac92b@sal.lan>
	<87a6a38plu.fsf@meer.lwn.net>
	<20220624083307.159824bd@sal.lan>
	<963dd061-47ba-6f96-72e2-4f34cc952b8c@darmarit.de>
	<87fsjqyvlx.fsf@meer.lwn.net>
	<20220628084317.2f033ad5@sal.lan>
	<CAMuHMdW_EkQ8pSgJjrZtBXXkitRv2Wq+fP4wCnPmyvaPQO-kxA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 28 Jun 2022 09:57:29 +0200
Geert Uytterhoeven <geert@linux-m68k.org> escreveu:

> Hi Mauro,
> 
> On Tue, Jun 28, 2022 at 9:43 AM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> > Em Mon, 27 Jun 2022 09:27:54 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:  
> > > Markus Heiser <markus.heiser@darmarit.de> writes:  
> > > > IMO It is unnecessary that the build-chain must run on all
> > > > platforms and with all distributions.
> > > >
> > > > Who observes the Sphinx-doc & docutils development since (>15)
> > > > years is aware that with various (old) Sphinx-doc & docutils
> > > > versions no stable results can be produced, not without
> > > > complicating the build-chain.  And this is exactly the situation
> > > > we are facing today.
> > > >
> > > > The build chain of documentation has nothing to do with kernel
> > > > development (at least in my opinion) and should be decoupled from it:
> > > > maintaining one defined build environment is enough work ... this
> > > > becomes especially clear if you (as Jani recommends) rely more on
> > > > sphinx-modules and widely used tools.  
> > >
> > > The counterargument to this is that we want as many developers as
> > > possible to be able to build the docs and contribute to them.  We can't
> > > complain that developers have broken the docs build if we don't do what
> > > we can to help them do the build themselves.  
> >
> > Agreed.
> >  
> > > One of our longstanding contributors is on Sphinx 1.8.5:
> > >
> > >   https://lwn.net/ml/linux-doc/4c403239-3c71-4ab9-2168-f7e9d77008b2%40infradead.org/  
> 
> Ubuntu 20.04 LTS also has 1.8.5.
> Looks like I'll get 4.3.2 after upgrading to 22.04 LTS (which is only
> about two months old).

Yeah, LTS distros are the main reason why the default recommendation is to
install Sphinx via virtualenv/venv.

With RHEL9, SUSE 15 SP4 (plus CenOS and openSUSE Leap versions of them),
plus Ubuntu 22.04, maybe we can change the default to recommend installing
it via distro-provided packages. Yet, Debian bulseye has 2.5.0. Only
bookworm, scheduled for mid 2023, will come with Sphinx > 2.

Regards,
Mauro




