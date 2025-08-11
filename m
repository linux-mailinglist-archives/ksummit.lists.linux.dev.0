Return-Path: <ksummit+bounces-2122-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D525CB2197A
	for <lists@lfdr.de>; Tue, 12 Aug 2025 01:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89253AA0EC
	for <lists@lfdr.de>; Mon, 11 Aug 2025 23:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549072153E7;
	Mon, 11 Aug 2025 23:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhWfefAG"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA34158DAC
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 23:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754955738; cv=none; b=HnjIguD4sqlhWW7HyLYXKE9xSRoGvog+c/binMU6qRHbmUkvL0VaTZv2fPvvdDSdKlWh5x0m+6BTlr/8QmCH7nK07ytYEn9XMVSBj8RejxkO5onVQkTEhV4oJbrhQ6a9Pux7vu/iDeRaSEdzRSrNg6I6QKkdTUJofoc016eD2fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754955738; c=relaxed/simple;
	bh=XTwcXBilEcdlJh7I6dV0Yc1xvgIaX8iiOOnafvD5slc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtZd2WQMe+xLE8pK49ukUBlKoYc0B3429wVy/SX2JoL9afU7hIMF61WgZvkCforT4q7OzvqWcrVKXbAU67oQNU6BNJtApM3mZ38uGuuVd0FnG20ggDWDt31yh9itz+/7u8N54GOtnCRQmtndp4KWoF+2B5SjYT6XigQtFSjJOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhWfefAG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924E6C4CEED;
	Mon, 11 Aug 2025 23:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754955738;
	bh=XTwcXBilEcdlJh7I6dV0Yc1xvgIaX8iiOOnafvD5slc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=XhWfefAG58Pv7k8sPvIQOMlicSDHzv+7kLNy4WMRc686iaztf4v+llFM1B+NwsBvm
	 89y2G7Dlqzdd8QFPlnfmg0GfETsq64p1bnKhrsHWC57xYLIiGhJI+CN2x1SsB55Vni
	 s/Kz6/nTozw6ZEelnr9KhVKM2VPyUGY+BRovds4xqpxrHK49EicTx8Fg5qVB5WUpVh
	 s9BLcV6lMVQjHXtMj1Z+PpUg+GWDiR/7vyzXuxfKnZW0mlxADucR4FSQacIJL6IG2B
	 /XYpV/FoYxt+j4zYVq0poDyWzqYjJY2/sxOGtvDN3vFvsF5Da66W+KuTldIDRQ0rAH
	 zmK0taVekzXZQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3A8BCCE0965; Mon, 11 Aug 2025 16:42:18 -0700 (PDT)
Date: Mon, 11 Aug 2025 16:42:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <d3fc52c9-e3af-401d-8691-c0cf268012a2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
 <aJp7LbfETVBH5L0A@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJp7LbfETVBH5L0A@bombadil.infradead.org>

On Mon, Aug 11, 2025 at 04:22:21PM -0700, Luis Chamberlain wrote:
> On Mon, Aug 11, 2025 at 03:51:48PM -0700, Paul E. McKenney wrote:
> > On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:
> > > b) seems kind of too late
> > 
> > Why?
> 
> One cannot assume at this point AI generated code has not been merged
> into any large scale open source project.

I agree that it is quite possible that AI-generated code has already been
merged into large-scale open-source projects, including the Linux kernel.
I do not see why this possibility requires us to merge AI-generated code
in the future.

> I am also not sure it can be stopped.

As noted below, nothing is bullet proof.

> > > c) If something like the Generated-by tag is used, and we trust it, then
> > >    if we do want to side against merging AI generated code, that's perhaps our
> > >    only chance at blocking that type of code. Its however not bullet proof.
> > 
> > Nothing is bullet proof.  ;-)
> 
> Agreed, and I think the legal concerns over AI code use are just as weak. I
> just don't see it holidng up long term.

That is quite possible.  But on what are you basing that legal opinion?

Also, even if you have a valid legal opinion that stands up long-term,
situations that prove to be just fine in the long term can be extremely
uncomfortable in the meantime.

> My expectations are that eventually foundation AI models will simply state they
> use permissively licensed code for training, and be done with these concerns.
> 
> Until then -- we just have wild speculations and I can't see any
> sensible case ending up in court wanting to avoid AI code in open source.

I don't know about open source, but they tell me that related cases are
already in court.  Yes, there was a recent decision that was favorable
to your position, which is great, but not necessarily either definitive
or final.

> > At the same time, I have no idea whether or not a Generated-by tag is
> > a good idea.
> 
> I do that to make it crystal clear for a project maintainer when I use it.

I understand and sympathize with your intent, but I do not have an
informed opinion on the risks in either direction.

							Thanx, Paul

