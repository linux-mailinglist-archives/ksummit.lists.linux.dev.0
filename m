Return-Path: <ksummit+bounces-2123-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53720B219A6
	for <lists@lfdr.de>; Tue, 12 Aug 2025 02:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A7521A243D2
	for <lists@lfdr.de>; Tue, 12 Aug 2025 00:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7DBDF76;
	Tue, 12 Aug 2025 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHBmgbTD"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B33C2F
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754956941; cv=none; b=S2vvdoXz6gsOGe9RkFt2xy5OWwpM5aG0VEMB9wxTPwSmRnw7rvywBR8zK+aaRRit+1bfkcaDEx5dEUHDrzjzyHnymxG+Gusjkf52wajO9qEu44TnHilLgKlasfpBc/ekXsToktnA8A/JKcjv53UE8/lvc5ham5InDGBh9FXQwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754956941; c=relaxed/simple;
	bh=7J/jYtRTY7CsjlgXP+bZ542ZDXW+yO9bJ8JG97i/oqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/3Nteczidk++ayaVPQ+zeAexEIN4dswts41f2QnekEMt6oQTdzJWkrb7ZVhwUwU+tK+HmVX94v5AlkFbg8xRtDxTYT54k3mekIJj938klgVPbcFciy6WFv3vySNCHWx/BZeJAanY/IVsDQ4ZJ1LYOt4ycUIjFcGJXiBt7SQpz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHBmgbTD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34867C4CEED;
	Tue, 12 Aug 2025 00:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754956941;
	bh=7J/jYtRTY7CsjlgXP+bZ542ZDXW+yO9bJ8JG97i/oqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHBmgbTDlMDa13WJ31t9YeSop9MTCX5N/kB9qT5fFiom3XunI2nryvn6vG+yQ7rp9
	 pO7DKwsRtALfQBABZZqMQuCON7rIOIZLcWP+/DVoMJh3fd3TvXUJM/x5ShFyKMoUQ8
	 QR0dqO208WCM+YttrQGrToA0+A/2JfZGBMk+vSJxnZUd7pKf+2jIBvliNR/yyZOS79
	 wEOS4DPUAnYptNqsBpPzbt6pBkr0Pvg5OzAX3orMD91RqDyxJ5r7Dg+bGOdtTT9HQW
	 flVeOdPwg5LXqvBOdMo7apulPPYB1kQi7VNGhr/Ubi0Y0Lemx8FSuRbY+Vxz1F09b4
	 aSlRzUIlYxjLw==
Date: Mon, 11 Aug 2025 17:02:19 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <aJqEixWutuD-J58E@bombadil.infradead.org>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
 <aJp7LbfETVBH5L0A@bombadil.infradead.org>
 <d3fc52c9-e3af-401d-8691-c0cf268012a2@paulmck-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3fc52c9-e3af-401d-8691-c0cf268012a2@paulmck-laptop>

On Mon, Aug 11, 2025 at 04:42:18PM -0700, Paul E. McKenney wrote:
> On Mon, Aug 11, 2025 at 04:22:21PM -0700, Luis Chamberlain wrote:
> > On Mon, Aug 11, 2025 at 03:51:48PM -0700, Paul E. McKenney wrote:
> > > On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:
> > > > c) If something like the Generated-by tag is used, and we trust it, then
> > > >    if we do want to side against merging AI generated code, that's perhaps our
> > > >    only chance at blocking that type of code. Its however not bullet proof.
> > > 
> > > Nothing is bullet proof.  ;-)
> > 
> > Agreed, and I think the legal concerns over AI code use are just as weak. I
> > just don't see it holidng up long term.
> 
> That is quite possible.  But on what are you basing that legal opinion?

Its not a legal opinion. Its a personal opinion based on projections on
growth, adoption, and personal risk analysis, and valuation for my own projects.
At some point a project needs to take a positon on this, I had decide
sooner for another project.

> > My expectations are that eventually foundation AI models will simply state they
> > use permissively licensed code for training, and be done with these concerns.
> > 
> > Until then -- we just have wild speculations and I can't see any
> > sensible case ending up in court wanting to avoid AI code in open source.
> 
> I don't know about open source, but they tell me that related cases are
> already in court.  Yes, there was a recent decision that was favorable
> to your position, which is great, but not necessarily either definitive
> or final.

Indeed, its a risk assessment in the end.

Let us take an example. If one is using foundation models perhaps the
ugliest position you could be in, is if you want to avoid GPL code on a
non-GPL codebase. Since we don't have access to AI model training
logistics, if we just work out of the code on Github the numbers I
came up with was about 60% permissively licensed code, 25% GPL, 15%
unclear. Give or take.

If you're using copyleft code though, well, the project is already open.
So what's the risk assessment? Well who and why would they go after your
project? My risk assessment for my projet is low, and due the high
empirical value I already see in leveraging AI code, I think its worth to
embrace.

Eventually I predict foundation models will just take a position to
annotate where what code they train their models on and I suspect that
will be permissively licensed code. By the time this happens most of the
code we know written by humans will have been replaced already.

  Luis

