Return-Path: <ksummit+bounces-282-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4563BE6BA
	for <lists@lfdr.de>; Wed,  7 Jul 2021 12:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0F7453E0FE0
	for <lists@lfdr.de>; Wed,  7 Jul 2021 10:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914E72FAD;
	Wed,  7 Jul 2021 10:56:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD8872
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 10:56:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.83,331,1616454000"; 
   d="scan'208";a="518755272"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 12:56:15 +0200
Date: Wed, 7 Jul 2021 12:56:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Mark Brown <broonie@kernel.org>
cc: Linus Walleij <linus.walleij@linaro.org>, 
    Roland Dreier <roland@kernel.org>, 
    Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
In-Reply-To: <20210707105000.GA4394@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2107071251500.10037@hadrien>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com> <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com> <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com> <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 7 Jul 2021, Mark Brown wrote:

> On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier <roland@kernel.org> wrote:
>
> > > "devres" / devm_xxx was an attempt to deal with this in C, but it only
> > > solves some cases of this and has not received a lot of adoption (we
> > > can argue about the reasons).
>
> > Really? From my point of view that is adopted all over the map.
> > I add new users all the time and use it as much as I can when
> > writing new drivers.
>
> Yes, it's *super* widely used in most of the kernel.  Perhaps there's
> some subsystems that reject it for some reason.
>
> > I think it's a formidable success, people just need to learn to do it more.
>
> There *are* issues with people adopting it too enthusiastically - as
> well as the memory lifetime issues that Laurent mentioned it's easy for
> it to cause problems with interrupt handlers that are left live longer
> than they should be and try to use things that were already deallocated.

I was also wondering what would be done with Rust in the case of this
issue.

julia

