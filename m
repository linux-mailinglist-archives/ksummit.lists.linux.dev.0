Return-Path: <ksummit+bounces-2124-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7955B21AF3
	for <lists@lfdr.de>; Tue, 12 Aug 2025 04:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAE504619EA
	for <lists@lfdr.de>; Tue, 12 Aug 2025 02:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484E0238C29;
	Tue, 12 Aug 2025 02:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMC4vhq+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15BD26AE4
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754966952; cv=none; b=r80mhotmGH2oJ68fRwWFUJxHUuPHbCc1Tt8h1ajx8G/a6wmiprKhxpljVMQRHjGjreaNA0suascAxgaRD/6fYtyHeGn5qxOQ1/z9YyuAmi13tqJ70sJh6SFJD5diPq4zr6g5tet6VJP1feYLjxAzIHTUx6B3aAaq0sTn7JYylAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754966952; c=relaxed/simple;
	bh=9INUe6HVpnCt1Ph+ydcU7CEdcXqEzCnyQiOZQlGQBKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0LVbH447XmS/qvne6nPibf4LwytUwFHRqOwdoGP31oAifVPetbXgxNAy27ZedcepqonmKT9RkEH6ejVBlpauKutUxOZDjnQnQapEU37smqaWBCcR9uTfJYOcsgPkNQ1Bn/heX1F1B8RWnYkQj6/zTnseRCv3lLz2kPNn6hVKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMC4vhq+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392DAC4CEED;
	Tue, 12 Aug 2025 02:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754966952;
	bh=9INUe6HVpnCt1Ph+ydcU7CEdcXqEzCnyQiOZQlGQBKc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=pMC4vhq+jNcS18GS3OBG1H/kR86CClGkXBUWsXf65VDFvPcRys4XRiP1RK/fjPZ77
	 DFgLCn3sy1S2Vq6Ev1rBm2SJeLd1+Uju6gNxSOohwFN7pG9dm8p9AKZVLTSVPp9zBo
	 P9DcpiGOEd7yfeAcqv3TgS4cKAUsAqznbvNu9pjipjDdg1eFOoFXgtQMf3w63DURBA
	 D+o7EfpaqStWVxA+hnV15qy1YC4QdjcsK2pKGu5zaEg53v7jDb52S4D8zgC8i/ni1Q
	 4ZsUGAH24kMmnUMSkgRkUecyAbmMq92LaReZW4s86yyWPpze2ielq49LtV8mgtiB4b
	 UL9/1erjw6KkQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D52AACE0965; Mon, 11 Aug 2025 19:49:11 -0700 (PDT)
Date: Mon, 11 Aug 2025 19:49:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <59023286-9f7d-4942-9a86-1194d5a2b7ea@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
 <aJp7LbfETVBH5L0A@bombadil.infradead.org>
 <d3fc52c9-e3af-401d-8691-c0cf268012a2@paulmck-laptop>
 <aJqEixWutuD-J58E@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJqEixWutuD-J58E@bombadil.infradead.org>

On Mon, Aug 11, 2025 at 05:02:19PM -0700, Luis Chamberlain wrote:
> On Mon, Aug 11, 2025 at 04:42:18PM -0700, Paul E. McKenney wrote:
> > On Mon, Aug 11, 2025 at 04:22:21PM -0700, Luis Chamberlain wrote:
> > > On Mon, Aug 11, 2025 at 03:51:48PM -0700, Paul E. McKenney wrote:
> > > > On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:
> > > > > c) If something like the Generated-by tag is used, and we trust it, then
> > > > >    if we do want to side against merging AI generated code, that's perhaps our
> > > > >    only chance at blocking that type of code. Its however not bullet proof.
> > > > 
> > > > Nothing is bullet proof.  ;-)
> > > 
> > > Agreed, and I think the legal concerns over AI code use are just as weak. I
> > > just don't see it holidng up long term.
> > 
> > That is quite possible.  But on what are you basing that legal opinion?
> 
> Its not a legal opinion. Its a personal opinion based on projections on
> growth, adoption, and personal risk analysis, and valuation for my own projects.
> At some point a project needs to take a positon on this, I had decide
> sooner for another project.

Your project, your opinion, so questions asked.  From me, anyway.

But...

> > > My expectations are that eventually foundation AI models will simply state they
> > > use permissively licensed code for training, and be done with these concerns.
> > > 
> > > Until then -- we just have wild speculations and I can't see any
> > > sensible case ending up in court wanting to avoid AI code in open source.
> > 
> > I don't know about open source, but they tell me that related cases are
> > already in court.  Yes, there was a recent decision that was favorable
> > to your position, which is great, but not necessarily either definitive
> > or final.
> 
> Indeed, its a risk assessment in the end.
> 
> Let us take an example. If one is using foundation models perhaps the
> ugliest position you could be in, is if you want to avoid GPL code on a
> non-GPL codebase. Since we don't have access to AI model training
> logistics, if we just work out of the code on Github the numbers I
> came up with was about 60% permissively licensed code, 25% GPL, 15%
> unclear. Give or take.
> 
> If you're using copyleft code though, well, the project is already open.
> So what's the risk assessment? Well who and why would they go after your
> project? My risk assessment for my projet is low, and due the high
> empirical value I already see in leveraging AI code, I think its worth to
> embrace.

Sadly, there is precedent for people going after copyleft projects.

> Eventually I predict foundation models will just take a position to
> annotate where what code they train their models on and I suspect that
> will be permissively licensed code. By the time this happens most of the
> code we know written by humans will have been replaced already.

Perhaps.  But on the other hand, there is a lot of code still in use
that was written by humans who have long since passed on.  So I am not
convinced that code replacement will happen all that quickly.

Or maybe you are saying that it will be a good long time before AI
projects implement the kind of traceability that we are discussing?

							Thanx, Paul

