Return-Path: <ksummit+bounces-1065-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6FB787A5B
	for <lists@lfdr.de>; Thu, 24 Aug 2023 23:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 473402816D3
	for <lists@lfdr.de>; Thu, 24 Aug 2023 21:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4C38F7F;
	Thu, 24 Aug 2023 21:29:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7947F
	for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 21:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0352C433C8;
	Thu, 24 Aug 2023 21:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692912593;
	bh=PYCQRWg6gE5Fkh0TxzrpOH46KgD4jOR+HFQoTkYbXdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Dtu9u0GC3XCLcqaXIbyNv5akDohYY0W5dBXLPqQRTR4r2alpfRxOng2jPJ9tO0Lh6
	 XNpJz9p2blQHWQKcIOviUN5bzBJ/BsJ9FQ3bEdyjFLiHrFdScIJkCPVVw+Diwuv1lm
	 kEyseVr8J7AY65L0P7YNfgokDc7dI4poyUF8jFycJ9sGnGQtO+ucgL4f5sSbriPQgo
	 KFNrn61OlV/0axh18QyyaY7Wxk0WQy5A5ICHycjQNzfGEXfC9J8n1PnWRNPcRDFnoZ
	 7WKz7VXceAkcQZRfZO/VWTzQE314c1uZTzipW/Iw/uPun5LII5HUmgDYDRSLS4NT2Y
	 Bfdf8mBkIrXaQ==
Date: Thu, 24 Aug 2023 22:30:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>, Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik
 <josef@toxicpanda.com>, ksummit@lists.linux.dev, Jeff Layton
 <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230824223009.5d4ad0a4@jic23-huawei>
In-Reply-To: <20230818152629.GA13558@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
	<ZN0uNrpD8JUtihQE@bombadil.infradead.org>
	<20230817093914.GE21668@pendragon.ideasonboard.com>
	<44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
	<20230817081957.1287b966@kernel.org>
	<CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
	<CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
	<20230818152629.GA13558@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Aug 2023 18:26:29 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Fri, Aug 18, 2023 at 03:55:11PM +0200, Linus Walleij wrote:
> > Alexei, thanks for returning the conversation
> > to this very important topic.
> >=20
> > On Fri, Aug 18, 2023 at 1:55=E2=80=AFAM Alexei Starovoitov wrote:
> >  =20
> > > BPF has solid CI that helps a lot, but the maintainer burnout is acut=
ely felt.
> > > The main reason for burnout is patch flood. =20
> >=20
> > I agree this is an important cause.
> > Even worse is any kind of social conflict or bad mood in the community.
> > Science has studied stress, what we mostly run into is called "microstr=
ess".
> > https://en.wikipedia.org/wiki/Psychological_stress
> >  =20
> > > The maintainer's day looks like non-stop code review.
> > > The patch backlog just doesn't end. =20
> >=20
> > I've been there too :( =20
>=20
> I think most of us know the feeling. Personally, if my workload reaches
> 100% review for an extended period of time, without having any time for
> "fun" activities such as hacking, I'm pretty sure my review efficiency
> drops drastically. Maybe that's call burn out.

Agreed. Return from vacations is particularly painful. I'm lucky in that
I have some excellent reviewers for IIO who seem to mostly do it for fun but
I've hit rock bottom a few times in the past and reached out to major
contributors (companies) who have stepped up to help.

Other areas I'm involved in are still at the earlier stage where everyone
wants the subsystem to do more and there is good understanding that
won't happen without many people stepping up to review. (e.g. CXL)

>=20
> > > We're trying to encourage active developers to be code reviewers as w=
ell
> > > via positive/negative scores:
> > > https://lore.kernel.org/bpf/ZJx8sBW%2FQPOBswNF@google.com/
> > >
> > > It doesn't help much yet. All incoming kernel contributors assume
> > > that it's a maintainer's job to do code reviews.
> > > Developers just send patches and wait. It doesn't occur to them that
> > > reviewing other patches will help them land their own. =20
> >=20
> > The DRI/DRM community has group maintainership that works a little
> > bit.
> > Essentially it boils down to ask people to review your stuff and you
> > will review and also merge their stuff in return.
> > Sometimes this works.
> > Especially if you are a circle of acquaintances working full
> > time on similar things, yay! So much support.
> > When you are a sporadic contributor it doesn't work as well.
> > Because you cannot always find some matching contribution to
> > review and you feel like begging.
> > So different solutions for different contributors may be needed. =20
>=20
> I've also experienced mixed results from "trading reviews". It's
> certainly nice on paper, and it works sometimes, especially when asking
> contributors to review patches that are directly related to their
> business interest. I remember asking a contributor from a large company
> to help me with reviews, to free some of my time to review their
> patches.=20

Personally I like to point out to our kernel teams that if a maintainer
is ignoring you (too busy), the best thing is to help (guilt trip) them
by reviewing anything else you can find they haven't gotten to yet.
Added 'benefit' beyond learning more about the area is you often end
suggesting changes for the other outstanding patches resulting a new version
of their patches that is further down in patchwork or similar so maintainer
tends to get to yours quicker...

> The contributor helped with reviewing third-party contributions
> to the driver they're actively working on. When I asked for help
> reviewing an entirely separate driver that their employer had no
> business interest in, however, I faced the "we're busy and don't have
> time" argument.

Absolutely - it's much easier when you can find someone who at least
somewhat cares about the code that needs reviewing.

>=20
> Maybe part of the solution here, to share the maintenance burden, is to
> expect contributors, especially the ones with large financial resources,
> to spent a certain percentage of their time reviewing code that is in
> their area of expertise but not in their area of business interest.

It's hard to encourage that expectation. I've had many internal
conversations about this in Huawei and we are trying a few things,
but it's not trivial to pull off even with the right noises from
senior management.

Jonathan




